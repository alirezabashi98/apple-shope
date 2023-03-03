class ProductImageModel {
  String? imagrUrl;
  String? productId;

  ProductImageModel(this.imagrUrl, this.productId);

  factory ProductImageModel.fromJson(Map<String, dynamic> jsonObject) {
    return ProductImageModel(
      'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['image']}',
      jsonObject['product_id'],
    );
  }
}
