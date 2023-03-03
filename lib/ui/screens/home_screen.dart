import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/bloc/home/home_bloc.dart';
import 'package:flutter_apple_shop/bloc/home/home_event.dart';
import 'package:flutter_apple_shop/bloc/home/home_state.dart';
import 'package:flutter_apple_shop/constants/constants.dart';
import 'package:flutter_apple_shop/data/model/banner_model.dart';
import 'package:flutter_apple_shop/data/model/category_model.dart';
import 'package:flutter_apple_shop/data/model/product_model.dart';
import 'package:flutter_apple_shop/generated/assets.dart';
import 'package:flutter_apple_shop/ui/widgets/banner_slider.dart';
import 'package:flutter_apple_shop/ui/widgets/product_item.dart';
import 'package:flutter_apple_shop/ui/widgets/category_horizontal_item_chip.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(HomeInitDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundScreenColor,
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                if (state is HomeLoadingState) ...[
                  SliverToBoxAdapter(
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 150,
                        ),
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
                ],
                if (state is HomeResponseState) ...[
                  _getSearchBox(),
                  state.bannerList.fold(
                    (l) => SliverToBoxAdapter(
                      child: Text(l),
                    ),
                    (r) => _getBanners(
                      bannerList: r,
                    ),
                  ),
                  _getCategoryListTitle(),
                  state.categoryList.fold(
                    (l) => SliverToBoxAdapter(
                      child: Text(l),
                    ),
                    (r) => _getCategoryList(categoryList: r),
                  ),
                  _getBastSellerTitle(),
                  state.bastSellerProductList.fold(
                          (errorMessage) => SliverToBoxAdapter(
                        child: Text(errorMessage),
                      ),
                          (productList) => _getBastSellerProducts(listProduct: productList)
                  ),
                  _getMostViewedTitle(),
                  state.hottestProductList.fold(
                          (errorMessage) => SliverToBoxAdapter(
                        child: Text(errorMessage),
                      ),
                          (productList) => _getMostViewedProducts(product: productList,)
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }

  _getSearchBox() {
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
                  child: Image.asset(Assets.imagesIconSearch),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    "جستجو محصولات",
                    style: TextStyle(
                      fontFamily: 'SM',
                      fontSize: 16,
                      color: ColorsApp.mainGrey,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(Assets.imagesIconAppleBlue),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getCategoryListTitle() {
    return const SliverToBoxAdapter(
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
    );
  }

  _getBastSellerTitle() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 8),
        child: Row(
          children: [
            const Text(
              "پرفروش ترین ها",
              style: TextStyle(
                fontFamily: 'SB',
                fontSize: 12,
                color: ColorsApp.mainGrey,
              ),
            ),
            const Spacer(),
            const Text(
              "مشاهده همه",
              style: TextStyle(
                color: ColorsApp.mainBlue,
                fontFamily: 'SB',
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 20,
              width: 20,
              child: Image.asset(Assets.imagesIconLeftCategroy),
            ),
          ],
        ),
      ),
    );
  }

  _getMostViewedTitle() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 8),
        child: Row(
          children: [
            const Text(
              "پربازدید ترین ها",
              style: TextStyle(
                fontFamily: 'SB',
                fontSize: 12,
                color: ColorsApp.mainGrey,
              ),
            ),
            const Spacer(),
            const Text(
              "مشاهده همه",
              style: TextStyle(
                color: ColorsApp.mainBlue,
                fontFamily: 'SB',
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 20,
              width: 20,
              child: Image.asset(Assets.imagesIconLeftCategroy),
            ),
          ],
        ),
      ),
    );
  }
}

class _getMostViewedProducts extends StatelessWidget {
  final List<ProductModel> product;
  const _getMostViewedProducts({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 255,
        child: ListView.builder(
          itemCount: product.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: ProductItem(product: product[index],),
            );
          },
        ),
      ),
    );
  }
}


class _getBanners extends StatelessWidget {
  final List<BannerModel> bannerList;

  const _getBanners({Key? key, required this.bannerList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BannerSlider(
        bannerList: bannerList,
      ),
    );
  }
}

class _getCategoryList extends StatelessWidget {
  final List<CategoryModel> categoryList;

  const _getCategoryList({Key? key, required this.categoryList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                  left: (index == 0) ? 20 : 10,
                  right: (index == 9) ? 20 : 10,
                ),
                child:
                    CategoryHorizontalItemChip(category: categoryList[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _getBastSellerProducts extends StatelessWidget {
  final List<ProductModel> listProduct;
  const _getBastSellerProducts({Key? key,required this.listProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 255,
        child: ListView.builder(
          itemCount: listProduct.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: ProductItem(product: listProduct[index],),
            );
          },
        ),
      ),
    );
  }
}
