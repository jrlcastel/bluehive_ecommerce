import 'package:flutter/material.dart';

import '../models/custom_bottom_navigation_bar_button_data.dart';
import 'custom_bottom_navigation_bar_button.dart';

class CustomBottomNavigationBar extends StatelessWidget {

  final int currentIndex;
  final List<CustomBottomNavigationBarButtonData> buttonDataList;
  final Function(int index, {bool notify}) setActiveIndex;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.buttonDataList,
    required this.setActiveIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(width: 1, color: Colors.grey)
        ),
      ),
      child: Row(
        children: List.generate(
          buttonDataList.length,
          (index) => CustomBottomNavigationBarButton(
            setActiveIndex: setActiveIndex,
            buttonData: buttonDataList[index],
            currentIndex: currentIndex,
            index: index,
          )
        )
      ),
    );
    
  }
}