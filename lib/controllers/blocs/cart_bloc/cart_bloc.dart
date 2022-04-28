import 'package:bloc/bloc.dart';
import 'package:bluehive_exam/controllers/blocs/products_bloc/products_bloc.dart';
import 'package:bluehive_exam/controllers/repositories/cart_repository.dart';
import 'package:bluehive_exam/models/cart_product.dart';
import 'package:equatable/equatable.dart';

import '../../../models/product.dart';
import '../../repositories/product_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {


  final CartRepository cartRepository;
  final ProductRepository productRepository;
  final ProductsBloc productsBloc;
  final String userId;


  CartBloc({
    required this.cartRepository,
    required this.productRepository,
    required this.productsBloc,
    required this.userId,
  }) : super(CartInitial()) {
    

      // * listen to PRODUCTS stream on products bloc
    productsBloc.stream.listen((event) {
      
      // * listen to CART stream on Firebase repository
      cartRepository.getUserCartProducts(userId: userId)
        .listen((_cartProducts) {

          List<Product> _products = [];
          
          ProductsState _productsState = productsBloc.state;
          if(_productsState is ProductsLoaded) _products = _productsState.products;

          add(UpdateCart(cartProducts: _cartProducts, products: _products));

      });

    });
    
    
    // * UpdateCart event handler
    on<UpdateCart>((event, emit) async {
      
      // notify that the products are loading
      emit(CartLoading());

      // uncomment code below to simulate delay
      // await Future.delayed(const Duration(seconds: 10));

      // total price
      double _total = 0;
      // quantity count
      int _quantity = 0;

      List<CartProduct> _cartProductsWithProductData = [];

      for(int _index=0;_index<event.cartProducts.length;_index++) {

        final Product? _product = pluckProduct(products: event.products, id: event.cartProducts[_index].productId);
        
        final _cartProduct = CartProduct(
          id: event.cartProducts[_index].id,
          userId: event.cartProducts[_index].userId,
          productId: event.cartProducts[_index].productId,
          quantity: event.cartProducts[_index].quantity,
          product: _product,
        );
        
        _cartProductsWithProductData.add(_cartProduct);

        // null guard
        double _price  = _cartProductsWithProductData[_index].product==null ? 0 : _cartProductsWithProductData[_index].product!.price;

        _total += _cartProductsWithProductData[_index].quantity * _price;
        _quantity += _cartProductsWithProductData[_index].quantity;

      }

      emit(CartLoaded(
        cartProducts: _cartProductsWithProductData,
        total: _total,
        quantity: _quantity,
      ));

    });
    
    on<UpdateCartItem>((event, emit) async {
      
      await cartRepository.updateCartItem(
        cartId: event.cartItemId,
        quantity: event.quantity,
      );

    });
    
    on<AddToCart>((event, emit) async {
      
      await cartRepository.addToCart(
        productId: event.productId,
        quantity: event.quantity,
        userId: userId,
      );

    });
  }



  // helper function
  Product? pluckProduct({required List<Product> products, required String id}) {

    for (var _product in products) {
      if (_product.id==id) {
        return _product;
      }
    }

    return null;

  }


}
