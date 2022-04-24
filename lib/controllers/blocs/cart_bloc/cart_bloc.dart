import 'package:bloc/bloc.dart';
import 'package:bluehive_exam/controllers/repositories/cart_repository.dart';
import 'package:bluehive_exam/models/cart_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../../models/product.dart';
import '../../repositories/product_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  final CartRepository cartRepository;
  final String userId;

  CartBloc({
    required this.cartRepository,
    required this.userId,
  }) : super(CartInitial()) {
    
    // * listen to cart stream on firebase repository
    cartRepository.getAllCartProducts().listen((cartProducts) {
      add(UpdateCart(cartProducts: cartProducts));
    });
    

    on<UpdateCart>((event, emit) async {

        List<CartProduct> _finalProducts = [];
        double _total = 0;
        int _quantity = 0;

        for (var _cartProduct in event.cartProducts) {
          if (_cartProduct.userId == userId) {
            _finalProducts.add(_cartProduct);
            Product _product = await ProductRepository(firebaseFirestore: FirebaseFirestore.instance).getProductById(id: _cartProduct.productId);
            _total += _cartProduct.quantity * _product.price;
            _quantity += _cartProduct.quantity;
          }
        }

        emit(CartLoaded(
          cartProducts: _finalProducts,
          total: _total,
          quantity: _quantity,
        ));
    });
    
    on<AddToCart>((event, emit) async {
      
      await cartRepository.addToCart(
        id: event.id,
        productId: event.productId,
        quantity: event.quantity,
        userId: userId,

      );

    });
  }
}
