import 'package:dartz/dartz.dart';
import 'package:flutter_apple_shop/data/datasource/product_detail_datasource.dart';
import 'package:flutter_apple_shop/data/model/product_image_model.dart';
import 'package:flutter_apple_shop/data/model/product_varint_model.dart';
import 'package:flutter_apple_shop/data/model/variant_type_model.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_apple_shop/util/api_exception.dart';

abstract class IDetailProductRepository {
  Future<Either<String, List<ProductImageModel>>> getProductImage();

  Future<Either<String, List<VariantTypeModel>>> getVariantTypes();

  Future<Either<String, List<ProductVarintModel>>> getProductVariant();
}

class DetaileProductRepository extends IDetailProductRepository {
  final IDetailProductDatasource _dataSource = locator.get();

  @override
  Future<Either<String, List<ProductImageModel>>> getProductImage() async {
    try {
      var response = await _dataSource.getGallery();
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
  Future<Either<String, List<ProductVarintModel>>> getProductVariant() async {
    try {
      var response = await _dataSource.getProductVarints();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطای محتوای متنی ندارد');
    }
  }
}
