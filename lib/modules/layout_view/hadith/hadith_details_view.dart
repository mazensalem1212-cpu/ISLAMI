import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/constants/assets.dart';
import 'package:islami_app/core/constants/constants.dart';
import 'package:islami_app/core/models/hadith_data.dart';

class HadithDetailsView extends StatefulWidget {
 final int index ;
  const HadithDetailsView({super.key, required this.index});

  @override
  State<HadithDetailsView> createState() => _HadithDetailsViewState();
}

class _HadithDetailsViewState extends State<HadithDetailsView> {
  HadithData? hadithData;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    loadHadithFromAssets(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: theme.primaryColor),
      child: hadithData == null ? Center(
          child: CircularProgressIndicator(color: Colors.black))

          : Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Image.asset(Assets.hadithCardImg,width: 265,height:300,alignment:Alignment.topRight , ),
              ),
              Column( children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical:  8.0),
                              child: Row(
                                children: [
                                  Image.asset(Assets.hadithLeftCorner,height: 80,width: 92),
                                  Expanded(child: Text(hadithData!.title ?? "",style: theme.textTheme.headlineSmall,textAlign: TextAlign.center,)),
                                  Image.asset(Assets.hadithRightCorner,height: 80,width: 92),
                                ],
                              ),
                            ),
                            Expanded(child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: SingleChildScrollView(child: Text(
                                hadithData!.content ?? "", textAlign:TextAlign.center ,style: theme.textTheme.bodyLarge!.copyWith(color: Colors.black),)),
                            )),
                            Opacity(opacity: .6,child: Image.asset(Assets.hadithMosqueBg,height: 55,width: double.infinity,fit: BoxFit.fill,))
              ],),
            ],
          ),
    );
  }

  Future<void> loadHadithFromAssets(int index) async {
    String hadithContent = await rootBundle.loadString(
        "assets/files/hadith/h$index.txt");
    String title = hadithContent.substring(0, hadithContent.indexOf("\n"));
    String content = hadithContent.substring(hadithContent.indexOf("\n") + 1);
    hadithData = HadithData(title: title, content: content);

    /* List hadithLines= hadithContent.split("\n");
   for(int i=0 ; i<hadithLines.length ; i++) {
     String title = hadithLines[0];
     if(hadithLines[i] !=0) {String content = hadithLines[i];}*/
    setState(() {});
  }

}

