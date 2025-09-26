import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/assets.dart';
import 'package:islami_app/core/constants/constants.dart';
import 'package:islami_app/core/models/sura_data.dart';
import 'package:islami_app/core/routes/pages_route_name.dart';
import 'package:islami_app/core/services/local_storage_keys.dart';
import 'package:islami_app/core/services/local_storage_services.dart';
import 'package:islami_app/modules/layout_view/quran/widgets/recently_sura_widget.dart';
import 'package:islami_app/modules/layout_view/quran/widgets/sura_list_widget.dart';
import 'package:islami_app/theme/color_pallete.dart';

class QuranView extends StatefulWidget {
   const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    loadRecentData();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.quranBackgroundImg),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 10,
          children: [
            Image.asset(
              Assets.headerLogoImgQuranScreen,
              height: 170,
              fit: BoxFit.scaleDown,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(onChanged: (value) {
                searchQuery = value;
                search();
                setState(() {

                });
              },
                cursorColor: theme.primaryColor,
                decoration: InputDecoration(
                  prefixIcon: ImageIcon(
                    AssetImage(Assets.quranIcn2),
                    color: theme.primaryColor,
                  ),
                  hintText: "Sura Name",
                  hintStyle: theme.textTheme.bodyLarge,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: theme.primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: theme.primaryColor),
                  ),
                ),
              ),
            ),
            Visibility(visible: searchQuery.isEmpty ,replacement:SuraListWidget(onSuraTab: onSuraTab, suraData: searchSuraList) ,
              child: Column(children: [
                recentSuraList.isNotEmpty ? RecentlySuraWidget(
                    suraDataModel: recentSuraList)
                    :
                Center(child: Text("no recentSuras", style: TextStyle(
                    color: ColorPallete.primaryColor, fontSize: 24),))
                ,
                SizedBox(height: 8,),
                SuraListWidget(onSuraTab: onSuraTab, suraData: Constants.suraDataList),
              ],),
            ),

          ],
        ),
      ),
    );
  }

  List<String> recentSuraIndexList = [];
  List<SuraData> recentSuraList = [];

  onSuraTab(int index) {
    _cacheSuraIndex(index);
    Navigator.pushNamed(context, PagesRouteName.quranDetailsView,
        arguments: Constants.suraDataList[index]);
  }

  _cacheSuraIndex(int index) {
    var indexString = index.toString();
    if (recentSuraIndexList.contains(indexString)) {
      return;
    }
    if (recentSuraIndexList.length == 5) {
      recentSuraIndexList.removeLast();
    }
    recentSuraIndexList.insert(0, indexString);
    LocalStorageServices.setStringList(
        LocalStorageKeys.recentSuras, recentSuraIndexList);
    loadRecentData();
    setState(() {});
  }

  loadRecentData() {
    recentSuraIndexList = [];
    recentSuraList = [];
    recentSuraIndexList =
        LocalStorageServices.getStringList(LocalStorageKeys.recentSuras) ?? [];
    for (var index in recentSuraIndexList) {
      int indexInt = int.parse(index);
      recentSuraList.add(Constants.suraDataList[indexInt]);
    }
  }


  List<SuraData> searchSuraList = [];

  void search() {
    searchSuraList = [];
    for (var sura in Constants.suraDataList) {
      if (sura.suraNameEN.toLowerCase().contains(searchQuery.toLowerCase()) || sura.suraNameAR.toLowerCase().contains(searchQuery.toLowerCase()) ){
        searchSuraList.add(sura);
      }
    }
  }
}