import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/welcome_screens/mainscreen.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/reusable_button.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhiteColor,
        centerTitle: true,
        title: const Text(
          'Set Location',
          style: kBlackText,
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
        padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
        child: ListView(
          children: [
            addVerticalSpacing(24),
            const Text(
              'Find restaurants near you',
              style: kTitleTextStyle,
            ),
            addVerticalSpacing(20),
            Text(
              'Please enter your location or allow access to your location to find restaurants near you.',
              style: kDescTextStyle,
            ),
            addVerticalSpacing(34),
            LocationButton(
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      FontAwesomeIcons.locationArrow,
                      color: kGreenColor,
                    ),
                    addHorizontalSpacing(10),
                    const Text(
                      'Use current location',
                      style: kGreenText,
                    ),
                  ],
                ), () async {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const MainScreen();
              }));
            }, kWhiteColor),
            addVerticalSpacing(50),
            Text(
                'Note: If your current location does not have a designated latitude and longitude values, the loading screen will not stop, In that case enter your address manually below.',
                style: kDescTextStyle),
            addVerticalSpacing(20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.r))),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: addressController,
                cursorColor: Colors.black,
                keyboardType: TextInputType.streetAddress,
                onChanged: (newValue) {},
                decoration: InputDecoration(
                  filled: true,
                  fillColor: textFieldFillColor,
                  focusColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: kGreenColor, width: 3, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                        color: kGreenColor.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  hintText: 'Enter address manually',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 20.0.w),
                ),
              ),
            ),
            addVerticalSpacing(20),
            LocationButton(
                const Text(
                  'Set Location',
                  style: whiteText,
                ),
                () async {},
                kGreenColor),
          ],
        ),
      ),
    );
  }
}
