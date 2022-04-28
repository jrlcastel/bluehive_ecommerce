import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bluehive_exam/controllers/blocs/cart_bloc/cart_bloc.dart';
import 'package:bluehive_exam/controllers/repositories/cart_repository.dart';
import 'package:bluehive_exam/controllers/repositories/transaction_repository.dart';
import 'package:bluehive_exam/models/transaction_details.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'transaction_details_event.dart';
part 'transaction_details_state.dart';

class TransactionDetailsBloc extends Bloc<TransactionDetailsEvent, TransactionDetailsState> {

  final TransactionDetailsRepository transactionDetailsRepository;
  final CartBloc cartBloc;
  final CartRepository cartRepository;
  final String userId; 

  TransactionDetailsBloc({
    required this.cartBloc,
    required this.transactionDetailsRepository,
    required this.cartRepository,
    required this.userId,
  }) : super(TransactionDetailsInitial()) {


    // * listen to TRANSACTION DETAILS stream on Firebase repository
    transactionDetailsRepository.getUserTransactions(userId: userId).listen((_transactionDetailsList) {
        add(LoadTransactionDetails(transactionDetailsList: _transactionDetailsList));
    });


    // * Load Transaction Details Event
    on<LoadTransactionDetails>((event, emit) {
      emit(TransactionDetailsLoaded(transactionDetailsList: event.transactionDetailsList));
    });

    // * Load Transaction Details Event
    on<AddTransactionDetails>((event, emit) async {

      // set transaction details loading state
      emit(TransactionDetailsLoading());

      CartState _cartState = cartBloc.state;
      int _quantity = 0;
      double _total = 0;

      if(_cartState is CartLoaded) {
        _quantity = _cartState.quantity;
        _total = _cartState.total;
      }

      // if no error, stream subscription will read the update
      try{

        bool _transactionAdded = await transactionDetailsRepository.addTransactionDetails(
          userId: userId,
          quantity: _quantity,
          total: _total+200
        );

        if(_transactionAdded) {
          await cartRepository.deleteUserCartItems(userId: userId);
        }

      }
      // if has error, emit error state
      catch (e) {
        emit(TransactionDetailsError(errorMessage: e.toString()));
      }

    });
  }
}
