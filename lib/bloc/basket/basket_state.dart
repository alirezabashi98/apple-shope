import 'package:dartz/dartz.dart';
import 'package:flutter_apple_shop/data/model/basket_model.dart';

abstract class BasketState {}

class BasketInitState extends BasketState {}

class BasketDataFetchedState extends BasketState {
  Either<String,List<BasketModel>> basket;
  BasketDataFetchedState(this.basket);
}
