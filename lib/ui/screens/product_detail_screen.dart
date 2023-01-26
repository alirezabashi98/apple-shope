import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/constants/constants.dart';
import 'package:flutter_apple_shop/generated/assets.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundScreenColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 20, bottom: 32),
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
                        const Expanded(
                          child: Text(
                            "آیفون",
                            style: TextStyle(
                              fontFamily: 'SM',
                              fontSize: 16,
                              color: ColorsApp.mainBlue,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset(Assets.imagesIconBack),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "آیفون 2022 se",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'SB', fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 44),
                height: 284,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 15, left: 15, top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(Assets.imagesIconStar),
                            const Text(
                              "4.6",
                              style: TextStyle(fontFamily: 'SM', fontSize: 12),
                            ),
                            const Spacer(),
                            SizedBox(
                              height: double.infinity,
                              child: Image.asset(Assets.imagesIphone),
                            ),
                            const Spacer(),
                            Image.asset(Assets.imagesIconFavoriteDeactive),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 74,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.only(left: 8),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorsApp.mainGrey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Image.asset(Assets.imagesIphone),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 44, right: 44),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "انتخاب رنگ",
                        style: TextStyle(
                          fontFamily: 'SM',
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 26,
                            width: 26,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    width: 1, color: ColorsApp.mainGrey)),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 26,
                            width: 26,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    width: 1, color: ColorsApp.mainGrey)),
                          ),
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
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 44, right: 44),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "انتخاب حافظه داخلی",
                        style: TextStyle(
                          fontFamily: 'SM',
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                width: 1,
                                color: ColorsApp.mainGrey,
                              ),
                            ),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "128",
                                  style: TextStyle(
                                    fontFamily: 'SB',
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                width: 1,
                                color: ColorsApp.mainGrey,
                              ),
                            ),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "280",
                                  style: TextStyle(
                                    fontFamily: 'SB',
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                width: 1,
                                color: ColorsApp.mainGrey,
                              ),
                            ),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "280",
                                  style: TextStyle(
                                    fontFamily: 'SB',
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
                                        width: 1, color: ColorsApp.mainGrey)),
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
                                        width: 1, color: ColorsApp.mainGrey)),
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
                                        width: 1, color: ColorsApp.mainGrey)),
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
                padding: const EdgeInsets.symmetric(horizontal: 44,vertical: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    PriceTagButton(),
                    AddToBasketButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({Key? key}) : super(key: key);

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
            borderRadius: BorderRadius.circular(15)
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
            child: const SizedBox(
              width: 160,
              height: 53,
              child: Center(child: Text("افزود به سبد خرید",style: TextStyle(fontFamily: 'SB',fontSize: 16,color: Colors.white,),)),
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
            borderRadius: BorderRadius.circular(15)
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
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
