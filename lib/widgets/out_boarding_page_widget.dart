import 'package:flutter/material.dart';

class OutBoardingPage extends StatelessWidget {
  final String title;
  final String image;

  const OutBoardingPage({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(32,),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xff1E1F20),
              fontSize: 20,
              fontFamily: 'avenir-Heavy',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}