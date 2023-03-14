import 'package:dio/dio.dart';
import 'package:flutter_apple_shop/data/model/product_model.dart';
import 'package:flutter_apple_shop/data/model/variant_model.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_apple_shop/util/api_exception.dart';

abstract class ICategoryProductDatasource {
  Future<List<ProductModel>> getProductByCategoryId(String categoryId);
}

class CategoryProductRemoteDatasource extends ICategoryProductDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<ProductModel>> getProductByCategoryId(String categoryId) async {
    try {
      Map<String, String> qParams = {'filter': 'category="$categoryId"'};

      Response<dynamic> respones;
      if (categoryId == '78q8w901e6iipuk') {
        respones = await _dio.get('collections/products/records');
      } else {
        respones = await _dio.get('collections/products/records',
            queryParameters: qParams);
      }

      return respones.data['items']
          .map<ProductModel>((jsonObject) => ProductModel.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }
}
