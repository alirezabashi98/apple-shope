import 'package:bloc/bloc.dart';
import 'package:flutter_apple_shop/bloc/product/product_event.dart';
import 'package:flutter_apple_shop/bloc/product/product_state.dart';
import 'package:flutter_apple_shop/data/repository/product_detail_repository.dart';
import 'package:flutter_apple_shop/di/di.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IDetailProductRepository _productRepository = locator.get();

  ProductBloc() : super(ProductDetailInitState()) {
    on<ProductInitEvent>(
      (event, emit) async {
        emit(ProductDetailLoadingState());
        var productImages = await _productRepository.getProductImage();
        var productVariant = await _productRepository.getProductVariant();
        emit(
          ProductDetailResponseState(productImages, productVariant),
        );
      },
    );
  }
}
