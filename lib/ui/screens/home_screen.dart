import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/constants/constants.dart';
import 'package:flutter_apple_shop/generated/assets.dart';
import 'package:flutter_apple_shop/ui/widgets/banner_slider.dart';
import 'package:flutter_apple_shop/ui/widgets/product_item.dart';
import 'package:flutter_apple_shop/ui/widgets/category_horizontal_item_chip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                            "جستجو محصولات",
                            style: TextStyle(
                              fontFamily: 'SM',
                              fontSize: 16,
                              color: ColorsApp.mainGrey,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset(Assets.imagesIconSearch),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: BannerSlider(),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 32, right: 20),
                child: Text(
                  "دسته بندی",
                  style: TextStyle(
                    fontFamily: 'SB',
                    fontSize: 12,
                    color: ColorsApp.mainGrey,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          left: (index == 0) ? 20 : 10,
                          right: (index == 9) ? 20 : 10,
                        ),
                        child: const CategoryHorizontalItemChip(),
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 12, bottom: 8),
                child: Row(
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset(Assets.imagesIconLeftCategroy),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "مشاهده همه",
                      style: TextStyle(
                        color: ColorsApp.mainBlue,
                        fontFamily: 'SB',
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "پرفروش ترین ها",
                      style: TextStyle(
                        fontFamily: 'SB',
                        fontSize: 12,
                        color: ColorsApp.mainGrey,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 255,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: ProductItem(),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 24, bottom: 8),
                child: Row(
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset(Assets.imagesIconLeftCategroy),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "مشاهده همه",
                      style: TextStyle(
                        color: ColorsApp.mainBlue,
                        fontFamily: 'SB',
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "پرفروش ترین ها",
                      style: TextStyle(
                        fontFamily: 'SB',
                        fontSize: 12,
                        color: ColorsApp.mainGrey,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 255,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: ProductItem(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
