import 'package:flutter/material.dart';

import 'time_view.dart';

class PrayerCard extends StatelessWidget {
  final String name;
  final String time;
  final String period;
  final bool isSelected;

  const PrayerCard({
    super.key,
    required this.name,
    required this.time,
    required this.period,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,

      decoration: BoxDecoration(
        gradient: isSelected? LinearGradient(colors: [Color(0xFF202020),Color(0xFFB19768)]) : LinearGradient(colors: [Color(0xFF202020),Color(0xFFB19768)]),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            time,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            period,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}