import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controllers/blocs/cart_bloc/cart_bloc.dart';
import '../../../../controllers/blocs/user_bloc/user_bloc.dart';
import '../../../../models/cart_product.dart';
import '../../../components/cart_product_widget/product_widget_future.dart';

class CartProductList extends StatelessWidget {

  final double screenWidth; 

  const CartProductList({
    required this.screenWidth,
    Key? key
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    
    final _userState = context.read<UserBloc>().state;
    String _userId = '';

    if(_userState is UserAuthenticated) {
      _userId = _userState.user.id;
    }


    return BlocBuilder<CartBloc, CartState>(
      builder: (context, _cartProductsState) {

        List<CartProduct> _cartProducts = [];
        List<CartProduct> _finalProducts = [];

        if(_cartProductsState is CartLoaded) _cartProducts = _cartProductsState.cartProducts;

        for (var _cartProduct in _cartProducts) {
          print('compare: ' + _cartProduct.userId + ', ' + _userId);
          if (_cartProduct.userId == _userId) _finalProducts.add(_cartProduct);
        }

        return SingleChildScrollView(
          child: Column(
            children: List.generate(_finalProducts.length, (index) 
              => CartProductFutureWidget(
                productId: _finalProducts[index].productId,
                quantity: _finalProducts[index].quantity,
                imageDimensions: 110,
                width: screenWidth,
                horizontalPadding: 15,
                topMargin: 20,
                onTap: () {
                },
              )
            ),
          ),
        );

        // return ListView.builder(
        //   padding: const EdgeInsets.only(bottom: 20),
        //   itemCount: _cartProducts.length,
        //   itemBuilder: (context, index) =>
        //     CartProductFutureWidget(
        //       productId: _cartProducts[index].productId,
        //       imageDimensions: 110,
        //       width: screenWidth,
        //       horizontalPadding: 15,
        //       topMargin: 20,
        //       onTap: () {
        //       },
        //     )
        // );

      },
    );
  }
  
}