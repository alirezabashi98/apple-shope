import 'package:dartz/dartz.dart';
import 'package:flutter_apple_shop/data/model/product_image_model.dart';
import 'package:flutter_apple_shop/data/model/product_varint_model.dart';
import 'package:flutter_apple_shop/data/model/variant_type_model.dart';

abstract class ProductState {}

class ProductDetailInitState extends ProductState {}

class ProductDetailLoadingState extends ProductState {}

class ProductDetailResponseState extends ProductState {
  Either<String, List<ProductImageModel>> productImages;
  Either<String, List<ProductVarintModel>> productVariants;

  ProductDetailResponseState(this.productImages, this.productVariants);
}
