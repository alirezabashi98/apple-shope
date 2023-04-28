import 'package:bloc/bloc.dart';
import 'package:flutter_apple_shop/bloc/product/product_event.dart';
import 'package:flutter_apple_shop/bloc/product/product_state.dart';
import 'package:flutter_apple_shop/data/model/basket_model.dart';
import 'package:flutter_apple_shop/data/repository/basket_repository.dart';
import 'package:flutter_apple_shop/data/repository/product_detail_repository.dart';
import 'package:flutter_apple_shop/di/di.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IDetailProductRepository _productRepository = locator.get();
  final IBasketRepository _basketRepository = locator.get();

  ProductBloc() : super(ProductDetailInitState()) {
    on<ProductInitEvent>(
      (event, emit) async {
        emit(ProductDetailLoadingState());
        var productImages =
            await _productRepository.getProductImage(event.productId);
        var productVariant =
            await _productRepository.getProductVariant(event.productId);
        var productCategory =
            await _productRepository.getProductCategory(event.categoryId);
        var productProperties =
            await _productRepository.getProductProperties(event.categoryId);
        emit(
          ProductDetailResponseState(productImages, productVariant,
              productCategory, productProperties),
        );
      },
    );

    on<ProductAddToBasket>(
      (event, emit) {
        var basketItem = BasketModel(
          event.product.id,
          event.product.collectionId,
          event.product.discountPrice,
          event.product.price,
          event.product.name,
          event.product.categoryId,
          event.product.thumbnail,
        );
        _basketRepository.addProductToBasket(basketItem);
      },
    );
  }
}
