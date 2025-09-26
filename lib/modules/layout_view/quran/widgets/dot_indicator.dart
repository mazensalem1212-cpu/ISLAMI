import 'package:flutter/material.dart';
import 'package:islami_app/theme/color_pallete.dart';

class DotIndicator extends StatelessWidget {
  DotIndicator({super.key, required this.isActive});
  bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(margin: EdgeInsets.symmetric(horizontal: 8),
      height: 7,
      width: isActive? 24 : 8,
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: isActive ? ColorPallete.primaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
