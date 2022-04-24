import 'package:bluehive_exam/views/components/product_widget/product_widget.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';

class ProductBottomSheet extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;
  const ProductBottomSheet({
    Key? key,
    required this.product,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          ProductWidget(
            product: product,
            horizontalPadding: 15,
            imageDimensions: 110,
            topMargin: 0,
            width: MediaQuery.of(context).size.width,
          ),

          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //   child: Row(
          //     children: [


          //       // quantity
          //       ElevatedButton(
          //         onPressed: (){},
          //         child: Padding(padding: EdgeInsets.all(5), child: Icon(Icons.remove)),
          //         style: ElevatedButton.styleFrom(
          //           shape: CircleBorder(),
          //           // padding: EdgeInsets.all(5),
          //         ),
          //       ),

          //       Expanded(
          //         child: TextFormField(
          //           keyboardType: TextInputType.number,         
          //           style: TextStyle(
          //             fontSize: 15.0,
          //             height: 2.0,
          //             color: Colors.black                  
          //           ),
          //         ),
          //       ),

          //       ElevatedButton(
          //         onPressed: (){},
          //         child: Padding(padding: EdgeInsets.all(5), child: Icon(Icons.add)),
          //         style: ElevatedButton.styleFrom(
          //           shape: CircleBorder(),
          //           // padding: EdgeInsets.all(5),
          //         ),
          //       ),

          //     ],
          //   ),
          // ),

          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: ElevatedButton(onPressed: (){ Navigator.of(context).pop(); }, child: Text('Cancel'))
                  ),
                ),

                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: ElevatedButton(onPressed: onAddToCart, child: Text('Add to Cart'))
                  ),
                )
              ],
            ),
          ),

        ],
      )
    );
  }
}