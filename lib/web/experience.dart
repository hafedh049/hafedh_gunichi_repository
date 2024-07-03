import 'package:flutter/material.dart';
import 'package:stepper_list_view/stepper_list_view.dart';

import '../utils/custom_classes.dart';
import '../utils/global_variables.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const CustomizedText(text: "2020 - 2023", color: reddish, fontWeight: FontWeight.bold, letterSpacing: 3),
        const SizedBox(height: 20),
        const CustomizedText(text: "Experience", fontSize: 50, fontWeight: FontWeight.bold, letterSpacing: 2),
        const SizedBox(height: 30),
        Center(
          child: StepperListView(
            shrinkWrap: true,
            stepperData: <StepperItemData>[for (final Map<String, String> exp in experience) StepperItemData(content: exp)],
            stepAvatar: (BuildContext context, dynamic value) => PreferredSize(preferredSize: const Size.fromRadius(15), child: Radio<bool>(value: true, groupValue: true, onChanged: (bool? value) => true, activeColor: reddish, hoverColor: hoverediconContainerColor)),
            stepContentWidget: (BuildContext context, dynamic value) => EducationGlass(data: value.content),
          ),
        ),
      ],
    );
  }
}
