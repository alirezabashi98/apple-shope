import 'package:flutter_apple_shop/data/model/product_model.dart';

abstract class ProductEvent {}

class ProductInitEvent extends ProductEvent {
  final String productId;
  final String categoryId;

  ProductInitEvent(
    this.productId,
    this.categoryId,
  );
}

class ProductAddToBasket extends ProductEvent {
  ProductModel product;
  ProductAddToBasket(this.product);
}
