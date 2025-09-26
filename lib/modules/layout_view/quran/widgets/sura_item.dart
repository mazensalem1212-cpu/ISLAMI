import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/assets.dart';
import 'package:islami_app/core/models/sura_data.dart';
import 'package:islami_app/core/routes/pages_route_name.dart';

class SuraItem extends StatelessWidget {
  final SuraData suraData ;
  final VoidCallback onSuraTab ;
  const SuraItem({required this.suraData,super.key, required this.onSuraTab});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: onSuraTab,
      child: Row(
        children: [
          Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Assets.suraNumber,))),width: 52,height: 52,child: Text(suraData.id.toString(),style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white,fontSize: 16),),alignment: Alignment.center),
          SizedBox(width: 15),
          Column(crossAxisAlignment: CrossAxisAlignment.start,spacing: 10,children: [
            Text(suraData.suraNameEN,style: theme.textTheme.bodyLarge),Text(suraData.verses.toString(),style: theme.textTheme.bodyMedium)
          ],),
          Spacer(),
          Text(suraData.suraNameAR,style: theme.textTheme.bodyLarge)
        ]
      ),
    );
  }
}
