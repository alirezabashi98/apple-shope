class BannerModel{
  String? id;
  String? collectionId;
  String? thumbnail;
  String? categoryId;

  BannerModel(this.id,this.categoryId,this.thumbnail,this.collectionId);

  factory BannerModel.fromMapJson(Map<String, dynamic> jsonMapObject) =>
      BannerModel(
        jsonMapObject['id'],
        jsonMapObject['collectionId'],
        'http://startflutter.ir/api/files/${jsonMapObject['collectionId']}/${jsonMapObject['id']}/${jsonMapObject['thumbnail']}',
        jsonMapObject['categoryId'],
      );
}