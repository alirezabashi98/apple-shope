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
      var respones = await _dio.get('collections/banner/records');
      return respones.data['items']
          .map<BannerModel>(
              (jsonMapObject) => BannerModel.fromMapJson(jsonMapObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }
}
