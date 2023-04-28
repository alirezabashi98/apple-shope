import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/bloc/categoryProduct/category_product_bloc.dart';
import 'package:flutter_apple_shop/bloc/categoryProduct/category_product_event.dart';
import 'package:flutter_apple_shop/bloc/categoryProduct/category_product_state.dart';
import 'package:flutter_apple_shop/constants/constants.dart';
import 'package:flutter_apple_shop/data/model/category_model.dart';
import 'package:flutter_apple_shop/generated/assets.dart';
import 'package:flutter_apple_shop/ui/widgets/product_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductListScreen extends StatefulWidget {
  final CategoryModel category;

  const ProductListScreen({Key? key, required this.category}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryProductBloc>(context).add(CategoryInitEvent(widget.category.id!));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryProductBloc, CategoryProductState>(
      builder: (context, state) => Scaffold(
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
                          Expanded(
                            child: Text(
                              widget.category.title ?? 'محصولات',
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
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (state is CategoryProductLoadingState) ...[
                const SliverToBoxAdapter(child: Padding(
                  padding: EdgeInsets.only(top: 55),
                  child: Center(child: CircularProgressIndicator()),
                ))
              ],
              if (state is CategoryProductResponsesState) ...[
                state.productListByCategory.fold(
                  (errorMessage) => SliverToBoxAdapter(child: Text(errorMessage),),
                  (producteList) => SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        childCount: producteList.length,
                        (context, index) => ProductItem(
                          product: producteList[index],
                        ),
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 2 / 2.6,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
