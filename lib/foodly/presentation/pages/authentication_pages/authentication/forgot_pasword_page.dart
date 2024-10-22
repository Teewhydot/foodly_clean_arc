import 'package:flutter/material.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/reusable_button.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/validators.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        title: const Text(
          'Forgot Password',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpacing(24),
            const Text(
              'Forgot password ?',
              style: kTitleTextStyle,
            ),
            addVerticalSpacing(20),
            RichText(
                text: TextSpan(
              text:
                  'Enter your email address and we will send you a reset instructions.',
              style: kDescTextStyle,
            )),
            addVerticalSpacing(34),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailController,
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
                            onTap: () async {}, child: const Icon(Icons.email)),
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
                ReusableButton(
                    buttonText: const Text('Reset Password'),
                    buttonColor: kGreenColor,
                    onTapped: () {})
              ],
            ),
          ],
        ),
      ),
    );
  }
}
