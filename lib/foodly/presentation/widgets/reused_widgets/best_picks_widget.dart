import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/models/featured_partners.dart';

class BestPicks extends StatelessWidget {
  const BestPicks({
    Key? key,
    required this.featuredPartners,
  }) : super(key: key);

  final List<FeaturedPartner> featuredPartners;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      child: ListView.builder(
        key: const PageStorageKey('best-picks'),
        itemCount: featuredPartners.length,
        itemBuilder: (context, index) {
          return FeaturedPartnerWidget(
            width: 240.0,
            height: 160.0,
            image: featuredPartners[index].image,
            name: featuredPartners[index].name,
            location: featuredPartners[index].location,
            rating: featuredPartners[index].rating,
            time: featuredPartners[index].time,
            deliveryFee: 'Free Delivery',
          );
        },
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        // children: featuredPartners,
      ),
    );
  }
}
