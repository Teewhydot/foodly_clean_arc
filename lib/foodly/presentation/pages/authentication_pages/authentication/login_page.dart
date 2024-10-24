// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_clean_arc/foodly/presentation/manager/login_bloc/login_bloc.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/authentication_pages/authentication/forgot_pasword_page.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/authentication_pages/authentication/signup_page.dart';
import 'package:foodly_clean_arc/foodly/presentation/pages/location_screens/location_screen.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/loading_state_widget.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/login_email_textfield.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/login_failure_screen.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/login_password_textfield.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/reusable_button.dart';

class LoginWrapper extends StatelessWidget {
  const LoginWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                              return const SignUpCubitWrapper();
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
                        LoginEmailTextField(emailController: _emailController),
                        addVerticalSpacing(24),
                        LoginPasswordTextField(
                            passwordController: _passwordController),
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
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ReusableButton(
                            buttonText: Text("Sign in", style: whiteText),
                            buttonColor: kGreenColor,
                            onTapped: () {
                              if (_formKey.currentState!.validate()) {
                                blocProvider.add(LoginRequestedEvent(
                                    email: _emailController.text,
                                    password: _passwordController.text));
                              }
                            }),
                        addVerticalSpacing(20),
                        Text(
                          'Or',
                          style: kDescTextStyle,
                        ),
                        addVerticalSpacing(50),
                        Column(
                          children: [
                            ReusableButton(
                                buttonText: const Text("Sign in with facebook",  style: whiteText),
                                buttonColor: kDeepBlueColor,
                                onTapped: () {
                                  // show snackbar with message
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    kUnderDevelopment,
                                  );
                                }),
                            addVerticalSpacing(20),
                            ReusableButton(
                                buttonText: const Text("Sign in with google",  style: whiteText),
                                buttonColor: kBlueColor,
                                onTapped: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    kUnderDevelopment,
                                  );
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is LoginLoadingState) {
          return const Center(child: LoadingState()); //loading indicator
        } else if (state is LoginSuccessState) {
          return const LocationScreen();
        } else if (state is LoginFailureState) {
          return LoginFailureScreen(
            message: state.message.failureMessage,
          );
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}
