import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Loading',
                style: kDescTextStyle.copyWith(
                  color: kGreenColor,
                ),
              ),
              addHorizontalSpacing(10),
              SizedBox(height: 20.0.h, width: 20.0.w, child: loadingIndicator),
              addHorizontalSpacing(10),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpFailureScreen extends StatelessWidget {
  final String message;
  const SignUpFailureScreen({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // warning icon
            Icon(
              Icons.warning,
              color: Colors.redAccent,
              size: 70.r,
            ),
            Text(
              'Registration Failed due to the below reason',
              style: kDescTextStyle,
            ),
            addVerticalSpacing(20),
            Text(message,
                style: kBoldTextStyle.copyWith(
                  fontSize: 20.sp,
                  color: Colors.redAccent,
                )),
          ],
        ),
      ),
    );
  }
}
