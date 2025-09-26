
import 'package:flutter/material.dart';
import 'package:islami_app/core/routes/pages_route_name.dart';
import 'package:islami_app/modules/layout_view/quran/quran_details_view.dart';
import 'package:islami_app/modules/onBoarding/on_boarding_screen_view.dart';

import '../../modules/layout_view/layout_screen.dart';
import '../../modules/spalsh_view/splash_screen.dart';

abstract class Routes {
 static Map<String, Widget Function(BuildContext)> routes = {
   PagesRouteName.splashView: (context) => const SplashScreen(),
   PagesRouteName.layoutView: (context) =>  LayoutScreen(),
   PagesRouteName.quranDetailsView: (context) =>  QuranDetailsView(),
   PagesRouteName.onBoardingScreenView :  (context) =>  OnBoardingScreenView(),
 };
}