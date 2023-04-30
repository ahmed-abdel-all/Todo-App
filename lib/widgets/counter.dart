import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int count;
  final int totalcount;

  const Counter({super.key, required this.count, required this.totalcount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text(
        '$count/$totalcount',
        style: TextStyle(
          color: count == totalcount ? Colors.greenAccent : Colors.white,
          fontSize: 45,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
