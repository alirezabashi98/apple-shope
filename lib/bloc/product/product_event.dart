abstract class ProductEvent {}

class ProductInitEvent extends ProductEvent {
  final String productId;
  final String categoryId;

  ProductInitEvent(this.productId,this.categoryId,);
}