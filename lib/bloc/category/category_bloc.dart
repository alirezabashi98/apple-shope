// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:flutter_apple_shop/bloc/category/category_event.dart';
import 'package:flutter_apple_shop/bloc/category/category_state.dart';
import 'package:flutter_apple_shop/data/repository/category_repository.dart';

import '../../di/di.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitiateState()) {
    final ICategoryRepository _categoryRepository = locator.get();
    on<CategoryRequestListEvent>((event, emit) async {
      emit(CategoryLoadingState());
      var response = await _categoryRepository.getCategory();
      emit(CategoryResponseState(response));
    });
  }
}
