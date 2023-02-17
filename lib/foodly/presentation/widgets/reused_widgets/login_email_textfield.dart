import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.r))),
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
                color: kGreenColor, width: 3, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(8.r),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.0.r),
            child: GestureDetector(
                onTap: () async {}, child: const Icon(Icons.email)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1,
                style: BorderStyle.solid,
                color: kGreenColor.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(8.r),
          ),
          hintText: 'Email',
          contentPadding:
              EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 20.0.w),
        ),
      ),
    );
  }
}
