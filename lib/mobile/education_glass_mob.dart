import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../utils/custom_classes.dart';
import '../utils/global_variables.dart';

class EducationGlassMob extends StatefulWidget {
  const EducationGlassMob({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  State<EducationGlassMob> createState() => _EducationGlassMobState();
}

class _EducationGlassMobState extends State<EducationGlassMob> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Row(
        children: <Widget>[
          Container(color: grey, width: 20, height: 1),
          const SizedBox(width: 20),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: iconContainerColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: <BoxShadow>[BoxShadow(blurRadius: 5, spreadRadius: 5, color: grey.withOpacity(.05), offset: const Offset(-3, -3))],
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomizedText(text: widget.data["title"], color: white, fontSize: 20),
                  const SizedBox(height: 10),
                  CustomizedText(text: widget.data["subtitle"], color: grey),
                  const SizedBox(height: 20),
                  const Divider(indent: 15, endIndent: 15, color: grey, height: .3, thickness: .3),
                  const SizedBox(height: 20),
                  Flexible(child: CustomizedText(text: widget.data["description"], color: grey, fontSize: 16)),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(3), border: Border.all(color: grey, width: .1)),
                    padding: const EdgeInsets.all(8),
                    child: CustomizedText(text: widget.data["state"], color: widget.data["state"] == "PASSED" ? green : blue, fontWeight: FontWeight.bold),
                  ).animate(onComplete: (AnimationController controller) => controller.repeat(reverse: true)).shimmer(duration: 3.seconds, color: grey.withOpacity(.2), colors: <Color>[grey.withOpacity(.1), white.withOpacity(.2)]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
