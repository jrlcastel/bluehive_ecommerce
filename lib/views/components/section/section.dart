import 'package:bluehive_exam/views/components/section/section_item.dart';
import 'package:bluehive_exam/views/components/section/section_title.dart';
import 'package:flutter/material.dart';

import 'section_item_data.dart';

class Section extends StatelessWidget {
  final String sectionTitle;
  final List<SectionItemData> sectionItemDataList;
  const Section({
    Key? key,
    required this.sectionTitle,
    this.sectionItemDataList = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SectionTitle(text: sectionTitle),

          ...List.generate(sectionItemDataList.length, (index) =>
              SectionItem(
                property: sectionItemDataList[index].property,
                value: sectionItemDataList[index].value,
              )
          )

        ],
      ),
    );
  }
}