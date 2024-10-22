import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/reusable_button.dart';

class AddSocialMedia extends StatelessWidget {
  const AddSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        title: const Text(
          'Add social media',
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
      backgroundColor: kWhiteColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            addVerticalSpacing(50),
            const Text(
              'Add social accounts',
              style: kBoldTextStyle,
            ),
            addVerticalSpacing(30),
            Text(
              'Add your social accounts for more security. You will go directly to their site.',
              style: kDescTextStyle,
            ),
            addVerticalSpacing(20),
            Column(
              children: [
                ReusableButton(
                    buttonText: Row(children: [
                      const Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.white,
                      ),
                      addHorizontalSpacing(30),
                      const Center(child: Text('CONNECT WITH FACEBOOK'))
                    ]),
                    buttonColor: kDeepBlueColor,
                    onTapped: () {}),
                addVerticalSpacing(20),
                ReusableButton(
                    buttonText: Row(children: [
                      const Icon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                      ),
                      addHorizontalSpacing(30),
                      const Center(child: Text('CONNECT WITH GOOGLE'))
                    ]),
                    buttonColor: kBlueColor,
                    onTapped: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
