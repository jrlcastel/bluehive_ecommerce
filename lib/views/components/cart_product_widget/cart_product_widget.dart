import 'package:flutter/material.dart';

import '../../../packages/custom_number_picker/custom_number_picker.dart';

class CartProductWidget extends StatelessWidget {
  
  // product info
  final String productName;
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
  // number picker
  final bool showNumberPicker;

  const CartProductWidget({
    // product info
    this.productName = 'Loading',
    this.price = 0,
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
    // number picker
    this.showNumberPicker = false,

    Key? key,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {

    final double detailWidth = width - imageDimensions - imageAndDetailsSpacing - (borderWidth*2) - productDetailsRightMargin - (horizontalPadding*2);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.fromLTRB(horizontalPadding, 15, horizontalPadding, 15),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey)
          )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
      
            // image
            Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue[200],
                borderRadius: BorderRadius.circular(10)
              ),
              margin: EdgeInsets.only(right: imageAndDetailsSpacing),
              height: imageDimensions,
              width: imageDimensions,
            ),
      
            // details
            Container(
              margin: EdgeInsets.only(right:productDetailsRightMargin, top: 5, bottom: 5, ),
              // color: Colors.grey[350],
              width: detailWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
      
                  // Product name
                  Text(
                    productName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  ),
      
                  // Product price
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Text(
                      ('₱ ' + price.toStringAsFixed(2) + ' each'),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15
                      ),
                    ),
                  ),
      
                  // Product price total
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Text(
                      ('₱ ' + (price*quantity).toStringAsFixed(2)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  if(showNumberPicker) CustomNumberPicker(
                    value: quantity,
                    onChange: (_) {},
                  ),
      
                ],
              ),
            )
      
          ],
        ),
      ),
    );
  }
}