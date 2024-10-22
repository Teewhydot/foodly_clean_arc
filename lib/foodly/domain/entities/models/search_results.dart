import 'package:flutter/material.dart';

class SearchResultModel {
  final String image;
  final String name;

  final double height;

  SearchResultModel(
      {required this.image, required this.name, required this.height});
}

class SearchResultWidget extends StatelessWidget {
  final String image;
  final String name;
  final double height;

  const SearchResultWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.height});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 2;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      image,
                    ),
                    fit: BoxFit.fill)),
            height: height,
            width: width,
          ),
        ),
        Text(name),
      ],
    );
  }
}
