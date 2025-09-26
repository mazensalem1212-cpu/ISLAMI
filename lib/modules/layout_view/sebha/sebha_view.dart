import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_app/theme/color_pallete.dart';

import '../../../core/constants/assets.dart';

class SebhaView extends StatefulWidget {
  const SebhaView({super.key});
  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView> {
  List<String> tasbehList=["سبحان الله","الحمدلله" ,"الله أكبر"  ];
  late String tasbehTitle=tasbehList[0];
  int counter=0 ;
  double turns = 0;
  int zeker_No =0;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.sebhaBackgroundImg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            Assets.headerLogoImgQuranScreen,
            height: 170,
            fit: BoxFit.scaleDown,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              style: TextStyle(
                color: ColorPallete.white,
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    Assets.sebhaHead,
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                ),
                Stack(
                  children: [
                    Positioned(
                      top: 62,
                      left: MediaQuery.of(context).size.width * 0.14,
                      child: AnimatedRotation(
                        turns: turns,
                        duration: Duration(milliseconds: 1000),
                        child: InkWell(onTap: () {
                          _update_tasbeeh();
                        } ,child: Image.asset(Assets.sebhaBody, height: 300,)),
                      ),
                    ),
                    Align(alignment: Alignment.center,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 50,),
                          Text(tasbehTitle,style: TextStyle(fontSize: 36,color: ColorPallete.white),),
                          SizedBox(height: 16,),
                          Text(counter.toString(),style: TextStyle(fontSize: 36,color: ColorPallete.white),)
                        ],
                      ),
                    )

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _update_tasbeeh() {

    counter++;
    turns = turns + (pi/33);
    if(counter==34 ){
      if(zeker_No<2) {
        zeker_No++;
        tasbehTitle = tasbehList[zeker_No];
      }
     else {
        zeker_No =0;
        tasbehTitle = tasbehList[zeker_No];
      }
      counter=0;
    }
    setState(() {});
  }
}
