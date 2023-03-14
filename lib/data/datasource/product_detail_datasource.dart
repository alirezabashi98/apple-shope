import 'package:dio/dio.dart';
import 'package:flutter_apple_shop/data/model/category_model.dart';
import 'package:flutter_apple_shop/data/model/product_image_model.dart';
import 'package:flutter_apple_shop/data/model/product_property_model.dart';
import 'package:flutter_apple_shop/data/model/product_varint_model.dart';
import 'package:flutter_apple_shop/data/model/variant_model.dart';
import 'package:flutter_apple_shop/data/model/variant_type_model.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_apple_shop/util/api_exception.dart';

abstract class IDetailProductDatasource {
  Future<List<ProductImageModel>> getGallery(String productId);

  Future<List<VariantTypeModel>> getVariantTypes();

  Future<List<VariantModel>> getVariants(String productId);

  Future<List<ProductVarintModel>> getProductVarints(String productId);

  Future<CategoryModel> getProductCategory(String categoryId);

  Future<List<ProductPropertyModel>> getProductProperties(String categoryId);
}

class DetailProductRemoteDatasource extends IDetailProductDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<ProductImageModel>> getGallery(String productId) async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="$productId"'};
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
  Future<List<VariantModel>> getVariants(String productId) async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="$productId"'};

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
  Future<List<ProductVarintModel>> getProductVarints(String productId) async {
    try {
      var variantTypeList = await getVariantTypes();
      var variantList = await getVariants(productId);

      List<ProductVarintModel> productVariantList = [];

      for (var variantType in variantTypeList) {
        var variantListIsType = variantList
            .where((variant) => variant.typeId == variantType.id)
            .toList();
        if (variantListIsType.isNotEmpty) {
          productVariantList
              .add(ProductVarintModel(variantType, variantListIsType));
        }
      }

      return productVariantList;
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }

  @override
  Future<CategoryModel> getProductCategory(String categoryId) async {
    try {
      Map<String, String> qParams = {'filter': 'id="$categoryId"'};

      var respones = await _dio.get(
        'collections/category/records',
        queryParameters: qParams,
      );

      return CategoryModel.fromMapJson(respones.data['items'][0]);
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }

  @override
  Future<List<ProductPropertyModel>> getProductProperties(String categoryId) async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="$categoryId"'};

      var respones = await _dio.get(
        'collections/properties/records',
        queryParameters: qParams,
      );
      return respones.data['items']
          .map<ProductPropertyModel>(
              (jsonObject) => ProductPropertyModel.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }
}
