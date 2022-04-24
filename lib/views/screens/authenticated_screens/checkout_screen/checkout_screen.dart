import 'package:bluehive_exam/views/components/section/section.dart';
import 'package:bluehive_exam/views/components/section/section_item_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controllers/blocs/cart_bloc/cart_bloc.dart';
import '../../../../controllers/blocs/user_bloc/user_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout Screen'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [


              BlocBuilder<UserBloc, UserState>(
                builder: (context, _userState) {
                  
                  String? _name = '';
                  String? _email = '';

                  if(_userState is UserAuthenticated) {
                    _name = _userState.userCredential?.user!.displayName;
                    _email = _userState.userCredential?.user!.email;
                  }

                  return Section(
                    sectionTitle: 'Order Details',
                    sectionItemDataList: [
                      SectionItemData(property: 'Name', value: _name ?? 'null'),
                      SectionItemData(property: 'Email', value: _email ?? 'null'),
                      SectionItemData(property: 'Method', value: 'Cash on delivery.'),
                    ],
                  );
                },
              ),


              BlocBuilder<CartBloc, CartState>(
                builder: (context, _cartState) {

                int _itemCount = 0;
                double _total = 0;

                if(_cartState is CartLoaded) {
                  _itemCount = _cartState.quantity;
                  _total = _cartState.total;
                }

                  return Section(
                    sectionTitle: 'Order Details',
                    sectionItemDataList: [
                      SectionItemData(property: 'Number of items', value: _itemCount.toString()),
                      SectionItemData(property: 'Subtotal', value: _total.toStringAsFixed(2)),
                      SectionItemData(property: 'Delivery Fee', value: '200'),
                      SectionItemData(property: 'Total', value: (_total+200).toStringAsFixed(2)),
                    ],
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}