class VariantTypeModel {
  String? id;
  String? name;
  String? title;
  VariantTypeEnum? type;

  VariantTypeModel(this.id, this.name, this.title, this.type);

  factory VariantTypeModel.fromJson(Map<String, dynamic> jsonObject) {
    return VariantTypeModel(
      jsonObject['id'],
      jsonObject['name'],
      jsonObject['title'],
      _getTypeEnum(jsonObject['type']),
    );
  }

}

VariantTypeEnum _getTypeEnum(String type) {
  switch (type) {
    case 'Color':
      return VariantTypeEnum.Color;
    case 'Storage':
      return VariantTypeEnum.Storage;
    case 'Voltage':
      return VariantTypeEnum.Voltage;
    default :
      return VariantTypeEnum.Color;
  }
}

enum VariantTypeEnum { Color, Storage, Voltage }
