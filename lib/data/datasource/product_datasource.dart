import 'package:dio/dio.dart';
import 'package:flutter_apple_shop/data/model/product_model.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_apple_shop/util/api_exception.dart';

abstract class IProductDatasource {
  Future<List<ProductModel>> getProducts();

  Future<List<ProductModel>> getHottest();

  Future<List<ProductModel>> getBestSeller();
}

class ProductRemoteDatasource extends IProductDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      var respones = await _dio.get('collections/products/records');
      return respones.data['items']
          .map<ProductModel>((jsonObject) => ProductModel.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }

  @override
  Future<List<ProductModel>> getBestSeller() async {
    try {
      Map<String,String> qParams = {
        'filter': 'popularity="Best Seller"',
      };
      var respones = await _dio.get('collections/products/records',queryParameters: qParams);
      return respones.data['items']
          .map<ProductModel>((jsonObject) => ProductModel.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }

  @override
  Future<List<ProductModel>> getHottest() async {
    try {
      Map<String,String> qParams = {
        'filter':'popularity="Hotest"',
      };
      var respones = await _dio.get('collections/products/records',queryParameters: qParams);
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
