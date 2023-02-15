import 'package:foodly_clean_arc/foodly/domain/entities/models/featured_partners.dart';
import 'package:foodly_clean_arc/generated/assets.dart';

List<FeaturedPartner> getFeaturedPartners() {
  List<FeaturedPartner> featuredPartners = [
    FeaturedPartner(
      image: Assets.searchImagesFilter2,
      name: "KFF",
      location: "Kampala, Uganda",
      rating: 3.5,
      time: "30-40 min",
    ),
    FeaturedPartner(
      image: Assets.imagesFp,
      name: "The Coffee Bean & Tea Leaf",
      location: "Kampala, Uganda",
      rating: 3.5,
      time: "30-40 min",
    ),
    FeaturedPartner(
      image: Assets.searchImagesFilter2,
      name: "The Coffee Bean & Tea Leaf",
      location: "Kampala, Uganda",
      rating: 3.5,
      time: "30-40 min",
    ),
    FeaturedPartner(
      image: Assets.searchImagesFilter3,
      name: "The Coffee Bean & Tea Leaf",
      location: "Kampala, Uganda",
      rating: 3.5,
      time: "30-40 min",
    ),
  ];
  return featuredPartners;
}
