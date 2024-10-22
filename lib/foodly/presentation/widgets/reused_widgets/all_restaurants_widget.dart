import 'package:flutter/material.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/models/restaurants.dart';

class AllRestaurants extends StatelessWidget {
  const AllRestaurants({
    super.key,
    required this.restaurants,
  });

  final List<Restaurants> restaurants;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return RestaurantsWidget(
            width: 290,
            height: 185,
            image: restaurants[index].image,
            name: restaurants[index].name,
            location: restaurants[index].location,
            rating: restaurants[index].rating,
            numberOfRatings: restaurants[index].numberOfRatings,
            time: restaurants[index].time,
            deliveryFee: restaurants[index].deliveryFee,
            foodType: restaurants[index].foodType,
            id: 1,
          );
        },
        itemCount: restaurants.length,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
      ),
    );
  }
}
