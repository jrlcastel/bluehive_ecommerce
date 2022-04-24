import 'package:auto_route/auto_route.dart';

import 'custom_bottom_navigation_bar_button_data.dart';

class CustomBottomNavigationBarItem {
  
  final CustomBottomNavigationBarButtonData buttonData;
  final PageRouteInfo<dynamic> route;

  CustomBottomNavigationBarItem({
    required this.buttonData,
    required this.route,
  });

}