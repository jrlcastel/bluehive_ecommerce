import 'package:bluehive_exam/views/components/cart_product_widget/cart_image.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';
import '../../../packages/custom_number_picker/custom_number_picker.dart';

class CartProductWidget extends StatelessWidget {
  
  // product info
  final Product? product;
  // cart info
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
  // events
  final Function(int, int) onUpdate;

  const CartProductWidget({
    // product info
    this.product,
    this.quantity = 1,
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
    // events
    required this.onUpdate,

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
              child: product==null ? Container() : CartImage(imgUrl: product!.imageUrl),
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
                    product==null ? 'Loading' : product!.name,
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
                      ('₱ ' + (product?.price ?? 0).toStringAsFixed(2) + ' each x ${quantity.toString()}'),
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
                      ('₱ ' + ((product?.price ?? 0)*quantity).toStringAsFixed(2)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  if(product!=null) CustomNumberPicker(
                    value: quantity,
                    onDelete: () { },
                    onUpdate: onUpdate,
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