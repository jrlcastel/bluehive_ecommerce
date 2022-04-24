import 'package:flutter/material.dart';

import '../../screens/unauthenticated_screens/loading_screen/loading_screen.dart';

class UserLoadingScreen extends StatelessWidget {
  const UserLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blue Hive Ecommerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadingScreen(),
    );
  }
}