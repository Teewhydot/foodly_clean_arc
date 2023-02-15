import 'package:foodly_clean_arc/foodly/domain/entities/models/restaurants.dart';
import 'package:foodly_clean_arc/generated/assets.dart';

List<Restaurants> getRestaurant() {
  List<Restaurants> restaurants = [
    Restaurants(
      image: Assets.imagesFp,
      name: "The Coffee Bean & Tea Leaf",
      location: "Kampala, Uganda",
      rating: 4.5,
      numberOfRatings: 100,
      id: 1,
      time: "30-40 min",
      deliveryFee: "UGX 2000",
      foodType: ["Coffee", "Tea", "Bakery"],
    ),
    Restaurants(
      image: Assets.imagesFp,
      name: "MacDonald's",
      location: "Kampala, Uganda",
      rating: 4.5,
      numberOfRatings: 100,
      id: 1,
      time: "30-40 min",
      deliveryFee: "UGX 2000",
      foodType: ["Coffee", "Tea", "Bakery"],
    ),
    Restaurants(
      image: Assets.imagesFp,
      name: "Carbon",
      location: "Fut, Nigeria",
      rating: 4.5,
      numberOfRatings: 100,
      id: 1,
      time: "30-40 min",
      deliveryFee: "UGX 2000",
      foodType: ["Coffee", "Tea", "Bakery"],
    ),
  ];
  return restaurants;
}
