import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/bloc/basket/basket_bloc.dart';
import 'package:flutter_apple_shop/bloc/basket/basket_event.dart';
import 'package:flutter_apple_shop/bloc/product/product_bloc.dart';
import 'package:flutter_apple_shop/bloc/product/product_event.dart';
import 'package:flutter_apple_shop/bloc/product/product_state.dart';
import 'package:flutter_apple_shop/constants/constants.dart';
import 'package:flutter_apple_shop/data/model/product_image_model.dart';
import 'package:flutter_apple_shop/data/model/product_model.dart';
import 'package:flutter_apple_shop/data/model/product_property_model.dart';
import 'package:flutter_apple_shop/data/model/product_varint_model.dart';
import 'package:flutter_apple_shop/data/model/variant_model.dart';
import 'package:flutter_apple_shop/data/model/variant_type_model.dart';
import 'package:flutter_apple_shop/generated/assets.dart';
import 'package:flutter_apple_shop/ui/widgets/cached_image.dart';
import 'package:flutter_apple_shop/util/extenstion/hex_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var bloc = ProductBloc();
        bloc.add(
          ProductInitEvent(
            widget.product.id,
            widget.product.categoryId,
          ),
        );
        return bloc;
      },
      child: ProductUI(widget: widget),
    );
  }
}

class ProductUI extends StatelessWidget {
  const ProductUI({
    super.key,
    required this.widget,
  });

