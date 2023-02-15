import 'package:flutter/material.dart';
import 'package:foodly_clean_arc/foodly/domain/entities/models/notification_widgets.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/reusable_button.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        title: const Text(
          'Profile information',
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
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpacing(20),
                Text(
                  'Enter your current password and new password to change your password',
                  style: kDescTextStyle,
                ),
                addVerticalSpacing(20),
                const Text(
                  'Current password',
                ),
                addVerticalSpacing(20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your current password',
                    hintStyle: kDescTextStyle,
                    border: InputBorder.none,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Divider(),
                ),
                addVerticalSpacing(20),
                const Text(
                  'New password',
                ),
                addVerticalSpacing(20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your new password',
                    hintStyle: kDescTextStyle,
                    border: InputBorder.none,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Divider(),
                ),
                addVerticalSpacing(20),
                const Text(
                  'Confirm new password',
                ),
                addVerticalSpacing(20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Confirm your new password',
                    hintStyle: kDescTextStyle,
                    border: InputBorder.none,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Divider(),
                ),
              ],
            ),
            Column(
              children: [
                ReusableButton(
                    buttonText: const Text('Change Password'),
                    buttonColor: kGreenColor,
                    onTapped: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SuccessActionWidget(
                            heading: 'Done',
                            subHeading: 'Password changed ',
                            buttonText: 'Proceed',
                            onPressed: () {
                              Navigator.pop(context);
                            });
                      }));
                    }),
                addVerticalSpacing(400),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
