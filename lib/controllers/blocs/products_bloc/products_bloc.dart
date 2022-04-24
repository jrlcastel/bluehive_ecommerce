import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bluehive_exam/controllers/repositories/product_repository.dart';
import 'package:bluehive_exam/models/product.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {

  final ProductRepository productRepository;
  StreamSubscription? _categorySubscription;

  ProductsBloc({
    required this.productRepository,
  }) : super(ProductsInitial()) {
    
    productRepository.getAllProducts().listen((products) {
      add(UpdateProducts(products: products));
    });
    
    on<UpdateProducts>((event, emit) async {
        emit(ProductsLoaded(products: event.products));
    });

  }

}
