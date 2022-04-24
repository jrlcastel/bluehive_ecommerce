import 'package:flutter/material.dart';

class CustomBottomNavigationBarButtonData {
  final IconData inactiveIcon;
  final IconData activeIcon;
  final bool active;
  final double iconSize;
  final double verticalPadding;

  CustomBottomNavigationBarButtonData({
    required this.inactiveIcon,
    required this.activeIcon,
    required this.active,
    required this.iconSize,
    this.verticalPadding = 5.0,
  });

}