import 'package:dartz/dartz.dart';
import 'package:flutter_apple_shop/data/datasource/product_detail_datasource.dart';
import 'package:flutter_apple_shop/data/model/category_model.dart';
import 'package:flutter_apple_shop/data/model/product_image_model.dart';
import 'package:flutter_apple_shop/data/model/product_property_model.dart';
import 'package:flutter_apple_shop/data/model/product_varint_model.dart';
import 'package:flutter_apple_shop/data/model/variant_type_model.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_apple_shop/util/api_exception.dart';

abstract class IDetailProductRepository {
  Future<Either<String, List<ProductImageModel>>> getProductImage(
      String productId);

  Future<Either<String, List<VariantTypeModel>>> getVariantTypes();

  Future<Either<String, List<ProductVarintModel>>> getProductVariant(
      String productId);

  Future<Either<String, CategoryModel>> getProductCategory(String categoryId);

  Future<Either<String, List<ProductPropertyModel>>> getProductProperties(
      String categoryId);
}

class DetaileProductRepository extends IDetailProductRepository {
  final IDetailProductDatasource _dataSource = locator.get();

  @override
  Future<Either<String, List<ProductImageModel>>> getProductImage(
      String productId) async {
    try {
      var response = await _dataSource.getGallery(productId);
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطای محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<VariantTypeModel>>> getVariantTypes() async {
    try {
      var response = await _dataSource.getVariantTypes();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطای محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<ProductVarintModel>>> getProductVariant(
      String productId) async {
    try {
      var response = await _dataSource.getProductVarints(productId);
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطای محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, CategoryModel>> getProductCategory(
      String categoryId) async {
    try {
      var response = await _dataSource.getProductCategory(categoryId);
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطای محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<ProductPropertyModel>>> getProductProperties(
      String categoryId) async {
    try {
      var response = await _dataSource.getProductProperties(categoryId);
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطای محتوای متنی ندارد');
    }
  }
}
