import 'package:flutter/material.dart';

class SectionItem extends StatelessWidget {
  final String property;
  final String value;
  const SectionItem({
    Key? key,
    required this.property,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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