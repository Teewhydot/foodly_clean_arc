import 'package:flutter/material.dart';
import 'package:foodly_clean_arc/foodly/domain/preload_images.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/authentication_pages/authentication/login_page.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/pages_model.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/reusable_button.dart';
import 'package:foodly_clean_arc/generated/assets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController pageController = PageController();
  final LoadImages loadImages = LoadImages();

  @override
  void initState() {
    super.initState();
    loadImages.loadImages();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadImages.precacheImages(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    allowImplicitScrolling: true,
                    physics: const BouncingScrollPhysics(),
                    pageSnapping: true,
                    key: UniqueKey(),
                    controller: pageController,
                    children: const [
                      PageModel(
                          imageAsset: Assets.onboardingImagesA3,
                          heading: "All your favourites",
                          description:
                              "Order from the best local restaurants with easy, on-demand delivery."),
                      PageModel(
                          imageAsset: Assets.onboardingImagesA1,
                          heading: "Free delivery offers",
                          description:
                              "Free delivery for new customers via Apple Pay and others payment methods."),
                      PageModel(
                          imageAsset: Assets.onboardingImagesA2,
                          heading: "Choose your food",
                          description:
                              "Easily find your type of food craving and you’ll get delivery in wide range."),
                    ],
                  ),
                ),
                Expanded(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: const WormEffect(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ReusableButton(
                    buttonText: const Text('Get Started'),
                    buttonColor: kGreenColor,
                    onTapped: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const LoginWrapper();
                      }));
                    }),
                addVerticalSpacing(90),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
