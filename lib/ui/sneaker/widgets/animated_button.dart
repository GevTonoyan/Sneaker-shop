import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final Function onPressed;

  const AnimatedButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedPadding(
        curve: Curves.linear,
        duration: const Duration(milliseconds: 50),
        padding: EdgeInsets.symmetric(
          horizontal: _isPressed ? 30 : 12,
          vertical: _isPressed ? 12 : 0,
        ),
        child: Container(
          height: 45.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
