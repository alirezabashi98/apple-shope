import 'package:dartz/dartz.dart';
import '../../data/model/category_model.dart';

abstract class CategoryState {}

class CategoryInitiateState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryResponseState extends CategoryState {
  Either<String, List<CategoryModel>> response;

  CategoryResponseState(this.response);
}
