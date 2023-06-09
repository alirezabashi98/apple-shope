import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/bloc/basket/basket_bloc.dart';
import 'package:flutter_apple_shop/bloc/product/product_bloc.dart';
import 'package:flutter_apple_shop/constants/constants.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_apple_shop/ui/screens/product_detail_screen.dart';
import 'package:flutter_apple_shop/ui/widgets/cached_image.dart';
import 'package:flutter_apple_shop/util/open_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openPage(
          context,
          BlocProvider<BasketBloc>.value(
            value: locator.get<BasketBloc>(),
            child: ProductDetailScreen(product: product),
          ),
        );
      },
      child: Container(
        height: 216,
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              children: [
                Expanded(child: Container()),
                Center(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: CachedImage(imageUrl: product.thumbnail),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 0,
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset("assets/images/active_fav_product.png"),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      child: Text(
                        "${product.persent!.round()}%",
                        style: const TextStyle(
                          fontFamily: 'SB',
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(right: 12, bottom: 5, top: 5),
                child: Text(
                  product.name,
                  maxLines: 2,
                  style: const TextStyle(
                    fontFamily: 'SM',
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorsApp.mainBlue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorsApp.mainBlue,
                      blurRadius: 14,
                      spreadRadius: -12,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
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
                        children: [
                          Text(
                            product.price.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                              fontFamily: 'SM',
                            ),
                          ),
                          Text(
                            product.realPrice.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'SM',
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset(
                            "assets/images/icon_right_arrow_cricle.png"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
