part of 'transaction_details_bloc.dart';

abstract class TransactionDetailsEvent extends Equatable {
  const TransactionDetailsEvent();

  @override
  List<Object> get props => [];
}


class AddTransactionDetails extends TransactionDetailsEvent {}


class LoadTransactionDetails extends TransactionDetailsEvent {

  final List<TransactionDetails> transactionDetailsList;

  const LoadTransactionDetails({
    required this.transactionDetailsList,
  });

  @override
  List<Object> get props => [transactionDetailsList];

}