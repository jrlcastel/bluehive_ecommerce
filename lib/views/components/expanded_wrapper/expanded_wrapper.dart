import 'package:flutter/material.dart';

/// Optionally wraps a widget with the `Expanded` widgets from `Material` package for quick conditional wrapping of widgets.
//  todo: add a functionality to detect if child widget cannot be wrapped with `Expanded`
class ExpandedWrapper extends StatelessWidget {
  
  final Widget child;
  final bool expanded;
  // final bool rowWrap;
  // final bool columnWrap;

  const ExpandedWrapper({
    Key? key,
    required this.child,
    this.expanded = false,
    // this.rowWrap = false,
    // this.columnWrap = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return expanded ? Expanded(child: child) : child;
  }

}