import 'package:flutter/material.dart';

import '../utils/custom_classes.dart';
import '../utils/global_variables.dart';

class Testimonail extends StatefulWidget {
  const Testimonail({super.key});

  @override
  State<Testimonail> createState() => _TestimonailState();
}

class _TestimonailState extends State<Testimonail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const CustomizedText(text: "WHAT CLIENTS SAY", color: reddish, fontWeight: FontWeight.bold, letterSpacing: 3),
        const SizedBox(height: 20),
        const CustomizedText(text: "Testimonial", fontSize: 50, fontWeight: FontWeight.bold, letterSpacing: 2),
        const SizedBox(height: 30),
      ],
    );
  }
}
