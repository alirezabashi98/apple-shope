import 'package:dartz/dartz.dart';
import 'package:flutter_apple_shop/data/datasource/product_datasource.dart';

import '../../di/di.dart';
import '../../util/api_exception.dart';
import '../model/product_model.dart';

abstract class IProductRepository {
  Future<Either<String, List<ProductModel>>> getProducts();
  Future<Either<String, List<ProductModel>>> getHottest();
  Future<Either<String, List<ProductModel>>> getBastSeller();
}

class ProductRepository extends IProductRepository{
  final IProductDatasource _dataSource = locator.get();

  @override
  Future<Either<String, List<ProductModel>>> getProducts() async{
    try{
      var response = await _dataSource.getProducts();
      return right(response);
    }on ApiException catch(ex){
      return left(ex.message??'خطای محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> getBastSeller() async{
    try{
      var response = await _dataSource.getBestSeller();
      return right(response);
    }on ApiException catch(ex){
      return left(ex.message??'خطای محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> getHottest() async{
    try{
      var response = await _dataSource.getHottest();
      return right(response);
    }on ApiException catch(ex){
      return left(ex.message??'خطای محتوای متنی ندارد');
    }
  }


}