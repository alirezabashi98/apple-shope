import 'package:dio/dio.dart';
import 'package:flutter_apple_shop/data/model/product_image_model.dart';
import 'package:flutter_apple_shop/data/model/product_varint_model.dart';
import 'package:flutter_apple_shop/data/model/variant_model.dart';
import 'package:flutter_apple_shop/data/model/variant_type_model.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_apple_shop/util/api_exception.dart';

abstract class IDetailProductDatasource {
  Future<List<ProductImageModel>> getGallery();

  Future<List<VariantTypeModel>> getVariantTypes();

  Future<List<VariantModel>> getVariants();

  Future<List<ProductVarintModel>> getProductVarints();
}

class DetailProductRemoteDatasource extends IDetailProductDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<ProductImageModel>> getGallery() async {
    try {
      Map<String, String> qParams = {
        'filter': 'product_id="0tc0e5ju89x5ogj"',
      };
      var respones = await _dio.get('collections/gallery/records',
          queryParameters: qParams);
      return respones.data['items']
          .map<ProductImageModel>(
              (jsonObject) => ProductImageModel.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }

  @override
  Future<List<VariantTypeModel>> getVariantTypes() async {
    try {
      var respones = await _dio.get('collections/variants_type/records');

      return respones.data['items']
          .map<VariantTypeModel>(
              (jsonObject) => VariantTypeModel.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }

  @override
  Future<List<VariantModel>> getVariants() async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="0tc0e5ju89x5ogj"'};

      var respones = await _dio.get('collections/variants/records',
          queryParameters: qParams);

      return respones.data['items']
          .map<VariantModel>((jsonObject) => VariantModel.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }

  @override
  Future<List<ProductVarintModel>> getProductVarints() async {
    try {
      var variantTypeList = await getVariantTypes();
      var variantList = await getVariants();

      List<ProductVarintModel> productVariantList = [];

      for (var variantType in variantTypeList) {
        var variantListIsType = variantList
            .where((variant) => variant.typeId == variantType.id)
            .toList();
        productVariantList
            .add(ProductVarintModel(variantType, variantListIsType));
      }

      return productVariantList;
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }
}
