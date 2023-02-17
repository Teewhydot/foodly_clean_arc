import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.r))),
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
                color: kGreenColor, width: 3, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(8.r),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0.r),
            child: GestureDetector(
                onTap: () async {}, child: const Icon(Icons.lock)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1,
                style: BorderStyle.solid,
                color: kGreenColor.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(8.r),
          ),
          hintText: 'Password',
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 20.0.w),
        ),
      ),
    );
  }
}
