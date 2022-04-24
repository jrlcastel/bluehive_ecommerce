part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {

  final String id;
  final String productId;
  final int quantity;

  const AddToCart({
    required this.id,
    required this.productId,
    required this.quantity,
  });

  @override
  List<Object> get props => [id, productId, quantity];

}

class UpdateCart extends CartEvent {

  final List<CartProduct> cartProducts;

  const UpdateCart({
    required this.cartProducts,
  });

  @override
  List<Object> get props => [cartProducts];

}