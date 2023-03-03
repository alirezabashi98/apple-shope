import 'package:flutter/material.dart';
import 'package:flutter_apple_shop/ui/widgets/cached_image.dart';

import '../../data/model/category_model.dart';
import '../../util/hex_color.dart';

class CategoryHorizontalItemChip extends StatelessWidget {
  final CategoryModel category;

  const CategoryHorizontalItemChip({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: ShapeDecoration(
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            color: hexColor(category.color!),
            shadows: [
              BoxShadow(
                color: hexColor(category.color!),
                blurRadius: 21,
                spreadRadius: -9,
                offset: const Offset(0.0, 10),
              ),
            ],
          ),
          child: Center(
            child: SizedBox(
              width: 25,
              height: 25,
              child: Center(
                child: CachedImage(imageUrl: category.icon!),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          category.title ?? "ok",
          style: const TextStyle(
            fontFamily: 'SB',
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
