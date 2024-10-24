import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_clean_arc/foodly/domain/failures/map_failure.dart';
import 'package:foodly_clean_arc/foodly/presentation/manager/login_bloc/login_bloc.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';

class LoginFailureScreen extends StatefulWidget {
  final String message;
  const LoginFailureScreen({super.key, required this.message});

  @override
  State<LoginFailureScreen> createState() => _LoginFailureScreenState();
}

class _LoginFailureScreenState extends State<LoginFailureScreen> {
  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<LoginBloc>(context, listen: false);
    blocProvider.add(LoginFailedEvent());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // warning icon
            Column(
              children: [
                const Icon(
                  Icons.warning,
                  color: Colors.redAccent,
                  size: 70,
                ),
                Text('Login Failed due to the below reason',
                  style: kDescTextStyle,
                ),
                addVerticalSpacing(20),
                Text(getLoginDisplayErrorMessage(widget.message),
                    style: kBoldTextStyle.copyWith(
                      fontSize: 17,
                      color: Colors.redAccent,
                    )),
                addVerticalSpacing(60),
                const CircularCountDownTimer(
                    width: 30,
                    height: 30,
                    isReverse: true,
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                    duration: 4,
                    fillColor: kGreenColor,
                    ringColor: Colors.transparent),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
