import 'package:flutter/material.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/validators.dart';

class LoginEmailTextField extends StatelessWidget {
  const LoginEmailTextField({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      decoration:
          const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
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
                color: kGreenColor, width: 3, style: BorderStyle.solid),
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
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
        ),
      ),
    );
  }
}
