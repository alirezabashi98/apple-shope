import 'package:dartz/dartz.dart';
import 'package:flutter_apple_shop/data/datasource/basket_datasource.dart';
import 'package:flutter_apple_shop/data/model/basket_model.dart';
import 'package:flutter_apple_shop/di/di.dart';

abstract class IBasketRepository {
  Future<Either<String, String>> addProductToBasket(BasketModel basket);
  Future<Either<String, List<BasketModel>>> getAllBasketItems();
  Future<int> getBasketFinalPrice();
}

class BasketRepository extends IBasketRepository {
  final IBasketDatasource datasource = locator.get();

  @override
  Future<Either<String, String>> addProductToBasket(BasketModel basket) async {
    try {
      await datasource.addProduct(basket);
      return right('success add porduct in basket');
    } catch (ex) {
      return left('error add porduct in basket');
    }
  }

  @override
  Future<Either<String, List<BasketModel>>> getAllBasketItems() async {
    try {
      List<BasketModel> baskets = await datasource.getAllBasket();
      return right(baskets);
    } catch (ex) {
      return left('error get all basket');
    }
  }

  @override
  Future<int> getBasketFinalPrice() async {
    return datasource.getBasketFinalPrice();
  }
}
