import 'package:flutter/material.dart';

class BlocStateInformation extends StatelessWidget {

  final Color color;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double width;
  final String text;
  final int maxLines;

  const BlocStateInformation({
    Key? key,
    this.color = Colors.grey,
    this.margin = const EdgeInsets.fromLTRB(10, 30, 10, 10),
    this.padding = const EdgeInsets.all(10),
    this.width = double.infinity,
    required this.text,
    this.maxLines = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color _backgroundColor = color.withOpacity(.3);

    return Container(
      decoration: BoxDecoration(
        color: _backgroundColor,
        border: Border.all(width: 1, color: color)
      ),
      margin: margin,
      padding: padding,
      width: width,
      child: Center(
        child: Text(
          text,
          maxLines: maxLines,
          style: TextStyle(
            color: color
          ),
        ),
      ),
    );
  }
}