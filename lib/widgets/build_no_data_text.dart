import 'package:flutter/material.dart';

Widget buildNoDataText() {
  return const Center(
    child: Text(
      'NO DATA',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    ),
  );
}