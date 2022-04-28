import 'package:flutter/material.dart';

class RouteLink extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final String name;
  final VoidCallback onTap;
  const RouteLink({
    Key? key,
    required this.icon,
    this.iconSize = 20,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
    
            Icon(
              icon,
              size: iconSize,
            ),
    
            Text(
              name,
              style: null,
            ),
    
          ],
        ),
      ),
    );
  }
}