  final ProductDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundScreenColor,
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) => SafeArea(
          child: CustomScrollView(
            slivers: [
              if (state is ProductDetailLoadingState) ...[
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              ],

              if (state is ProductDetailResponseState) ...[
                state.productCategory.fold(
                  (errorMessage) =>
                      const AppBarProduct(productCategory: 'اطلاعات محصول'),
                  (productCategory) => AppBarProduct(
                      productCategory:
                          productCategory.title ?? 'اطلاعات محصول'),
                ),
                SliverToBoxAdapter(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        widget.product.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'SB',
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                state.productImages.fold(
                  (errorMessage) {
                    return const SliverToBoxAdapter();
                  },
                  (productImageList) {
                    return GalleryWidget(
                      productsImages: productImageList,
                      defaultProductThumbnail: widget.product.thumbnail,
                    );
                  },
                ),
                state.productVariants.fold(
                  (errorMessage) => const SliverToBoxAdapter(),
                  (productVariant) =>
                      VariantContainer(productVariantList: productVariant),
                ),
                state.productProperties.fold(
                  (errorMessage) => const SliverToBoxAdapter(),
                  (productProperties) =>
                      ProductProperties(propertiesList: productProperties),
                ),
                ProductDescription(description: widget.product.description),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(left: 44, right: 44, top: 20),
                    height: 46,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: ColorsApp.mainGrey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            const Text(
                              "نظرات کاربران :",
                              style: TextStyle(fontFamily: 'SM'),
                            ),
                            const SizedBox(width: 10),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  height: 26,
                                  width: 26,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          width: 1, color: ColorsApp.mainGrey)),
                                ),
                                Positioned(
                                  right: 15,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    height: 26,
                                    width: 26,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            width: 1,
                                            color: ColorsApp.mainGrey)),
                                  ),
                                ),
                                Positioned(
                                  right: 30,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    height: 26,
                                    width: 26,
                                    decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            width: 1,
                                            color: ColorsApp.mainGrey)),
                                  ),
                                ),
                                Positioned(
                                  right: 45,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    height: 26,
                                    width: 26,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            width: 1,
                                            color: ColorsApp.mainGrey)),
                                  ),
                                ),
                                Positioned(
                                  right: 60,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    height: 26,
                                    width: 26,
                                    decoration: BoxDecoration(
                                      color: ColorsApp.mainGrey,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        width: 1,
                                        color: ColorsApp.mainGrey,
                                      ),
                                    ),
                                    child: const Center(
                                        child: Directionality(
                                            textDirection: TextDirection.ltr,
                                            child: Text(
                                              "+10",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'SB',
                                                  fontSize: 10),
                                            ))),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Text(
                              "مشاهده",
                              style: TextStyle(
                                  fontFamily: 'SB',
                                  fontSize: 12,
                                  color: ColorsApp.blueIndicator),
                            ),
                            const SizedBox(width: 10),
                            Image.asset(Assets.imagesIconLeftCategroy),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 44, vertical: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const PriceTagButton(),
                        AddToBasketButton(product: widget.product),
                      ],
                    ),
                  ),
                ),
              ],
              // SliverToBoxAdapter(
              //   child: Directionality(
              //     textDirection: TextDirection.rtl,
              //     child: Padding(
              //       padding:
              //           const EdgeInsets.only(top: 20, left: 44, right: 44),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           const Text(
              //             "انتخاب حافظه داخلی",
              //             style: TextStyle(
              //               fontFamily: 'SM',
              //               fontSize: 12,
              //             ),
              //           ),
              //           const SizedBox(height: 10),
              //           Row(
              //             children: [
              //               Container(
              //                 margin: const EdgeInsets.only(left: 10),
              //                 height: 25,
              //                 decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.circular(8),
              //                   border: Border.all(
              //                     width: 1,
              //                     color: ColorsApp.mainGrey,
              //                   ),
              //                 ),
              //                 child: const Center(
              //                   child: Padding(
              //                     padding: EdgeInsets.symmetric(horizontal: 20),
              //                     child: Text(
              //                       "128",
              //                       style: TextStyle(
              //                         fontFamily: 'SB',
              //                         fontSize: 12,
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               Container(
              //                 margin: const EdgeInsets.only(left: 10),
              //                 height: 25,
              //                 decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.circular(8),
              //                   border: Border.all(
              //                     width: 1,
              //                     color: ColorsApp.mainGrey,
              //                   ),
              //                 ),
              //                 child: const Center(
              //                   child: Padding(
              //                     padding: EdgeInsets.symmetric(horizontal: 20),
              //                     child: Text(
              //                       "280",
              //                       style: TextStyle(
              //                         fontFamily: 'SB',
              //                         fontSize: 12,
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               Container(
              //                 margin: const EdgeInsets.only(left: 10),
              //                 height: 25,
              //                 decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.circular(8),
              //                   border: Border.all(
              //                     width: 1,
              //                     color: ColorsApp.mainGrey,
              //                   ),
              //                 ),
              //                 child: const Center(
              //                   child: Padding(
              //                     padding: EdgeInsets.symmetric(horizontal: 20),
              //                     child: Text(
              //                       "280",
              //                       style: TextStyle(
              //                         fontFamily: 'SB',
              //                         fontSize: 12,
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductProperties extends StatefulWidget {
  final List<ProductPropertyModel> propertiesList;

  const ProductProperties({Key? key, required this.propertiesList})
      : super(key: key);

  @override
  State<ProductProperties> createState() => _ProductPropertiesState();
}

class _ProductPropertiesState extends State<ProductProperties> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    if (widget.propertiesList.isEmpty) {
      return const SliverToBoxAdapter();
    }
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(left: 44, right: 44, top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        height: _isVisible ? null : 46,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: ColorsApp.mainGrey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    const Text(
                      "مشخصات فنی :",
                      style: TextStyle(fontFamily: 'SM'),
                    ),
                    const Spacer(),
                    const Text(
                      "مشاهده",
                      style: TextStyle(
                          fontFamily: 'SB',
                          fontSize: 12,
                          color: ColorsApp.blueIndicator),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(Assets.imagesIconLeftCategroy),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: _isVisible,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.propertiesList.length,
                itemBuilder: (context, index) {
                  var properties = widget.propertiesList[index];
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          '${properties.title} :',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          '${properties.value}',
                          style:
                              const TextStyle(fontSize: 12, fontFamily: 'SM'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDescription extends StatefulWidget {
  final String description;

  const ProductDescription({Key? key, required this.description})
      : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(left: 44, right: 44, top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        height: _isVisible ? null : 46,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: ColorsApp.mainGrey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    _isVisible = !_isVisible;
                  }),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      const Text(
                        "توضیحات محصول :",
                        style: TextStyle(fontFamily: 'SM'),
                      ),
                      const Spacer(),
                      const Text(
                        "مشاهده",
                        style: TextStyle(
                            fontFamily: 'SB',
                            fontSize: 12,
                            color: ColorsApp.blueIndicator),
                      ),
                      const SizedBox(width: 10),
                      Image.asset(Assets.imagesIconLeftCategroy),
                    ],
                  ),
                ),
                Visibility(
                  visible: _isVisible,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Center(
                          child: Text(
                            widget.description,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                fontFamily: 'SM', fontSize: 14, height: 1.8),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarProduct extends StatelessWidget {
  final String productCategory;

  const AppBarProduct({Key? key, required this.productCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 32),
        child: Container(
          height: 46,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(Assets.imagesIconAppleBlue),
                ),
                Expanded(
                  child: Text(
                    productCategory,
                    style: const TextStyle(
                      fontFamily: 'SM',
                      fontSize: 16,
                      color: ColorsApp.mainBlue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset(Assets.imagesIconBack),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VariantContainer extends StatelessWidget {
  final List<ProductVarintModel> productVariantList;

  const VariantContainer({Key? key, required this.productVariantList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            for (var item in productVariantList) ...[
              VariantGeneratorChild(productVariant: item),
            ],
          ],
        ),
      ),
    );
  }
}

class VariantGeneratorChild extends StatelessWidget {
  final ProductVarintModel productVariant;

  const VariantGeneratorChild({Key? key, required this.productVariant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 44, right: 44),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productVariant.variantType.title!,
            style: const TextStyle(
              fontFamily: 'SM',
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 10),
          if (productVariant.variantType.type == VariantTypeEnum.Color) ...{
            ColorVariantsList(variantList: productVariant.variantList),
          },
          if (productVariant.variantType.type == VariantTypeEnum.Storage) ...{
            StorageVariantList(
              storageVariant: productVariant.variantList,
            ),
          },
          if (productVariant.variantType.type == VariantTypeEnum.Voltage) ...{
            StorageVariantList(
              storageVariant: productVariant.variantList,
            ),
          },
        ],
      ),
    );
  }
}

class GalleryWidget extends StatefulWidget {
  final List<ProductImageModel> productsImages;
  final String defaultProductThumbnail;

  const GalleryWidget({
    super.key,
    required this.productsImages,
    required this.defaultProductThumbnail,
  });

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 44),
        height: widget.productsImages.isEmpty ? 225 : 284,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 14, left: 14, top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(Assets.imagesIconStar),
                        const SizedBox(height: 2),
                        const Text(
                          "4.6",
                          style: TextStyle(fontFamily: 'SM', fontSize: 12),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: CachedImage(
                        imageUrl: widget.productsImages.isEmpty
                            ? widget.defaultProductThumbnail
                            : widget.productsImages[_selectedItem].imagrUrl!,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(Assets.imagesIconFavoriteDeactive),
                  ],
                ),
              ),
            ),
            if (widget.productsImages.isNotEmpty) ...[
              SizedBox(
                height: 74,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.productsImages.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedItem = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 8),
                        height: 70,
                        width: 70,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: (_selectedItem == index)
                                  ? ColorsApp.blueIndicator
                                  : ColorsApp.mainGrey,
                              width: (_selectedItem == index) ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: CachedImage(
                          imageUrl: widget.productsImages[index].imagrUrl!,
                          radius: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ]
          ],
        ),
      ),
    );
  }
}

