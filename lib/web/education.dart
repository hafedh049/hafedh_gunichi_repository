import 'package:flutter/material.dart';

import '../utils/custom_classes.dart';
import '../utils/global_variables.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const CustomizedText(text: "2006 - 2023", color: reddish, letterSpacing: 3),
        const SizedBox(height: 20),
        const CustomizedText(text: "Education Background", fontSize: 50, fontWeight: FontWeight.bold, letterSpacing: 2),
        const SizedBox(height: 30),
        Flexible(
          child: Stepper(
            controlsBuilder: (context, details) => const SizedBox(),
            steps: <Step>[for (int i = 0; i < 10; i++) const Step(title: EducationGlass(data: {}), content: SizedBox())],
            stepIconBuilder: (stepIndex, stepState) => Radio(value: true, groupValue: "1", onChanged: (value) => true, activeColor: reddish, hoverColor: hoverediconContainerColor),
          ),
        ),
      ],
    );
  }
}
