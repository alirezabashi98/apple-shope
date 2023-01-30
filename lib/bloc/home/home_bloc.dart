import 'package:bloc/bloc.dart';
import 'package:flutter_apple_shop/bloc/home/home_event.dart';
import 'package:flutter_apple_shop/bloc/home/home_state.dart';
import 'package:flutter_apple_shop/data/repository/banner_repository.dart';
import 'package:flutter_apple_shop/di/di.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository = locator.get();

  HomeBloc() : super(HomeInitState()) {
    on<HomeInitDataEvent>((event, emit) async {
      emit(HomeLoadingState());
      var response = await _bannerRepository.getBanners();
      emit(HomeResponseState(response));
    });
  }
}
