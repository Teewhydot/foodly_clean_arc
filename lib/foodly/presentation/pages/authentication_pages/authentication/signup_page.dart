// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_clean_arc/foodly/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/authentication_pages/authentication/forgot_pasword_page.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/authentication_pages/authentication/login_page.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/loading_state_widget.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/reusable_button.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/validators.dart';

class SignUpCubitWrapper extends StatelessWidget {
  const SignUpCubitWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: const SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<SignUpCubit>(context);
    return BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
      if (state is SignUpInitial) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: kWhiteColor,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: kWhiteColor,
            title: const Text(
              'Sign Up',
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
            child: ListView(
              children: [
                addVerticalSpacing(24),
                const Text(
                  'Create account',
                  style: kTitleTextStyle,
                ),
                addVerticalSpacing(20),
                RichText(
                    text: TextSpan(
                  text: 'Enter your Name, Email and Password to sign up.',
                  style: kDescTextStyle,
                  children: [
                    TextSpan(
                      text: ' Already have an account?',
                      style: kDescTextStyle,
                      children: [
                        TextSpan(
                          text: ' Sign In',
                          style: kDescTextStyle.copyWith(
                            color: kGreenColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const LoginPage();
                              }));
                            },
                        ),
                      ],
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: fullNameController,
                          validator: nameValidator,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.name,
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
                            hintText: 'Full Name',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5.0.h, horizontal: 20.0.w),
                          ),
                        ),
                      ),
                      addVerticalSpacing(14),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r))),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: emailController,
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
                      addVerticalSpacing(14),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r))),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: passwordController,
                          validator: passwordValidator,
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
                            hintText: 'Password',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5.0.h, horizontal: 20.0.w),
                          ),
                        ),
                      ),
                      addVerticalSpacing(20),
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
                          buttonText: const Text("Sign up"),
                          buttonColor: kGreenColor,
                          onTapped: () {
                            blocProvider.signUp();
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
                              buttonText: const Text("Connect with facebook"),
                              buttonColor: kGreenColor,
                              onTapped: () {}),
                          addVerticalSpacing(20),
                          ReusableButton(
                              buttonText: const Text("Connect with google"),
                              buttonColor: kGreenColor,
                              onTapped: () {}),
                          addVerticalSpacing(50),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (state is SignUpLoading) {
        return const Scaffold(
          body: LoadingState(),
        );
      } else if (state is SignUpSuccess) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text('Register Success'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Login'))
            ],
          ),
        );
      } else if (state is SignUpFailure) {
        return SignUpFailureScreen(message: state.message);
      } else {
        return const Scaffold(
          body: Center(
            child: Text('Something went wrong'),
          ),
        );
      }
    });
  }
}
