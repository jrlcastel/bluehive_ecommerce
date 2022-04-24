part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
  
  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}


// * Products Loading State
class ProductsLoading extends ProductsState {}


// * Products Loaded State
class ProductsLoaded extends ProductsState {

  final List<Product> products;

  const ProductsLoaded({
    required this.products,
  });
  
  @override
  List<Object> get props => [products];

}
