import 'package:bluehive_exam/views/components/section/section_item.dart';
import 'package:bluehive_exam/views/components/section/section_title.dart';
import 'package:flutter/material.dart';

import 'section_item_data.dart';

class Section extends StatelessWidget {
  final String sectionTitle;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final EdgeInsets itemPadding;
  final List<SectionItemData> sectionItemDataList;
  const Section({
    Key? key,
    required this.sectionTitle,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.itemPadding = EdgeInsets.zero,
    this.sectionItemDataList = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SectionTitle(text: sectionTitle),

          ...List.generate(sectionItemDataList.length, (index) =>
              SectionItem(
                padding: itemPadding,
                property: sectionItemDataList[index].property,
                value: sectionItemDataList[index].value,
              )
          )

        ],
      ),
    );
  }
}