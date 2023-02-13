import 'package:flutter/material.dart';

import 'reusable_button.dart';

class AnimatedButton extends StatefulWidget {
  final String buttonText;
  final Function onTap;

  const AnimatedButton(
      {super.key, required this.buttonText, required this.onTap});

  @override
  AnimatedButtonState createState() => AnimatedButtonState();
}

class AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 50 * (1 - _animation.value)),
      child: ReusableButton(
          buttonText: Text(widget.buttonText),
          onTapped: widget.onTap,
          buttonColor: Colors.grey),
    );
  }
}
