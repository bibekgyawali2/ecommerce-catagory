import 'package:equatable/equatable.dart';

import '../../model/product_model.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> productModel;
  const ProductLoaded(this.productModel);
}

class ProductError extends ProductState {
  final String? message;
  const ProductError(this.message);
}
