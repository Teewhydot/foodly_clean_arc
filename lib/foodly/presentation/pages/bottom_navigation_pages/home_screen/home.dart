import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_clean_arc/foodly/domain/core/featured_partners_list/featured_partners_list.dart'
    as featured_partners_list;
import 'package:foodly_clean_arc/foodly/domain/core/restaurant_list/restaurant_list.dart'
    as restaurant_list;
import 'package:foodly_clean_arc/foodly/domain/entities/models/featured_partners.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/models/restaurants.dart';
import 'package:foodly_clean_arc/foodly/presentation/manager/location_provider/location_provider.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/bottom_navigation_pages/home_screen/filter/filter.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/all_restaurants_widget.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/best_picks_widget.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/carousel_slider_widget.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/featured_partners_widget.dart';
import 'package:foodly_clean_arc/generated/assets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final locationProviderListen = Provider.of<LocationProvider>(context);
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        title: Column(
          children: [
            Text('DELIVERY TO', style: kGreenText.copyWith(fontSize: 12.sp)),
            addVerticalSpacing(3),
            Text(locationProviderListen.locationName,
                style: kBlackText.copyWith(fontSize: 16.sp)),
          ],
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kBlackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Filter()));
                },
                child: const Center(
                    child: SizedBox(
                        height: 20,
                        child: Text(
                          'Filter',
                          style: kBlackText,
                        )))),
          )
        ],
      ),
      body: HomeBody(
          featuredPartners: featured_partners_list.getFeaturedPartners(),
          restaurants: restaurant_list.getRestaurant()),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
    required this.featuredPartners,
    required this.restaurants,
  }) : super(key: key);

  final List<FeaturedPartner> featuredPartners;
  final List<Restaurants> restaurants;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: ListView(
        key: const PageStorageKey('home'),
        children: [
          addVerticalSpacing(24),
          const CarouselSliderWidget(Assets.onboardingImagesA1,
              Assets.onboardingImagesA2, Assets.onboardingImagesA3),
          addVerticalSpacing(14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Featured partners',
                style: kTitleTextStyle.copyWith(
                  fontSize: 25.sp,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'See all',
                  style: kGreenText,
                ),
              ),
            ],
          ),
          FeaturedPartners(featuredPartners: featuredPartners),
          SizedBox(
            width: 335.w,
            height: 170.h,
            child: Image.asset(Assets.imagesPromo),
          ),
          addVerticalSpacing(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Best picks',
                style: kTitleTextStyle.copyWith(
                  fontSize: 25.sp,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'See all',
                  style: kGreenText,
                ),
              ),
            ],
          ),
          addVerticalSpacing(4),
          Text(
            'Restaurants by teams',
            style: kTitleTextStyle.copyWith(
              fontSize: 25.sp,
            ),
          ),
          addVerticalSpacing(24),
          BestPicks(featuredPartners: featuredPartners),
          addVerticalSpacing(14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'All restaurants',
                style: kTitleTextStyle.copyWith(
                  fontSize: 25.sp,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'See all',
                  style: kGreenText,
                ),
              ),
            ],
          ),
          addVerticalSpacing(20),
          AllRestaurants(restaurants: restaurants),
        ],
      ),
    );
  }
}
