// ignore_for_file: prefer_typing_uninitialized_variables, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  final image;
  final image2;
  final image3;

  const CarouselSliderWidget(this.image, this.image2, this.image3, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(5.0),
      child: SizedBox(
        height: 250,
        width: 335,

      ),
    );
  }
}

class CustomCarouselWidget extends StatelessWidget {
  final image;
  final image2;
  final image3;

  const CustomCarouselWidget(this.image, this.image2, this.image3, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: MediaQuery.of(context).size.width,

    );
  }
}
