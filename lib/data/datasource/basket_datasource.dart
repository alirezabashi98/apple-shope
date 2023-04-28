import 'package:flutter_apple_shop/data/model/basket_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class IBasketDatasource {
  Future<void> addProduct(BasketModel basket);
  Future<List<BasketModel>> getAllBasket();
}

class BasketLocalDatasource extends IBasketDatasource {
  var box = Hive.box<BasketModel>('BasketBox');

  @override
  Future<void> addProduct(BasketModel basket) async {
    await box.add(basket);
  }

  @override
  Future<List<BasketModel>> getAllBasket() async {
    return box.values.toList();
  }
}
