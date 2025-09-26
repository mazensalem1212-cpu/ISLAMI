import 'package:flutter/material.dart';
import 'package:islami_app/modules/layout_view/hadith/hadith_view.dart';
import 'package:islami_app/modules/layout_view/quran/quran_view.dart';
import 'package:islami_app/modules/layout_view/radio/radio_view.dart';
import 'package:islami_app/modules/layout_view/sebha/sebha_view.dart';
import 'package:islami_app/modules/layout_view/time/time_view.dart';
import '../../core/constants/assets.dart';

class LayoutScreen extends StatefulWidget {
   const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;

  List<Widget> screens = [
    QuranView(),
    HadithView(),
    SebhaView(),
    RadioView(),
    TimeView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.transparent ,
      body: screens[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(currentIndex: selectedIndex,
        onTap: (index) {
         setState(() {
           selectedIndex = index;
         });
      },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Assets.quranIcn)),
            activeIcon: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              decoration: BoxDecoration(color: Colors.black38,borderRadius: BorderRadius.circular(12)),
              child: ImageIcon(AssetImage(Assets.quranIcn)),
            ),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Assets.hadithIcn)),
            activeIcon: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              decoration: BoxDecoration(color: Colors.black38,borderRadius: BorderRadius.circular(12)),
              child: ImageIcon(AssetImage(Assets.hadithIcn)),
            ),
            label: 'Hadith',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(color: Colors.black, AssetImage(Assets.sebhaIcn)),
            activeIcon: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              decoration: BoxDecoration(color: Colors.black38,borderRadius: BorderRadius.circular(12)),
              child: ImageIcon(AssetImage(Assets.sebhaIcn)),
            ),
            label: 'Tasbeeh',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Assets.radioIcn)),
            activeIcon: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              decoration: BoxDecoration(color: Colors.black38,borderRadius: BorderRadius.circular(12)),
              child: ImageIcon(AssetImage(Assets.radioIcn)),
            ),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Assets.timeIcn)),
            activeIcon: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              decoration: BoxDecoration(color: Colors.black38,borderRadius: BorderRadius.circular(12)),
              child: ImageIcon(AssetImage(Assets.timeIcn)),
            ),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}
