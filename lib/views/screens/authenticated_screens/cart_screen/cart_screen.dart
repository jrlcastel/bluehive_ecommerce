import 'package:bluehive_exam/views/screens/authenticated_screens/cart_screen/checkout_details.dart';
import 'package:flutter/material.dart';

import 'cart_product_list.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [

              Expanded(
                child: CartProductList(
                  screenWidth: _screenWidth,
                ),
              ),

              const CheckoutDetails(),

            ],
          ),
        ),
      ),
    );
  }
}