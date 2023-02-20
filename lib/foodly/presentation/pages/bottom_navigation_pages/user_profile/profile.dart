import 'package:flutter/material.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/authentication_pages/authentication/login_page.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/bottom_navigation_pages/user_profile/add_social_media_screen.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/cards_screens/cards_page.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/custom_listtile.dart';
import 'package:foodly_clean_arc/generated/assets.dart';

import 'change_password.dart';
import 'profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            addVerticalSpacing(30),
            const Text(
              'Account settings',
              style: kBoldTextStyle,
            ),
            addVerticalSpacing(20),
            Text(
              'Update your settings like notifications, payments, profile edit etc.',
              style: kDescTextStyle,
            ),
            addVerticalSpacing(10),
            CustomListTile(
                leading: const Icon(Icons.person),
                heading: const Text('Profile information'),
                subHeading: const Text('Change your account information'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ProfileInfoPage();
                  }));
                }),
            CustomListTile(
                leading: const Icon(Icons.lock),
                heading: const Text('Change password'),
                subHeading: const Text('Change your account password'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ChangePasswordPage();
                  }));
                }),
            CustomListTile(
                leading: const Icon(Icons.credit_card),
                heading: const Text('Payment methods'),
                subHeading: const Text('Add your credit or debit cards'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CardsPage();
                  }));
                }),
            CustomListTile(
                leading: const Icon(Icons.location_on),
                heading: const Text('Locations'),
                subHeading: const Text('Add or remove delivery locations'),
                onTap: () {}),
            CustomListTile(
                leading: const Icon(Icons.facebook),
                heading: const Text('Add social media accounts'),
                subHeading:
                    const Text('Connect your facebook, twitter , github etc'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AddSocialMedia();
                  }));
                }),
            addVerticalSpacing(30),
            const Text('Notifications'),
            addVerticalSpacing(20),
            CustomListTileWithSwitch(
                heading: const Text('Push Notifications'),
                subHeading: const Text('For daily updates'),
                onTap: () {}),
            CustomListTileWithSwitch(
                heading: const Text('SMS Notifications'),
                subHeading: const Text('For daily updates'),
                onTap: () {}),
            CustomListTileWithSwitch(
                heading: const Text('Promotional Notifications'),
                subHeading: const Text('For daily updates'),
                onTap: () {}),
            addVerticalSpacing(30),
            const Text('More'),
            addVerticalSpacing(20),
            CustomListTile(
                leading: const Icon(Icons.star),
                heading: const Text('Rate us'),
                subHeading: const Text('Rate our app on Playstore or appstore'),
                onTap: () {}),
            CustomListTile(
                leading: Image.asset(
                  Assets.imagesFaq,
                  height: 24,
                  width: 24,
                ),
                heading: const Text('FAQ'),
                subHeading: const Text('Frequently asked questions'),
                onTap: () {}),
            CustomListTile(
                leading: const Icon(Icons.logout),
                heading: const Text('Log Out'),
                subHeading: const Text(''),
                onTap: () async {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const LoginWrapper();
                  }));
                }),
          ],
        ),
      ),
    );
  }
}
