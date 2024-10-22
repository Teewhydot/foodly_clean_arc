// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_clean_arc/foodly/presentation/manager/sign_up_bloc/sign_up_bloc.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/authentication_pages/authentication/forgot_pasword_page.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/authentication_pages/authentication/login_page.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/loading_state_widget.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/reusable_button.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/validators.dart';

class SignUpCubitWrapper extends StatelessWidget {
  const SignUpCubitWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpcBloc(),
      child: const SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

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
    final blocProvider = BlocProvider.of<SignUpcBloc>(context);
    return BlocBuilder<SignUpcBloc, SignUpState>(builder: (context, state) {
      if (state is SignUpInitialState) {
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
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: fullNameController,
                          validator: nameValidator.call,
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
                              borderRadius: BorderRadius.circular(8),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                  onTap: () async {},
                                  child: const Icon(Icons.email)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  style: BorderStyle.solid,
                                  color: kGreenColor.withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: 'Full Name',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 20.0),
                          ),
                        ),
                      ),
                      addVerticalSpacing(14),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: emailController,
                          validator: emailValidator.call,
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
                              borderRadius: BorderRadius.circular(8),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                  onTap: () async {},
                                  child: const Icon(Icons.email)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  style: BorderStyle.solid,
                                  color: kGreenColor.withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: 'Email',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 20.0),
                          ),
                        ),
                      ),
                      addVerticalSpacing(14),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: passwordController,
                          validator: passwordValidator.call,
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
                              borderRadius: BorderRadius.circular(8),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8),
                              child: GestureDetector(
                                  onTap: () async {},
                                  child: const Icon(Icons.email)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  style: BorderStyle.solid,
                                  color: kGreenColor.withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: 'Password',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 20.0),
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
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ReusableButton(
                          buttonText: const Text("Sign up", style: whiteText),
                          buttonColor: kGreenColor,
                          onTapped: () {
                            blocProvider.add(SignUpRequestedEvent(
                                email: emailController.text,
                                password: passwordController.text));
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
                              buttonText: const Text("Connect with facebook", style: whiteText),
                              buttonColor: kGreenColor,
                              onTapped: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  kUnderDevelopment,
                                );
                              }),
                          addVerticalSpacing(20),
                          ReusableButton(
                              buttonText: const Text("Connect with google", style: whiteText),
                              buttonColor: kGreenColor,
                              onTapped: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  kUnderDevelopment,
                                );
                              }),
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
      } else if (state is SignUpLoadingState) {
        return const Scaffold(
          body: LoadingState(),
        );
      } else if (state is SignUpSuccessState) {
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
      } else if (state is SignUpFailureState) {
        return SignUpFailureScreen(message: state.message.failureMessage);
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
