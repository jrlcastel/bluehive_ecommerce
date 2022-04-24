import 'package:flutter/material.dart';

import '../models/custom_bottom_navigation_bar_button_data.dart';

class CustomBottomNavigationBarButton extends StatelessWidget {

  final int currentIndex;
  final int index;
  final CustomBottomNavigationBarButtonData buttonData;
  final Function(int index, {bool notify}) setActiveIndex;

  const CustomBottomNavigationBarButton({
    Key? key,
    required this.setActiveIndex,
    required this.currentIndex,
    required this.index,
    required this.buttonData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: GestureDetector(
        onTap: () {
          debugPrint('\n');
          debugPrint("BottomNavigationBarButton: onTap()");
          debugPrint("before: currentIndex: " + currentIndex.toString());
          debugPrint("before: index: " + index.toString() );
          setActiveIndex(index);
          debugPrint("after: currentIndex: " + currentIndex.toString());
          debugPrint("after: index: " + index.toString() );
        },
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: buttonData.verticalPadding),
          child: Icon(
            index==currentIndex ? buttonData.activeIcon : buttonData.inactiveIcon,
            color: index==currentIndex ? Colors.black : Colors.grey,
            size: buttonData.iconSize,
          ),
        ),
      ),
    );
    
  }
}

