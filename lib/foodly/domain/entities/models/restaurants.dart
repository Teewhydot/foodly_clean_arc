// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/models/restaurants_details_model.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';

class Restaurants {
  Restaurants({
    required this.id,
    required this.name,
    required this.foodType,
    required this.location,
    required this.rating,
    required this.numberOfRatings,
    required this.time,
    required this.deliveryFee,
    required this.image,
  });

  int id;
  String name;
  String location;
  double rating;
  int numberOfRatings;
  String time;
  List<String> foodType;
  String deliveryFee;
  String image;
}

class RestaurantsWidget extends StatelessWidget {
  int id;
  String name;
  String location;
  double rating;
  int numberOfRatings;
  String time;
  List<String> foodType;
  String deliveryFee;
  String image;
  double width;
  double height;

  RestaurantsWidget({
    super.key,
    required this.width,
    required this.height,
    required this.id,
    required this.name,
    required this.foodType,
    required this.location,
    required this.rating,
    required this.numberOfRatings,
    required this.time,
    required this.deliveryFee,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RestaurantDetails(
                        restaurantDeliveryFee: deliveryFee,
                        restaurantImage: image,
                        restaurantName: name,
                        restaurantRating: rating,
                        restaurantTime: time,
                        restaurantLocation: location);
                  },
                ),
              );
            },
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
          addVerticalSpacing(16),
          Text(name, style: kTitleTextStyle),
          addVerticalSpacing(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < foodType.length; i++)
                Text("${foodType[i]}, ", style: kDescTextStyle),
            ],
          ),
          addVerticalSpacing(9),
          Row(
            children: [
              Container(
                width: 36,
                height: 20,
                decoration: BoxDecoration(
                  color: kGreenColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    rating.toString(),
                    style: kDescTextStyle.copyWith(
                        color: kWhiteColor, fontSize: 12),
                  ),
                ),
              ),
              addHorizontalSpacing(8),
              Text(
                time,
                style: kDescTextStyle,
              ),
              addHorizontalSpacing(8),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: kGreenColor,
                  ),
                  Text(
                    "${numberOfRatings.toString()}+ ratings",
                    style: kDescTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
