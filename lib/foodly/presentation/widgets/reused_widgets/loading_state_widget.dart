import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_clean_arc/foodly/domain/failures/map_failure.dart';
import 'package:foodly_clean_arc/foodly/presentation/manager/sign_up_bloc/sign_up_bloc.dart';

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

class SignUpFailureScreen extends StatefulWidget {
  final String message;
  const SignUpFailureScreen({Key? key, required this.message})
      : super(key: key);

  @override
  State<SignUpFailureScreen> createState() => _SignUpFailureScreenState();
}

class _SignUpFailureScreenState extends State<SignUpFailureScreen> {
  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<SignUpcBloc>(context, listen: false);
    blocProvider.add(SignUpFailedEvent());
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
              Text(getSignUpDisplayErrorMessage(widget.message),
                  style: kBoldTextStyle.copyWith(
                    fontSize: 20.sp,
                    color: Colors.redAccent,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
