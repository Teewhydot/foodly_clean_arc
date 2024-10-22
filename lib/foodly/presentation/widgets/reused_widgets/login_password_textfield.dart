import 'package:flutter/material.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/validators.dart';

class LoginPasswordTextField extends StatelessWidget {
  const LoginPasswordTextField({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      decoration:
          const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: _passwordController,
        validator: passwordValidator.call,
        cursorColor: Colors.black,
        keyboardType: TextInputType.visiblePassword,
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
                onTap: () async {}, child: const Icon(Icons.lock)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1,
                style: BorderStyle.solid,
                color: kGreenColor.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: 'Password',
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        ),
      ),
    );
  }
}
