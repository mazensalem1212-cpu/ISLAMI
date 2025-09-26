import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/constants.dart';
import 'package:islami_app/core/models/sura_data.dart';
import 'package:islami_app/modules/layout_view/quran/widgets/sura_item.dart';

class SuraListWidget extends StatelessWidget {
  const SuraListWidget({super.key, required this.onSuraTab, required this.suraData});
  final void Function(int) onSuraTab ;

  final List<SuraData> suraData;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sura's List", style: theme.textTheme.bodyLarge),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: 10),
            itemBuilder: (context, index) =>
                SuraItem(suraData: suraData[index], onSuraTab: () => onSuraTab((suraData[index].id)-1),),
            separatorBuilder: (context, index) =>
                Divider(thickness: 2, indent: 20, endIndent: 20, height: 30),
            itemCount: suraData.length,
          ),
        ],
      ),
    );
  }
}
