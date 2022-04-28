import 'package:auto_route/auto_route.dart';
import 'package:bluehive_exam/controllers/blocs/transaction_details_bloc/transaction_details_bloc.dart';
import 'package:bluehive_exam/models/transaction_details.dart';
import 'package:bluehive_exam/views/components/custom_button.dart/custom_button.dart';
import 'package:bluehive_exam/views/components/section/section.dart';
import 'package:bluehive_exam/views/components/section/section_item_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controllers/blocs/cart_bloc/cart_bloc.dart';
import '../../../../packages/user_data_wrapper.dart/user_data_wrapper.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // * get user details
    UserCredential _userCredential = UserDataWrapper.of(context: context).currentUser;
    String? _userId = _userCredential.user!.uid;
    String? _email = _userCredential.user!.email;

    // section style
    EdgeInsets _sectionMargin = const EdgeInsets.only(top: 10);
    EdgeInsets _sectionPadding = const EdgeInsets.symmetric(horizontal: 10, vertical: 15);
    EdgeInsets _sectionItemPadding = const EdgeInsets.only(left: 10);

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

              Section(
                margin: _sectionMargin,
                padding: _sectionPadding,
                itemPadding: _sectionItemPadding,
                sectionTitle: 'Personal & Other Info',
                sectionItemDataList: [
                  SectionItemData(property: 'Email', value: _email ?? 'null'),
                  SectionItemData(property: 'Method', value: 'Cash on delivery.'),
                ],
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
                    margin: _sectionMargin,
                    padding: _sectionPadding,
                    itemPadding: _sectionItemPadding,
                    sectionTitle: 'Order Summary',
                    sectionItemDataList: [
                      SectionItemData(property: 'Number of items', value: _itemCount.toString()),
                      SectionItemData(property: 'Subtotal', value: _total.toStringAsFixed(2)),
                      SectionItemData(property: 'Delivery Fee', value: '200'),
                      SectionItemData(property: 'Total', value: (_total+200).toStringAsFixed(2)),
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
                  
                  // * Checkout Button
                  return Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(_itemCount>0 ? Colors.blue : Colors.grey),
                      ),
                      child: const Text('Checkout'),
                      onPressed: () {

                        if(_itemCount>0) {

                          context.read<TransactionDetailsBloc>().add(AddTransactionDetails());

                          context.router.pop();
                        }

                      }
                    ),
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