import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/bloc/category/category_bloc.dart';
import 'package:flutter_apple_shop/bloc/category/category_event.dart';
import 'package:flutter_apple_shop/constants/constants.dart';
import 'package:flutter_apple_shop/data/model/category_model.dart';
import 'package:flutter_apple_shop/generated/assets.dart';
import 'package:flutter_apple_shop/ui/widgets/cached_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/category/category_state.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(CategoryRequestListEvent());
    super.initState();
  }

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
                            "دسته بندی",
                            style: TextStyle(
                              fontFamily: 'SM',
                              fontSize: 16,
                              color: ColorsApp.mainBlue,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoadingState) {
                  return const SliverToBoxAdapter(child: CircularProgressIndicator());
                }
                if (state is CategoryResponseState) {
                  return state.response.fold(
                    (l) => SliverToBoxAdapter(child: Text(l)),
                    (r) => _listCategory(list: r),
                  );
                }

                return const SliverToBoxAdapter(child: Text("error"));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _listCategory extends StatelessWidget {
  final List<CategoryModel>? list;

  const _listCategory({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 32),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          childCount: list?.length ?? 0,
          (context, index) => CachedImage(imageUrl: list![index].thumbnail!),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
