class ProductModel {
  String id;
  String collectionId;
  String thumbnail;
  String description;
  int discountPrice;
  int price;
  String popularity;
  String name;
  int quantity;
  String categoryId;
  int? realPrice;
  num? persent;

  ProductModel(
      this.id,
      this.collectionId,
      this.thumbnail,
      this.description,
      this.discountPrice,
      this.price,
      this.popularity,
      this.name,
      this.quantity,
      this.categoryId) {
    realPrice = price + discountPrice;
    persent = ((price - realPrice!) / price) * 100;
  }

  factory ProductModel.fromJson(Map<String, dynamic> jsonMapObject) {
    return ProductModel(
        jsonMapObject['id'],
        jsonMapObject['collectionId'],
        'http://startflutter.ir/api/files/${jsonMapObject['collectionId']}/${jsonMapObject['id']}/${jsonMapObject['thumbnail']}',
        jsonMapObject['description'],
        jsonMapObject['discount_price'],
        jsonMapObject['price'],
        jsonMapObject['popularity'],
        jsonMapObject['name'],
        jsonMapObject['quantity'],
        jsonMapObject['category']);
  }
}
