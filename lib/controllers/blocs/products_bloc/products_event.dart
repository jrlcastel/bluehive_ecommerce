part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductsEvent {}


class UpdateProducts extends ProductsEvent {

  final List<Product> products;

  const UpdateProducts({
    required this.products,
  });

  @override
  List<Object> get props => [products];
}
