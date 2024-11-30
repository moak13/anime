import 'package:flutter/material.dart';

class AnimeNoCoverImage extends StatelessWidget {
  final double height;
  const AnimeNoCoverImage({
    super.key,
    this.height = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height / 2,
      width: double.infinity,
      child: const Center(
        child: Icon(
          Icons.broken_image_rounded,
          size: 100,
        ),
      ),
    );
  }
}
