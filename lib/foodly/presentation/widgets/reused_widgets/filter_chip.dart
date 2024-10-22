import 'package:flutter/material.dart';
import 'package:foodly_clean_arc/foodly/presentation/widgets/constants.dart';

class ReusableFilterChip extends StatefulWidget {
  const ReusableFilterChip({
    super.key,
    required this.text,
    required this.isSelected,
  });
  final Text text;
  final bool isSelected;

  @override
  State<ReusableFilterChip> createState() => _ReusableFilterChipState();
}

class _ReusableFilterChipState extends State<ReusableFilterChip> {
  var isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
        selectedColor: kGreenColor,
        pressElevation: 2,
        selected: isSelected,
        label: widget.text,
        onSelected: (val) {
          setState(() {
            isSelected = val;
          });
        });
  }
}
