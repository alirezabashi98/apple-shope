import 'package:hive/hive.dart';

part 'basket_model.g.dart';

@HiveType(typeId: 0)
class BasketModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String collectionId;
  @HiveField(2)
  String? thumbnail;
  @HiveField(3)
  int discountPrice;
  @HiveField(4)
  int price;
  @HiveField(5)
  String name;
  @HiveField(6)
  String categoryId;
  @HiveField(7)
  int? realPrice;
  @HiveField(8)
  num? persent;

  BasketModel(this.id, this.collectionId, this.discountPrice, this.price,
      this.name, this.categoryId,this.thumbnail) {
    realPrice = price + discountPrice;
    persent = ((price - realPrice!) / price) * 100;
    
  }
}