class AddToBasketButton extends StatelessWidget {
  final ProductModel product;
  const AddToBasketButton({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 140,
          height: 60,
          decoration: BoxDecoration(
              color: ColorsApp.mainBlue,
              borderRadius: BorderRadius.circular(15)),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: GestureDetector(
              onTap: () async {
                context.read<ProductBloc>().add(ProductAddToBasket(product));
                context.read<BasketBloc>().add(BasketFetchFromHiveEvent());
              },
              child: const SizedBox(
                width: 160,
                height: 53,
                child: Center(
                    child: Text(
                  "افزود به سبد خرید",
                  style: TextStyle(
                    fontFamily: 'SB',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PriceTagButton extends StatelessWidget {
  const PriceTagButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 140,
          height: 60,
          decoration: BoxDecoration(
              color: ColorsApp.mainGreen,
              borderRadius: BorderRadius.circular(15)),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: SizedBox(
              width: 160,
              height: 53,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      "تومان",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'SM',
                      ),
                    ),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "49,800,000",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 12,
                            fontFamily: 'SM',
                          ),
                        ),
                        Text(
                          "49,800,000",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'SM',
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        child: Text(
                          "3%",
                          style: TextStyle(
                            fontFamily: 'SB',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ColorVariantsList extends StatefulWidget {
  final List<VariantModel> variantList;

  const ColorVariantsList({Key? key, required this.variantList})
      : super(key: key);

  @override
  State<ColorVariantsList> createState() => _ColorVariantsListState();
}

class _ColorVariantsListState extends State<ColorVariantsList> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.variantList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                height: (_selectedIndex == index) ? 30 : 26,
                width: (_selectedIndex == index) ? 30 : 26,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: (_selectedIndex == index)
                      ? Border.all(
                          width: 2,
                          color: ColorsApp.blueIndicator,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        )
                      : Border.all(width: 2, color: ColorsApp.mainGrey),
                ),
                child: Center(
                  child: Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: hexColor(widget.variantList[index].value!),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class StorageVariantList extends StatefulWidget {
  final List<VariantModel> storageVariant;

  const StorageVariantList({Key? key, required this.storageVariant})
      : super(key: key);

  @override
  State<StorageVariantList> createState() => _StorageVariantListState();
}

class _StorageVariantListState extends State<StorageVariantList> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.storageVariant.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              height: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: (_selectedIndex == index)
                    ? Border.all(
                        width: 2,
                        color: ColorsApp.blueIndicator,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      )
                    : Border.all(
                        width: 1,
                        color: ColorsApp.mainGrey,
                      ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    widget.storageVariant[index].name!,
                    style: const TextStyle(
                      fontFamily: 'SB',
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
