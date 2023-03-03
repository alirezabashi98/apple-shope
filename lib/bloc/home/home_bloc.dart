import 'package:bloc/bloc.dart';
import 'package:flutter_apple_shop/bloc/home/home_event.dart';
import 'package:flutter_apple_shop/bloc/home/home_state.dart';
import 'package:flutter_apple_shop/data/repository/banner_repository.dart';
import 'package:flutter_apple_shop/data/repository/category_repository.dart';
import 'package:flutter_apple_shop/data/repository/product_repository.dart';
import 'package:flutter_apple_shop/di/di.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository = locator.get();
  final ICategoryRepository _categoryRepository = locator.get();
  final IProductRepository _productRepository = locator.get();

  HomeBloc() : super(HomeInitState()) {
    on<HomeInitDataEvent>(
      (event, emit) async {
        emit(HomeLoadingState());
        var responseBanner = await _bannerRepository.getBanners();
        var responseCategory = await _categoryRepository.getCategory();
        var responseProduct = await _productRepository.getProducts();

        var responseHottestProduct = await _productRepository.getHottest();
        var responseBastSellerProduct =
            await _productRepository.getBastSeller();

        emit(
          HomeResponseState(
            responseBanner,
            responseCategory,
            responseProduct,
            responseHottestProduct,
            responseBastSellerProduct,
          ),
        );
      },
    );
  }
}
