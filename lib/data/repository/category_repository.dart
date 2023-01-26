import 'package:dartz/dartz.dart';
import 'package:flutter_apple_shop/data/datasource/category_datasource.dart';
import 'package:flutter_apple_shop/data/model/category_model.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_apple_shop/util/api_exception.dart';

abstract class ICategoryRepository{
  Future<Either<String,List<CategoryModel>>> getCategory();
}

class CategoryRepository extends ICategoryRepository{
  final ICategoryDataSource _dataSource = locator.get();

  @override
  Future<Either<String, List<CategoryModel>>> getCategory() async {
    try{
      var response = await _dataSource.getCategories();
      return right(response);
    }on ApiException catch(ex){
      return left(ex.message??'خطای محتوای متنی ندارد');
    }
  }

}