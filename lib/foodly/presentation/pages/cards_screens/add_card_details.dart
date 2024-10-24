import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/reused_widgets/reusable_button.dart';

class AddCardDetails extends StatelessWidget {
  const AddCardDetails({super.key});

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
          '',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  'Add card details',
                  style: kBoldTextStyle,
                ),
                addVerticalSpacing(20),
                Text(
                  'This card will only be charged when you place an order.',
                  style: kDescTextStyle,
                ),
                addVerticalSpacing(20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
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
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                  onTap: () async {},
                                  child: const Icon(Icons.credit_card_rounded)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  style: BorderStyle.solid,
                                  color: kGreenColor.withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: '1234 1234 1234 1234',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                          ),
                        ),
                      ),
                      addHorizontalSpacing(10),
                    ],
                  ),
                ),
                addVerticalSpacing(20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
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
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: kGreenColor.withOpacity(0.5)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  hintText: 'MM/YY',
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                ),
                              ),
                            ),
                            addHorizontalSpacing(10),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
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
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        style: BorderStyle.solid,
                                        color: kGreenColor.withOpacity(0.5)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  hintText: 'CVV',
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                ),
                              ),
                            ),
                            addHorizontalSpacing(10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                ReusableButton(
                    buttonText: const Text('Add card'),
                    buttonColor: kGreenColor,
                    onTapped: () {}),
                addVerticalSpacing(10),
                LocationButton(
                    const Text(
                      'Scan Card',
                      style: kBlackText,
                    ),
                    () {},
                    kWhiteColor)
              ],
            )
          ],
        ),
      ),
    );
  }
}
