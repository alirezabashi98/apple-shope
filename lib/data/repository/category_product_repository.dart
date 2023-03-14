import 'package:dartz/dartz.dart';
import 'package:flutter_apple_shop/data/datasource/category_product_datasource.dart';
import 'package:flutter_apple_shop/data/model/product_model.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_apple_shop/util/api_exception.dart';

abstract class ICategoryProductRepository{
  Future<Either<String,List<ProductModel>>> getProductByCategoryId(String categoryId);
}

class CategoryProductRepository extends ICategoryProductRepository{
  final ICategoryProductDatasource _dataSource = locator.get();

  @override
  Future<Either<String, List<ProductModel>>> getProductByCategoryId(String categoryId) async {
    try {
    var response = await _dataSource.getProductByCategoryId(categoryId);
    return right(response);
    } on ApiException catch (ex) {
    return left(ex.message ?? 'خطای محتوای متنی ندارد');
    }
  }
}