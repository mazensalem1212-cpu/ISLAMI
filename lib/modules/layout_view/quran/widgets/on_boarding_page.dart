import 'package:flutter/material.dart';
import 'package:islami_app/core/models/on_boarding_data_.dart';
import 'package:islami_app/theme/color_pallete.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.onBoardingData});
final OnBoardingData onBoardingData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(child: Image.asset(onBoardingData.imagePath,)),
          SizedBox(height: 24,),
          Text(onBoardingData.title,style:TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: ColorPallete.primaryColor)),
          SizedBox(height: 24,),
          if(onBoardingData.description !=null)
            Text(onBoardingData.description!,textAlign: TextAlign.center,style:TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: ColorPallete.primaryColor)),


        ],
      ),
    );
  }
}
