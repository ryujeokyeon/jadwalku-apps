import 'package:flutter/material.dart';
import '../constant.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  Button({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: biru,
        border: Border.all(color: hitam, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: MaterialButton(
        elevation: 0,
        onPressed: onPressed,
        color: biru,
        child: Text(
          text,
          style: const TextStyle(
            color: putih,
          ),
        ),
      ),
    );
  }
}
