import 'package:dartz/dartz.dart';
import 'package:flutter_apple_shop/data/model/product_model.dart';

abstract class CategoryProductState {}

class CategoryProductLoadingState extends CategoryProductState {}

class CategoryProductResponsesState extends CategoryProductState {
  Either<String, List<ProductModel>> productListByCategory;

  CategoryProductResponsesState(this.productListByCategory);
}
