import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class CircleFlag extends StatelessWidget {
  final String countryCode;
  const CircleFlag({super.key, required this.countryCode});

  @override
  Widget build(BuildContext context) {
    return Flag.fromString(
      countryCode,
      height: 26,
      width: 26,
      fit: BoxFit.fill,
      flagSize: FlagSize.size_1x1,
      borderRadius: 13,
      replacement: const Text('?'),
    );
  }
}