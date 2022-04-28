import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controllers/blocs/cart_bloc/cart_bloc.dart';
import '../../../routing/routers/authenticated_router/authenticated_router.gr.dart';

class CheckoutDetails extends StatelessWidget {
  const CheckoutDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, _cartState) {

        int _itemCount = 0;
        double _total = 0;

        if(_cartState is CartLoaded) {
          _itemCount = _cartState.quantity;
          _total = _cartState.total;
        }

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.grey[300],
          child: Row(
            children: [
              
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
    
                  Text(
                    '${_itemCount.toString()} items',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
    
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      'Subtotal: P ${_total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
    
                ],
              ),
    
              const Spacer(),
    
              ElevatedButton(
                child: const Text('Checkout'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(_itemCount>0 ? Colors.blue : Colors.grey),
                ),
                onPressed: () {
                  if(_itemCount>0) {
                    final _router = context.router;
                    _router.push(const CheckoutRoute());
                  }
                },
              )
    
            ],
          ),
        );
      },
    );
  }
}