import 'package:dartz/dartz.dart';
import 'package:flutter_apple_shop/data/model/banner_model.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeResponseState extends HomeState {
  Either<String, List<BannerModel>> bannerList;

  HomeResponseState(this.bannerList);
}
