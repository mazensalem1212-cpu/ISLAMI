import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/assets.dart';
import 'package:islami_app/theme/color_pallete.dart';

import 'prayer_card.dart';

class AppColors {
  static const Color primaryBackground = Colors.grey;
  static const Color cardBackground = ColorPallete.primaryColor;
  static const Color textDark = Colors.black;
  static const Color textLight = Colors.white;
}

class PrayerTimesData {
  static final List<Map<String, String>> prayerTimes = [
    {'name': 'Dhuhr', 'time': '01:01', 'period': 'PM'},
    {'name': 'ASR', 'time': '04:38', 'period': 'PM'},
    {'name': 'Maghrib', 'time': '07:57', 'period': 'PM'},
    {'name': 'Isha', 'time': '09:35', 'period': 'PM'},
    {'name': 'Sunrise', 'time': '05:04', 'period': 'AM'},
  ];
}

class TimeView extends StatelessWidget {
  const TimeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.timeBackgroundImg),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              Assets.headerLogoImgQuranScreen,
              height: 155,
              fit: BoxFit.scaleDown,
            ),

            Container(
              width: MediaQuery.of(context).size.width * 0.9069,
              height: MediaQuery.of(context).size.height * 0.4,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '16 Jul,\n2024',
                        style: TextStyle(
                          color: AppColors.textDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Pray Time\nTuesday',
                        style: TextStyle(
                          color: AppColors.textDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '09 Muh,\n1446',
                        style: TextStyle(
                          color: AppColors.textDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: PrayerTimesData.prayerTimes.length,
                      itemBuilder: (context, index) {
                        final prayer = PrayerTimesData.prayerTimes[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: PrayerCard(
                            name: prayer['name']!,
                            time: prayer['time']!,
                            period: prayer['period']!,
                            isSelected: index == 1, // صلاة العصر
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 7),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          'Next Pray - 02:32',
                          style: TextStyle(
                            color: AppColors.textDark,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.volume_down,
                          color: Colors.black,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("Azkar"),
            ),
            SizedBox(height: 12),
            Wrap(spacing: 20,runSpacing: 10,
              children: [
                InkWell(onTap: () {},
                  child: Container(
                    width: 190,
                    height: 222,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets.eveningAzkar),
                      ),
                      border: Border.all(
                        width: 3,
                        color: ColorPallete.primaryColor,
                      ),
                    ),
                    child: Align(alignment: Alignment.bottomCenter,child: Text("Evening Azkar",style: TextStyle(fontSize: 14),)),
                  ),
                ),
                InkWell(onTap: () {},
                  child: Container(
                    width: 190,
                    height: 222,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets.morningAzkar),
                      ),
                      border: Border.all(
                        width: 3,
                        color: ColorPallete.primaryColor,
                      ),
                    ),
                    child: Align(alignment: Alignment.bottomCenter,child: Text("Morning Azkar",style: TextStyle(fontSize: 14),)),
                  ),
                ),
                InkWell(onTap: () {},
                  child: Container(
                    width: 190,
                    height: 222,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets.eveningAzkar),
                      ),
                      border: Border.all(
                        width: 3,
                        color: ColorPallete.primaryColor,
                      ),
                    ),
                    child: Align(alignment: Alignment.bottomCenter,child: Text("Tasabeeh Azkar",style: TextStyle(fontSize: 14),)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
