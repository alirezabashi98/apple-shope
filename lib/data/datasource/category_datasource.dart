import 'package:dio/dio.dart';
import 'package:flutter_apple_shop/data/model/category_model.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_apple_shop/util/api_exception.dart';

abstract class ICategoryDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDataSource extends ICategoryDataSource {
  final Dio _dio = locator.get();

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      var respones = await _dio.get('collections/category/records');
      return respones.data['items']
          .map<CategoryModel>(
              (jsonObject) => CategoryModel.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }
}
