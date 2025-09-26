import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_app/core/constants/assets.dart';
import 'package:islami_app/theme/color_pallete.dart';

class RadioView extends StatefulWidget {
  RadioView({super.key});

  @override
  State<RadioView> createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  List<String> reciters = [
    'Ibrahim Al-Akdar',
    'Akram Alalaqmi',
    'Majed Al-Enezi',
    'Malik shaibat Alhamed',
    "Abd-elbaset abd-elsamad",
  ];
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.radioBackgroundImg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            Assets.headerLogoImgQuranScreen,
            height: 170,
            fit: BoxFit.scaleDown,
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.white,
                    dividerColor: Colors.transparent,
                    tabs: [
                      Container(
                        decoration: BoxDecoration(
                          color: ColorPallete.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        width: double.infinity,
                        child: Tab(text: "Radio"),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorPallete.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        width: double.infinity,
                        child: Tab(text: "Reciters"),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ListView(
                          children: List.generate(
                            5,
                            (index) => Column(
                              children: [
                                Container(
                                  height: 141,
                                  decoration: BoxDecoration(
                                    color: ColorPallete.primaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: Opacity(
                                          opacity: 0.45,
                                          child: Image.asset(
                                            Assets.hadithMosqueBg,
                                            height: 90,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Radio ${reciters[index]}",
                                            style: theme.textTheme.titleMedium!
                                                .copyWith(fontSize: 20),
                                          ),
                                          SizedBox(height: 16),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                iconSize: 44,
                                                color: Colors.black,
                                                onPressed: () {},
                                                icon: Icon(Icons.play_arrow),
                                              ),
                                              IconButton(
                                                iconSize: 30,
                                                color: Colors.black,
                                                onPressed: () {},
                                                icon: Icon(Icons.volume_down),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),
                              ],
                            ),
                          ),
                        ),
                        ListView(
                          children: List.generate(
                            5,
                            (index) => Column(
                              children: [
                                Container(
                                  height: 141,
                                  decoration: BoxDecoration(
                                    color: ColorPallete.primaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: Opacity(
                                          opacity: 0.25,
                                          child: Image.asset(
                                            Assets.hadithMosqueBg,
                                            height: 90,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            reciters[index],
                                            style: theme.textTheme.titleMedium!
                                                .copyWith(fontSize: 20),
                                          ),
                                          SizedBox(height: 16),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                iconSize: 44,
                                                color: Colors.black,
                                                onPressed: () {},
                                                icon: Icon(Icons.play_arrow),
                                              ),
                                              IconButton(
                                                iconSize: 30,
                                                color: Colors.black,
                                                onPressed: () {},
                                                icon: Icon(Icons.volume_down),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
