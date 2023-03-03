import 'package:flutter_apple_shop/data/model/variant_model.dart';
import 'package:flutter_apple_shop/data/model/variant_type_model.dart';

class ProductVarintModel {
  VariantTypeModel variantType;
  List<VariantModel> variantList;

  ProductVarintModel(this.variantType, this.variantList);
}
