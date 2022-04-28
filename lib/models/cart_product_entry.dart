import 'cart_product.dart';

// holds cart data and cart database ID
class CartProductEntry {

  final CartProduct cartProduct;
  final String firestoreId;

  CartProductEntry({
    required this.cartProduct,
    required this.firestoreId
  });

}