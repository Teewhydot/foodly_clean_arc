// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodly_clean_arc/foodly/presentation/manager/provider/location_provider/location_provider.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/welcome_screens/mainscreen.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/loading_state_widget.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/reusable_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final TextEditingController addressController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        kSuccessLoginSnackBar,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    final locationProviderListen = Provider.of<LocationProvider>(context);
    return ModalProgressHUD(
      inAsyncCall: locationProviderListen.spinner,
      progressIndicator: const LoadingState(),
      child: Scaffold(
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
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                await locationProvider.determinePosition();
                await locationProvider.getLocationName(context);
              }, kWhiteColor),
              addVerticalSpacing(50),
              Text(
                  'Note: If your current location does not have a designated latitude and longitude values, the loading screen will not stop, In that case enter your address manually below.',
                  style: kDescTextStyle),
              addVerticalSpacing(20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
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
                          color: kGreenColor,
                          width: 3,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: kGreenColor.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Enter address manually',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 20.0),
                  ),
                ),
              ),
              addVerticalSpacing(20),
              LocationButton(
                  const Text(
                    'Set Location',
                    style: whiteText,
                  ), () async {
                locationProvider.setLocation(addressController.text);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const MainScreen();
                }));
              }, kGreenColor),
            ],
          ),
        ),
      ),
    );
  }
}
