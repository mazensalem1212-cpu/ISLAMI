import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/constants/assets.dart';
import 'package:islami_app/core/models/sura_data.dart';

class QuranDetailsView extends StatefulWidget {

   QuranDetailsView({super.key});

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  @override
  Widget build(BuildContext context) {

    final ThemeData theme = Theme.of(context);
    final data = ModalRoute.of(context)?.settings.arguments as SuraData;

    if (verse.isEmpty) {
      loadSuraDataFromAssets(data.id);
    }

    return  Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(toolbarHeight: 80,title: Text(data.suraNameEN),),
        body: Container(width: double.infinity,decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Assets.qyranDetailsBackgroundImg),fit: BoxFit.fill)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(" سورة ${data.suraNameAR}",style: TextStyle(fontFamily: "janna",
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: theme.primaryColor)),
            ),
            SizedBox(height: 25),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: ListView.separated(itemBuilder: (context, index) => Text("(${index + 1}) ${verse[index].toString()}",textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: "janna",
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: theme.primaryColor)),
                    separatorBuilder: (context, index) => SizedBox(height: 5), itemCount: verse.length),
              ),
            )
           /* for(int i=0 ; i< verse.length; i++)
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text("(${i + 1}) ${verse[i].toString()}",textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: "janna",
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: theme.primaryColor)),
              ),*/
          ]
          ),
        ),
    );
  }

  List<String> verse =[];

  Future<void> loadSuraDataFromAssets(int suraID) async{
   String suraContent = await rootBundle.loadString("assets/files/quran/$suraID.txt");
   verse= suraContent.split("\n");
   setState(() {});
  for(int i=0 ; i<verse.length ; i++)
    print(verse[i]);
  }
}
