import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double radius;

  const CachedImage({Key? key, required this.imageUrl,this.radius = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        errorWidget: (context, url, error) => Container(
          color: Colors.red[100],
        ),
        placeholder: (context, url) => Container(
          color: Colors.grey,
        ),
      ),
    );
  }
}
