
import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/models/sura_data.dart';

class RecentlySuraCardItem extends StatelessWidget {
  const RecentlySuraCardItem({super.key, required this.suraData});
  final SuraData suraData;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(padding: EdgeInsets.only(left: 8),
        width: 285,
        height: 150,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: 12,
          children: [
            Text(suraData.suraNameEN , style: theme.textTheme.titleLarge),
            Text(suraData.suraNameAR, style: theme.textTheme.titleLarge),
            Text(suraData.verses.toString(), style: TextStyle(color: Colors.black),)
          ],
        ),
        Expanded(child: Image.asset(Assets.cardIcn))
    ]),
    );

  }
}

