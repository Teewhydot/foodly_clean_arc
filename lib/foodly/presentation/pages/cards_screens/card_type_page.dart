import 'package:flutter/material.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/cards_screens/add_card_details.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/custom_listtile.dart';
import 'package:foodly_clean_arc/generated/assets.dart';

class CardTypePage extends StatelessWidget {
  const CardTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        title: const Text(
          'Choose Card Type',
          style: kTitleTextStyle,
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
      ),
      body: Column(
        children: [
          addVerticalSpacing(20),
          CustomListTile(
              leading: Image.asset(Assets.imagesPaypal),
              heading: const Text('Paypal'),
              subHeading: const Text('Default Payment Option'),
              onTap: () {}),
          CustomListTile(
              leading: Image.asset(Assets.imagesMastercard),
              heading: const Text('MasterCard'),
              subHeading: const Text('Not Default Payment Option'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AddCardDetails();
                }));
              }),
          CustomListTile(
              leading: Image.asset(Assets.imagesVisa),
              heading: const Text('Visa'),
              subHeading: const Text('Not Default Payment Option'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AddCardDetails();
                }));
              }),
        ],
      ),
    );
  }
}
