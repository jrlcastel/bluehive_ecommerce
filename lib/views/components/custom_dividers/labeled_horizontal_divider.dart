import 'package:flutter/material.dart';

class LabeledHorizontalDivider extends StatelessWidget {
  final double width;
  final Color color;
  final EdgeInsets margin;
  final double spacing;
  final String text;
  const LabeledHorizontalDivider({
    Key? key,
    this.width = double.infinity,
    this.color = Colors.grey,
    this.margin = EdgeInsets.zero,
    this.spacing = 10,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.infinity,
      // width: width,
      child: Row(
        children: [

          Expanded(
            child: Container(
              height: width,
              color: color,
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: spacing),
            child: Text(
              text
            ),
          ),

          Expanded(
            child: Container(
              height: width,
              color: color,
            ),
          ),

        ],
      ),
    );
  }
}