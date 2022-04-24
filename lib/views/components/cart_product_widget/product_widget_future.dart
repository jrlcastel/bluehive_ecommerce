import 'package:bluehive_exam/controllers/repositories/product_repository.dart';
import 'package:bluehive_exam/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'cart_product_widget.dart';

class CartProductFutureWidget extends StatelessWidget {
  
  // product info
  final String productName;
  final String productId;
  final double price;
  final int quantity;
  // widget dimension and spacing
  final double width;
  final double horizontalPadding;
  final double topMargin;
  // widget style
  final double borderWidth;
  // internal spacing
  final double imageAndDetailsSpacing;
  // product image
  final double imageDimensions;
  // product details
  final double productDetailsRightMargin;
  // gestures
  final VoidCallback? onTap;

  const CartProductFutureWidget({
    // product info
    this.productName = 'Loading',
    this.price = 0,
    required this.productId,
    this.quantity = 0,
    // widget dimension and spacing
    required this.width,
    this.horizontalPadding = 0,
    this.topMargin = 10,
    // widget style
    this.borderWidth = 1,
    // internal spacing
    this.imageAndDetailsSpacing = 8,
    // product image
    required this.imageDimensions,
    // product details
    this.productDetailsRightMargin = 10,
    // product details
    this.onTap,

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Product>(
      future: ProductRepository(firebaseFirestore: FirebaseFirestore.instance).getProductById(id: productId),
      builder: (BuildContext context, AsyncSnapshot<Product> snapshot) {


        if(snapshot.connectionState==ConnectionState.done) {


          if (!snapshot.hasError) {

            Product _product = snapshot.data!;

            debugPrint(_product.name);
            

            return CartProductWidget(
              productName: _product.name,
              price: _product.price,
              quantity: quantity,
              imageDimensions: imageDimensions,
              width: width,
              borderWidth: borderWidth,
              horizontalPadding: horizontalPadding,
              imageAndDetailsSpacing: imageAndDetailsSpacing,
              onTap: onTap,
              productDetailsRightMargin: productDetailsRightMargin,
              topMargin: topMargin,
              showNumberPicker: true,
            );

          } else {
            debugPrint(snapshot.error.toString());
          }
        } 

        return CartProductWidget(
          quantity: quantity,
          imageDimensions: imageDimensions,
          width: width,
          borderWidth: borderWidth,
          horizontalPadding: horizontalPadding,
          imageAndDetailsSpacing: imageAndDetailsSpacing,
          onTap: onTap,
          productDetailsRightMargin: productDetailsRightMargin,
          topMargin: topMargin,
        );

      },
    );
  }
}