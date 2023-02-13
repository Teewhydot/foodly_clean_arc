// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/authentication_pages/authentication/forgot_pasword_page.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/authentication_pages/authentication/signup_page.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/reusable_button.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/validators.dart';

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
              text: 'Enter your Phone number or Email for sign in, Or ',
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
                        borderRadius: BorderRadius.all(Radius.circular(20.r))),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        borderRadius: BorderRadius.all(Radius.circular(20.r))),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      onTapped: () {}),
                  addVerticalSpacing(20),
                  Text(
                    'Or',
                    style: kDescTextStyle,
                  ),
                  addVerticalSpacing(20),
                  Column(
                    children: [
                      ReusableButton(
                          buttonText: const Text("Sign in with facebook"),
                          buttonColor: kDeepBlueColor,
                          onTapped: () {}),
                      addVerticalSpacing(20),
                      ReusableButton(
                          buttonText: const Text("Sign in with google"),
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
  }
}