import 'package:flutter/material.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/models/restaurants_details_model.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';

class FeaturedPartner {
  final String image;
  final String name;
  final String location;
  final double rating;
  final String time;

  FeaturedPartner({
    required this.image,
    required this.name,
    required this.location,
    required this.rating,
    required this.time,
  });
}

class FeaturedPartnerWidget extends StatelessWidget {
  final String image;
  final String name;
  final String location;
  final double rating;
  final String time;
  final String deliveryFee;
  final double width;
  final double height;

  const FeaturedPartnerWidget({
    super.key,
    required this.width,
    required this.height,
    required this.image,
    required this.name,
    required this.location,
    required this.rating,
    required this.time,
    required this.deliveryFee,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RestaurantDetails(
                        restaurantDeliveryFee: deliveryFee,
                        restaurantImage: image,
                        restaurantName: name,
                        restaurantLocation: location,
                        restaurantTime: time,
                        restaurantRating: rating,
                      );
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
          ),
          Expanded(
            child: Column(
              children: [
                addVerticalSpacing(14),
                Text(name, style: kTitleTextStyle),
                addVerticalSpacing(3),
                Text(location, style: kDescTextStyle),
                addVerticalSpacing(13),
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
                    addHorizontalSpacing(12),
                    Text(time, style: kDescTextStyle.copyWith(fontSize: 14)),
                    addHorizontalSpacing(8),
                    const CircleAvatar(
                      radius: 3,
                      backgroundColor: kGreenColor,
                    ),
                    addHorizontalSpacing(8),
                    Text(
                      deliveryFee,
                      style: kDescTextStyle.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
