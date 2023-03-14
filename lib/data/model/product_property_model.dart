class ProductPropertyModel {
  String? title;
  String? value;

  ProductPropertyModel(this.title, this.value);

  factory ProductPropertyModel.fromJson(Map<String, dynamic> jsonObject) =>
      ProductPropertyModel(
        jsonObject['title'],
        jsonObject['value'],
      );
}
