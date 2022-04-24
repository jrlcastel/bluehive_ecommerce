import 'package:flutter/material.dart';

import '../expanded_wrapper/expanded_wrapper.dart';

class CustomButton extends StatelessWidget {
  // dimensions
  final double? width;
  final double? height;
  // spacing
  final EdgeInsets margin;
  final EdgeInsets padding;
  // style
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;
  // text
  final String name;
  final Color textColor;
  final double textSize;
  // behavior
  final VoidCallback onTap;
  // expanded
  final bool expanded;
  final int flex;
  // child
  // final Widget child;
  // final List<Widget> children;
  const CustomButton({
    Key? key,
    // dimensions
    this.width = double.infinity,
    this.height,
    // spacing
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    // style
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.transparent,
    this.borderRadius = 0,
    this.borderWidth = 0,
    // textStyle
    required this.name,
    this.textColor = Colors.white,
    this.textSize = 15,
    // behavior
    required this.onTap,
    // expanded
    this.expanded = false,
    this.flex = 0,
    // child
    // required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandedWrapper(
      expanded: expanded,
      child: InkWell(
        splashColor: Colors.white,
        onTap: onTap,
        child: Container(
          margin: margin,
          width: expanded ? null : width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
    
              Expanded(
                child: Container(
                  padding: padding,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    border: Border.all(
                      color: borderColor,
                      width: borderWidth,
                    ),
                    borderRadius: BorderRadius.circular(borderRadius)
                  ),
                  child: Center(
                    child: Text(
                      name,
                      style: TextStyle(
                        color: textColor,
                        fontSize: textSize,
                      ),
                    ),
                  ),
                ),
              ),
    
            ],
          ),
        ),
      ),
    );
  }
}