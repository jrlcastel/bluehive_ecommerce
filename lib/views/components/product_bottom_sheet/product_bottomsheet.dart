import 'package:bluehive_exam/views/components/product_widget/product_widget.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';
import 'custom_number_picker.dart';

class ProductBottomSheet extends StatelessWidget {

  final Product product;
  final Function(int) onAddToCart;
  
  const ProductBottomSheet({
    Key? key,
    required this.product,
    required this.onAddToCart,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    int _value = 1;

    return Column(
      children: [

        ProductWidget(
          product: product,
          horizontalPadding: 15,
          imageDimensions: 110,
          topMargin: 0,
          width: MediaQuery.of(context).size.width,
        ),

        CustomNumberPicker(
          initialValue: 1,
          onUpdate: (val) {_value = val;},
        ),

        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ElevatedButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop(); 
                  },
                ),
              ),
            ),

            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    onAddToCart(_value);
                  },
                  child: const Text('Add to Cart')
                )
              ),
            )
          ],
        ),

      ],
    );
  }
}