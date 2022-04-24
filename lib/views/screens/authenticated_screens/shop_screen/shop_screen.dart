import 'package:flutter/material.dart';

import 'components/product_list.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: ProductList(
            screenWidth: _screenWidth,
          ),
        ),
      ),
    );
  }
}