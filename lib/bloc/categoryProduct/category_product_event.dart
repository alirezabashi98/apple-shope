abstract class CategoryProductEvent{}

class CategoryInitEvent extends CategoryProductEvent{
  String categoryId;
  CategoryInitEvent(this.categoryId);
}