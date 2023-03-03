class CategoryModel {
  String? collectionId;
  String? id;
  String? thumbnail;
  String? title;
  String? color;
  String? icon;

  CategoryModel(this.collectionId, this.id, this.thumbnail, this.title, this.color,
      this.icon);

  factory CategoryModel.fromMapJson(Map<String, dynamic> jsonObject) {
    return CategoryModel(
        jsonObject['collectionId'],
        jsonObject['id'],
        'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
        jsonObject['title'],
        jsonObject['color'],
      'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['icon']}',);
  }
}