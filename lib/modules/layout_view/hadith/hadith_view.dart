import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/assets.dart';

import 'hadith_details_view.dart';

class HadithView extends StatelessWidget {
  const HadithView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    return Container(width: double.infinity,height: double.infinity,decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Assets.hadithBackgroundImg),fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  Assets.headerLogoImgQuranScreen,
                  height: 130,
                  fit: BoxFit.scaleDown,
                ),
                CarouselSlider(
                  options: CarouselOptions(height: height*0.66,enableInfiniteScroll: true,enlargeCenterPage: true),
                  items: List.generate(50, (index) => index+1).map((index) {
                    return HadithDetailsView(index: index);
                  }).toList(),
                )
              ],
            ),
    );

  }

}
