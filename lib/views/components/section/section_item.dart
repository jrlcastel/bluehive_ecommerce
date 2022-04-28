import 'package:flutter/material.dart';

class SectionItem extends StatelessWidget {
  final String property;
  final String value;
  final EdgeInsets padding;
  const SectionItem({
    Key? key,
    required this.property,
    required this.value,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [

          Text.rich(
            
            TextSpan(
              children: [

                // property
                TextSpan(
                  text: (property + ': '),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold),
                ),

                // property value
                TextSpan(
                  text: value,
                ),
              ],
            ),
            overflow: TextOverflow.ellipsis,
          )

        ],
      ),
    );
  }
}