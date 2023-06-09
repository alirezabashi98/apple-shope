import 'package:flutter_apple_shop/bloc/basket/basket_event.dart';
import 'package:flutter_apple_shop/bloc/basket/basket_state.dart';
import 'package:flutter_apple_shop/data/repository/basket_repository.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final IBasketRepository _basketRepository = locator.get();

  BasketBloc() : super(BasketInitState()) {
    on<BasketFetchFromHiveEvent>((event, emit) async {
      final basketItemList = await _basketRepository.getAllBasketItems();
      final finalPrice = await _basketRepository.getBasketFinalPrice();
      emit(BasketDataFetchedState(basketItemList, finalPrice));
    });
  }
}
