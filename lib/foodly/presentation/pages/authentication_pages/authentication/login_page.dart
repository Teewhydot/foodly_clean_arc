// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_clean_arc/foodly/presentation/manager/login_bloc/login_bloc.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/authentication_pages/authentication/forgot_pasword_page.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/authentication_pages/authentication/signup_page.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/location_screens/location_screen.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/reusable_button.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/validators.dart';

class LoginWrapper extends StatelessWidget {
  const LoginWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<LoginBloc>(context, listen: false);
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginInitial) {
              return Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: kWhiteColor,
                appBar: AppBar(
                  centerTitle: true,
                  elevation: 0,
                  backgroundColor: kWhiteColor,
                  title: const Text(
                    'Sign In',
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
                  padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      addVerticalSpacing(24),
                      const Text(
                        'Welcome Back',
                        style: kTitleTextStyle,
                      ),
                      addVerticalSpacing(20),
                      RichText(
                          text: TextSpan(
                        text:
                            'Enter your Phone number or Email for sign in, Or ',
                        style: kDescTextStyle,
                        children: [
                          TextSpan(
                            text: ' Create account',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const SignUpPage();
                                }));
                              },
                            style: kTitleTextStyle.copyWith(
                              color: kGreenColor,
                            ),
                          ),
                        ],
                      )),
                      addVerticalSpacing(34),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.r))),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _emailController,
                                validator: emailValidator,
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.emailAddress,
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
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.all(8.0.r),
                                    child: GestureDetector(
                                        onTap: () async {},
                                        child: const Icon(Icons.email)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: kGreenColor.withOpacity(0.5)),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  hintText: 'Email',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5.0.h, horizontal: 20.0.w),
                                ),
                              ),
                            ),
                            addVerticalSpacing(24),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.r))),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _passwordController,
                                validator: passwordValidator,
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.visiblePassword,
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
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.all(8.0.r),
                                    child: GestureDetector(
                                        onTap: () async {},
                                        child: const Icon(Icons.lock)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: kGreenColor.withOpacity(0.5)),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  hintText: 'Password',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0.h, horizontal: 20.0.w),
                                ),
                              ),
                            ),
                            addVerticalSpacing(24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const ForgotPasswordPage();
                                    }));
                                  },
                                  child: Text(
                                    'Forgot Password?',
                                    style: kDescTextStyle.copyWith(
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ReusableButton(
                                buttonText: const Text("Sign in"),
                                buttonColor: kGreenColor,
                                onTapped: () {
                                  blocProvider.add(LoginRequestedEvent(
                                      email: _emailController.text,
                                      password: _passwordController.text));
                                }),
                            addVerticalSpacing(20),
                            Text(
                              'Or',
                              style: kDescTextStyle,
                            ),
                            addVerticalSpacing(20),
                            Column(
                              children: [
                                ReusableButton(
                                    buttonText:
                                        const Text("Sign in with facebook"),
                                    buttonColor: kDeepBlueColor,
                                    onTapped: () {}),
                                addVerticalSpacing(20),
                                ReusableButton(
                                    buttonText:
                                        const Text("Sign in with google"),
                                    buttonColor: kBlueColor,
                                    onTapped: () {}),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is LoginLoading) {
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
                  SizedBox(
                      height: 20.0.h, width: 20.0.w, child: loadingIndicator),
                  addHorizontalSpacing(10),
                ],
              )))); //loading indicator
            } else if (state is LoginSuccess) {
              return const LocationScreen();
            } else if (state is LoginFailure) {
              return LoginFailureScreen(
                message: state.message,
              );
            } else {
              return const Center(child: Text('Something went wrong'));
            }
          },
        );
      },
    );
  }
}

//create login failure screen
class LoginFailureScreen extends StatelessWidget {
  final String message;
  const LoginFailureScreen({Key? key, required this.message}) : super(key: key);

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
              'Login Failed due to the below reason',
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
