import 'package:flutter/material.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/cards_screens/card_type_page.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/reusable_button.dart';
import 'package:foodly_clean_arc/generated/assets.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        title: const Text(
          'Payment methods',
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            addVerticalSpacing(150),
            Expanded(
                child: Center(
                    child: Image.asset(Assets.imagesEmptycardslistimage))),
            Expanded(
                child: Center(child: Image.asset(Assets.imagesEmptycardtext))),
            addVerticalSpacing(30),
            LocationButton(const Text('Add credit/debit cards'), () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CardTypePage();
              }));
            }, kWhiteColor),
            Expanded(
                child: Container(
              height: 100,
            ))
          ],
        ),
      ),
    );
  }
}
