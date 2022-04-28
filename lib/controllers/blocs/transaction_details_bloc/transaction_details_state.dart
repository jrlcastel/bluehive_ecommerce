part of 'transaction_details_bloc.dart';

abstract class TransactionDetailsState extends Equatable {
  const TransactionDetailsState();
  
  @override
  List<Object> get props => [];
}


// * Initial State
class TransactionDetailsInitial extends TransactionDetailsState {}


// * Loading State
class TransactionDetailsLoading extends TransactionDetailsState {}


// * Loaded State
class TransactionDetailsLoaded extends TransactionDetailsState {

  final List<TransactionDetails> transactionDetailsList;

  const TransactionDetailsLoaded({
    required this.transactionDetailsList,
  });
  
  @override
  List<Object> get props => [transactionDetailsList];
}


// * Error State
class TransactionDetailsError extends TransactionDetailsState {

  final String errorMessage;

  const TransactionDetailsError({
    required this.errorMessage,
  });
  
  @override
  List<Object> get props => [errorMessage];
}
