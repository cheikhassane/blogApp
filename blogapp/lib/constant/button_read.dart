import 'package:flutter/material.dart';

class ButtonRead extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  const ButtonRead({
    required this.text,
    required this.onClicked,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onClicked,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          // shape: const StadiumBorder(),
          textStyle: const TextStyle(
            color: Colors.white,
            fontFamily: 'Urbanist_bolt',
            fontSize: 14,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Urbanist_bolt',
            fontSize: 14,
          ),
        ),
      );
}
