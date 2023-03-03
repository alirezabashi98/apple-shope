import 'package:dartz/dartz.dart';
import 'package:flutter_apple_shop/data/model/banner_model.dart';
import 'package:flutter_apple_shop/data/model/category_model.dart';

import '../../data/model/product_model.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeResponseState extends HomeState {
  Either<String, List<BannerModel>> bannerList;
  Either<String, List<CategoryModel>> categoryList;
  Either<String, List<ProductModel>> productList;
  Either<String, List<ProductModel>> hottestProductList;
  Either<String, List<ProductModel>> bastSellerProductList;

  HomeResponseState(this.bannerList, this.categoryList, this.productList,this.hottestProductList,this.bastSellerProductList);
}