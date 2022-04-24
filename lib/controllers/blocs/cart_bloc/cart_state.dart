part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
  
  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}


class CartLoaded extends CartState {

  final List<CartProduct> cartProducts;
  final int quantity;
  final double total;

  const CartLoaded({
    required this.cartProducts,
    required this.quantity,
    required this.total,
  });

  @override
  List<Object> get props => [cartProducts];

}
