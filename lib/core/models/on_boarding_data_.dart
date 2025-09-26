import 'package:islami_app/core/constants/strings.dart';

import '../constants/assets.dart';

class OnBoardingData {
  String imagePath;
  String title;
  String? description;
  OnBoardingData({required this.imagePath,required this.title, this.description});

  static List<OnBoardingData> onBoardingList = [
    OnBoardingData(imagePath: Assets.onBoarding1img, title: Strings.onBoardingTitle1),
    OnBoardingData(imagePath: Assets.onBoarding2img, title: Strings.onBoardingTitle2,description:Strings.onBoardingDescription1 ),
    OnBoardingData(imagePath: Assets.onBoarding3img, title: Strings.onBoardingTitle3,description:Strings.onBoardingDescription2 ),
    OnBoardingData(imagePath: Assets.onBoarding4img, title: Strings.onBoardingTitle4,description:Strings.onBoardingDescription3 ),
    OnBoardingData(imagePath: Assets.onBoarding5img, title: Strings.onBoardingTitle5,description:Strings.onBoardingDescription4 ),
  ];
}