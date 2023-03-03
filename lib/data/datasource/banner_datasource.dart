import 'package:dio/dio.dart';
import 'package:flutter_apple_shop/data/model/banner_model.dart';
import 'package:flutter_apple_shop/di/di.dart';

import '../../util/api_exception.dart';

abstract class IBannerDatasource {
  Future<List<BannerModel>> getBanners();
}

class BannerRemoteDatasource extends IBannerDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<BannerModel>> getBanners() async {
    try {
      print('request alfa');
      var respones = await _dio.get('collections/banner/records');
      print('success alfa');
      return respones.data['items']
          .map<BannerModel>(
              (jsonMapObject) => BannerModel.fromMapJson(jsonMapObject))
          .toList();
    } on DioError catch (ex) {
      print('error alfa');
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      print('error alfa');
      throw ApiException(0, 'unknown error');
    }
  }
}
