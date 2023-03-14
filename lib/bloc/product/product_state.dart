import 'package:dartz/dartz.dart';
import 'package:flutter_apple_shop/data/model/category_model.dart';
import 'package:flutter_apple_shop/data/model/product_image_model.dart';
import 'package:flutter_apple_shop/data/model/product_property_model.dart';
import 'package:flutter_apple_shop/data/model/product_varint_model.dart';
import 'package:flutter_apple_shop/data/model/variant_type_model.dart';

abstract class ProductState {}

class ProductDetailInitState extends ProductState {}

class ProductDetailLoadingState extends ProductState {}

class ProductDetailResponseState extends ProductState {
  Either<String, List<ProductImageModel>> productImages;
  Either<String, List<ProductVarintModel>> productVariants;
  Either<String, CategoryModel> productCategory;
  Either<String, List<ProductPropertyModel>> productProperties;

  ProductDetailResponseState(this.productImages, this.productVariants,this.productCategory,this.productProperties);
}
