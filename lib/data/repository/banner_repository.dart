import 'package:dartz/dartz.dart';
import 'package:flutter_apple_shop/data/datasource/banner_datasource.dart';
import 'package:flutter_apple_shop/data/model/banner_model.dart';
import 'package:flutter_apple_shop/di/di.dart';

import '../../util/api_exception.dart';

abstract class IBannerRepository {
  Future<Either<String, List<BannerModel>>> getBanners();
}

class BannerRepository extends IBannerRepository {
  final IBannerDatasource _bannerDatasource = locator.get();

  @override
  Future<Either<String, List<BannerModel>>> getBanners() async {
    try {
      var response = await _bannerDatasource.getBanners();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطای محتوای متنی ندارد');
    }
  }
}
