import 'package:flutter_apple_shop/bloc/basket/basket_event.dart';
import 'package:flutter_apple_shop/bloc/basket/basket_state.dart';
import 'package:flutter_apple_shop/data/model/basket_model.dart';
import 'package:flutter_apple_shop/data/repository/basket_repository.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final IBasketRepository _basketRepository = locator.get();
  var box = Hive.box<BasketModel>('BasketBox');

  BasketBloc() : super(BasketInitState()) {
    on<BasketFetchFromHiveEvent>((event, emit) async {
      final basketItemList = await _basketRepository.getAllBasketItems();
      emit(BasketDataFetchedState(basketItemList));
    });

    box.listenable().addListener(
      () async {
        var basketItemList = await _basketRepository.getAllBasketItems();
        emit(BasketDataFetchedState(basketItemList));
      },
    );
  }
}
