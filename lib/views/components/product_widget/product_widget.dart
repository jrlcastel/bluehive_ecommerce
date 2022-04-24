import 'package:bluehive_exam/models/product.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {


  //product
  final Product product;
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

  const ProductWidget({
    // product
    required this.product,
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

    final double detailWidth = width - imageDimensions - imageAndDetailsSpacing - (borderWidth*2) - productDetailsRightMargin - (horizontalPadding*2);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.fromLTRB(horizontalPadding, 10, horizontalPadding, 10),
        // height: 20,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey)
          )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  ),
                  
                  // Product description
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    // width: double.infinity,
                    child: Text(
                      product.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14
                      ),
                    ),
                  ),
      
                  // Product price
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Text(
                      ('₱ ' + product.price.toStringAsFixed(2)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18
                      ),
                    ),
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