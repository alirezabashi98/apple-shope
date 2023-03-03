class VariantModel {
  String? id;
  String? name;
  String? typeId;
  String? value;
  int? priceChange;

  VariantModel(this.id, this.name, this.typeId, this.value, this.priceChange);

  factory VariantModel.fromJson(Map<String, dynamic> jsonObject) {
    return VariantModel(
      jsonObject['id'],
      jsonObject['name'],
      jsonObject['type_id'],
      jsonObject['value'],
      jsonObject['price_change'],
    );
  }
}
