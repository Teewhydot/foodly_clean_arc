import 'package:flutter/material.dart';

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
      child: Material(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30.0),
        child: InkWell(
          onTap: () {
            widget.onTap;
          },
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              widget.buttonText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
