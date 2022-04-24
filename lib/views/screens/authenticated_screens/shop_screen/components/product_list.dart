import 'package:bluehive_exam/controllers/blocs/cart_bloc/cart_bloc.dart';
import 'package:bluehive_exam/controllers/blocs/user_bloc/user_bloc.dart';
import 'package:bluehive_exam/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../controllers/blocs/products_bloc/products_bloc.dart';
import '../../../../components/product_bottom_sheet/product_bottomsheet.dart';
import '../../../../components/product_widget/product_widget.dart';

class ProductList extends StatelessWidget {

  final double screenWidth; 

  const ProductList({
    required this.screenWidth,
    Key? key
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    double _productSideMargin = 15;

    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, _productsState) {

        List<Product> _products = [];

        if(_productsState is ProductsLoaded) _products = _productsState.products;

        return SingleChildScrollView(
          child: Column(
            children: List.generate(_products.length, (index) 
              => ProductWidget(
                product: _products[index],
                imageDimensions: 90,
                width: screenWidth,
                horizontalPadding: _productSideMargin,
                topMargin: 15,
                onTap: () {

                  debugPrint('product ID: ' + _products[index].id);

                  showMaterialModalBottomSheet(
                    context: context,
                    duration: const Duration(milliseconds: 200),
                    animationCurve: Curves.fastLinearToSlowEaseIn,
                    barrierColor: Colors.black.withOpacity(.7),
                    builder: (context) => SingleChildScrollView(
                      controller: ModalScrollController.of(context),
                      child: ProductBottomSheet(
                        product: _products[index],
                        onAddToCart: () {

                          UserState _userBlocState = context.read<UserBloc>().state;

                          if(_userBlocState is UserAuthenticated) {

                            context.read<CartBloc>()
                              .add(
                                AddToCart(
                                  id: _userBlocState.user.id,
                                  productId: _products[index].id,
                                  quantity: 1
                                )
                              );

                          }

                          Navigator.of(context).pop();

                        },
                      ),
                    ),
                  );
                },
              )
            ),
          ),
        );
      },
    );
  }
  
}