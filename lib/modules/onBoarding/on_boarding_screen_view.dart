import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/core/models/on_boarding_data_.dart';
import 'package:islami_app/modules/layout_view/quran/widgets/on_boarding_page.dart';
import 'package:islami_app/theme/color_pallete.dart';

import '../../core/constants/assets.dart';
import '../../core/routes/pages_route_name.dart';
import '../layout_view/quran/widgets/dot_indicator.dart';

class OnBoardingScreenView extends StatefulWidget {
  const OnBoardingScreenView({super.key});

  @override
  State<OnBoardingScreenView> createState() => _OnBoardingScreenViewState();
}

class _OnBoardingScreenViewState extends State<OnBoardingScreenView> {
  PageController pageController = PageController();
  int currentIndex=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      currentIndex= pageController.page!.toInt()?? 0 ;
      setState(() {currentIndex= pageController.page!.toInt() ;
      if(currentIndex==OnBoardingData.onBoardingList.length-1){Timer(Duration(seconds: 1), (){Navigator.pushReplacementNamed(context, PagesRouteName.layoutView);});}
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            Assets.headerLogoImgQuranScreen,
            height: 150,
            fit: BoxFit.scaleDown,
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: OnBoardingData.onBoardingList.length,
              itemBuilder: (context, index) => OnBoardingPage(
                onBoardingData: OnBoardingData.onBoardingList[index],
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text("Back"),
                style: TextButton.styleFrom(
                  foregroundColor: ColorPallete.primaryColor,
                  backgroundColor: Colors.transparent,
                  textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w700)
                ),
              ),
              Row(children: List.generate(OnBoardingData.onBoardingList.length, (index) => DotIndicator(isActive: index==currentIndex,))),
              TextButton(
                onPressed: () {},
                child: Text("Next"),
                style: TextButton.styleFrom(
                    foregroundColor: ColorPallete.primaryColor,
                    backgroundColor: Colors.transparent,
                    textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w700)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
