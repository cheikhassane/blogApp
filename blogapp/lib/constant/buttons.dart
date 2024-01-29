import 'package:flutter/material.dart';

import '../main.dart';

class ButtonCard extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  const ButtonCard({
    required this.text,
    required this.onClicked,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onClicked,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: HexColor.fromHex("#B16631"),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          // shape: const StadiumBorder(),
          textStyle: const TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins_semibolt',
            fontSize: 16,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Poppins_semibolt',
            fontSize: 16,
          ),
        ),
      );
}
