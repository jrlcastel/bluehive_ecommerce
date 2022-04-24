import 'package:flutter/material.dart';

import '../../routers/authenticated_router/authenticated_router.gr.dart';

class AuthenticatedRoutes extends StatelessWidget {

  AuthenticatedRoutes({Key? key}) : super(key: key);
  
  final dynamic router = AuthenticatedRouter();

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