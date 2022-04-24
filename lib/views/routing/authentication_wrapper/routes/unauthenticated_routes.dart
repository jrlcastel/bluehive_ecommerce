import 'package:flutter/material.dart';

import '../../routers/unauthenticated_router/unauthenticated_router.gr.dart';



class UnauthenticatedRoutes extends StatelessWidget {

  UnauthenticatedRoutes({Key? key}) : super(key: key);
  
  final dynamic router = UnauthenticatedRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Blue Hive Ecommerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
      builder: (context, router) => router!,
    );
  }
}