import 'package:flutter/material.dart';
import 'package:islami_app/core/models/sura_data.dart';
import 'package:islami_app/core/routes/pages_route_name.dart';
import 'package:islami_app/modules/layout_view/quran/widgets/recently_sura_card_item.dart';


class RecentlySuraWidget extends StatelessWidget {
  const RecentlySuraWidget({super.key, required this.suraDataModel});
  final List<SuraData> suraDataModel;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text("Most Recently", style: theme.textTheme.bodyLarge),
        ),
        Container(
          padding: EdgeInsets.only(left: 16),
          height: 150,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(onTap:(){Navigator.pushNamed(context,PagesRouteName.quranDetailsView,arguments: suraDataModel[index]);}

                ,child: RecentlySuraCardItem(suraData: suraDataModel[index])),
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemCount: suraDataModel.length,
          ),
        ),
      ],
    );
  }
}
