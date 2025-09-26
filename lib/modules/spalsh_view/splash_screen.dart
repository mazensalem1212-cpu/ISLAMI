import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/core/routes/pages_route_name.dart';

import '../../core/constants/assets.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), (){Navigator.pushReplacementNamed(context, PagesRouteName.onBoardingScreenView);});
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.splashBackgroundImg),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
