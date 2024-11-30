import 'package:anime/utils/string_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'anime_no_cover_image.dart';

class AnimeCoverImage extends StatelessWidget {
  final String? image;
  final double height;
  const AnimeCoverImage({
    super.key,
    this.image,
    this.height = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    if (StringUtil.isEmpty(image)) {
      return AnimeNoCoverImage(
        height: height,
      );
    }
    return CachedNetworkImage(
      imageUrl: image!,
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height / 2,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      progressIndicatorBuilder: (context, url, progress) {
        return SizedBox(
          height: height / 2,
          width: double.infinity,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade300,
            child: Container(
              color: Colors.grey,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return AnimeNoCoverImage(
          height: height,
        );
      },
    );
  }
}
