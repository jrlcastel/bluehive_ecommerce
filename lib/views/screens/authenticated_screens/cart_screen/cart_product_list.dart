import 'package:bluehive_exam/views/components/cart_product_widget/cart_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controllers/blocs/cart_bloc/cart_bloc.dart';
import '../../../../models/cart_product.dart';

class CartProductList extends StatefulWidget {

  final double screenWidth; 

  const CartProductList({
    required this.screenWidth,
    Key? key
  }) : super(key: key);

  @override
  State<CartProductList> createState() => _CartProductListState();
}

class _CartProductListState extends State<CartProductList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, _cartProductsState) {

        List<CartProduct> _cartProducts = [];

        if(_cartProductsState is CartLoaded) _cartProducts = _cartProductsState.cartProducts;

        return SingleChildScrollView(
          child: Column(
            children: List.generate(_cartProducts.length, (index) 
              => CartProductWidget(
                product: _cartProducts[index].product,
                quantity: _cartProducts[index].quantity,
                imageDimensions: 110,
                width: widget.screenWidth,
                horizontalPadding: 15,
                topMargin: 20,
                onUpdate: (_oldQuantity, _newQuantity) {

                  if(_newQuantity>=0) {
                    if(context.read<CartBloc>().state is! CartLoading) {
                      context.read<CartBloc>().add(UpdateCartItem(cartItemId: _cartProducts[index].id, quantity: _newQuantity));
                    }
                  }

                },
                onTap: () {
                },
              )
            ),
          ),
        );

      },
    );
  }
}