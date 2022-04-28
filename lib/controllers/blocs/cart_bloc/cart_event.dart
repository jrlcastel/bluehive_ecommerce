part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {

  final String productId;
  final int quantity;

  const AddToCart({
    required this.productId,
    required this.quantity,
  });

  @override
  List<Object> get props => [productId, quantity];

}

class UpdateCart extends CartEvent {

  final List<CartProduct> cartProducts;
  final List<Product> products;

  const UpdateCart({
    required this.cartProducts,
    required this.products,
  });

  @override
  List<Object> get props => [cartProducts, products];

}

// * Update single cart item event
class UpdateCartItem extends CartEvent {

  final String cartItemId;
  final int quantity;

  const UpdateCartItem({
    required this.cartItemId,
    required this.quantity,
  });

  @override
  List<Object> get props => [cartItemId, quantity];

}