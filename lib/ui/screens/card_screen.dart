import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/bloc/basket/basket_bloc.dart';
import 'package:flutter_apple_shop/bloc/basket/basket_state.dart';
import 'package:flutter_apple_shop/constants/constants.dart';
import 'package:flutter_apple_shop/data/model/basket_model.dart';
import 'package:flutter_apple_shop/generated/assets.dart';
import 'package:flutter_apple_shop/r.dart';
import 'package:flutter_apple_shop/ui/widgets/cached_image.dart';
import 'package:flutter_apple_shop/util/hex_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundScreenColor,
      body: SafeArea(
        child: BlocBuilder<BasketBloc, BasketState>(
          builder: (context, state) {
            return Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                CustomScrollView(
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
                                  child:
                                      Image.asset(Assets.imagesIconAppleBlue),
                                ),
                                const Expanded(
                                  child: Text(
                                    "سبد خرید",
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
                    // todo
                    if (state is BasketDataFetchedState) ...[
                      state.basket.fold((errorMessage) {
                        print('error');
                        return SliverToBoxAdapter(
                          child: Center(
                            child: Text(errorMessage),
                          ),
                        );
                      }, (basketList) {
                        print('add ${basketList.length}');
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            childCount: basketList.length,
                            (context, index) => CardItem(basketList[index]),
                          ),
                        );
                      }
                          // SliverList(
                          //   delegate: SliverChildBuilderDelegate(
                          //     childCount: basketList.length,
                          //     (context, index) => Text(basketList[index].name),
                          //   ),
                          // ),
                          ),
                    ],
                    // SliverToBoxAdapter(
                    //   child: ValueListenableBuilder(
                    //     valueListenable: box.listenable(),
                    //     builder: (context, value, child) {
                    //       return SizedBox(
                    //         height: 600,
                    //         child: ListView.builder(
                    //           itemCount: box.length,
                    //           itemBuilder: (context, index) {
                    //             BasketModel item =
                    //                 box.getAt(index) as BasketModel;
                    //             return Text(item.name);
                    //           },
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    const SliverPadding(padding: EdgeInsets.only(bottom: 100))
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 53,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsApp.mainGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "ادامه فرایند خرید",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'SM',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final BasketModel basket;
  const CardItem(
    this.basket, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 249,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          basket.name,
                          style:
                              const TextStyle(fontFamily: 'SB', fontSize: 16),
                          textDirection: TextDirection.rtl,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 6),
                        //  Text(
                        //   basket.,
                        //   style: TextStyle(fontFamily: 'SM', fontSize: 12),
                        //   overflow: TextOverflow.ellipsis,
                        //   maxLines: 1,
                        // ),
                        const SizedBox(height: 6),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            children: [
                              Text(basket.price.toString()),
                              const SizedBox(width: 3),
                              const Text("تومان"),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 6,
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
                        const SizedBox(height: 6),
                        Wrap(
                          spacing: 5,
                          runSpacing: 5,
                          children: const [
                            OptionCheap(
                              '۲۵۶ گیگابیت',
                            ),
                            OptionCheap(
                              'رنگ ابی',
                              color: '456798',
                            ),
                            OptionCheap(
                              'حذف',
                              icon: AssetImages.iconTrash,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    width: 100, 
                    child:CachedImage(
                        imageUrl: basket.thumbnail.toString()    
                      ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DottedLine(
              lineThickness: 2.0,
              dashLength: 8,
              dashColor: ColorsApp.mainGrey.withOpacity(0.5),
              dashGapLength: 3,
              dashGapColor: Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("تومان"),
                const SizedBox(width: 5),
                Text(basket.realPrice.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OptionCheap extends StatelessWidget {
  final String? color;
  final String? icon;
  final String title;
  const OptionCheap(this.title, {Key? key, this.color, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsApp.mainGrey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (color != null) ...{
              Container(
                width: 6,
                height: 6,
                margin: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: hexColor(color!),
                ),
              ),
            },
            Text(
              title,
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontFamily: 'SM', fontSize: 12),
            ),
            if (icon != null) ...{
              const SizedBox(width: 4),
              Image.asset(AssetImages.iconTrash),
            },
          ],
        ),
      ),
    );
  }
}
