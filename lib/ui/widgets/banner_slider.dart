import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/constants/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../data/model/banner_model.dart';
import 'cached_image.dart';

class BannerSlider extends StatelessWidget {
  final List<BannerModel> bannerList;

  const BannerSlider({super.key, required this.bannerList});

  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: 0.9);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: controller,
            itemCount: bannerList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: CachedImage(
                  imageUrl: bannerList[index].thumbnail!,
                  radius: 15,
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            effect: const ExpandingDotsEffect(
              expansionFactor: 4,
              dotHeight: 6,
              dotWidth: 5,
              dotColor: Colors.white,
              activeDotColor: ColorsApp.blueIndicator,
            ),
            controller: controller,
            count: 3,
          ),
        ),
      ],
    );
  }
}
