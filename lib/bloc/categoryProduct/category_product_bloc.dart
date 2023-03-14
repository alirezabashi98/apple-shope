import 'package:bloc/bloc.dart';
import 'package:flutter_apple_shop/bloc/categoryProduct/category_product_event.dart';
import 'package:flutter_apple_shop/bloc/categoryProduct/category_product_state.dart';
import 'package:flutter_apple_shop/data/repository/category_product_repository.dart';
import 'package:flutter_apple_shop/di/di.dart';

class CategoryProductBloc
    extends Bloc<CategoryProductEvent, CategoryProductState> {
  final ICategoryProductRepository _repository = locator.get();

  CategoryProductBloc() : super(CategoryProductLoadingState()) {
    on<CategoryInitEvent>(
      (event, emit) async {
        var productListByCategory = await _repository
            .getProductByCategoryId(event.categoryId);
        emit(CategoryProductResponsesState(productListByCategory));
      },
    );
  }
}
