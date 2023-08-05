import 'package:flutter/material.dart';
import 'package:stepper_list_view/stepper_list_view.dart';

import '../utils/custom_classes.dart';
import '../utils/global_variables.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const CustomizedText(text: "2006 - 2023", color: reddish, fontWeight: FontWeight.bold, letterSpacing: 3),
        const SizedBox(height: 20),
        const CustomizedText(text: "Education Background", fontSize: 50, fontWeight: FontWeight.bold, letterSpacing: 2),
        const SizedBox(height: 30),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 590,
                child: StepperListView(
                  shrinkWrap: true,
                  stepperData: <StepperItemData>[for (final Map<String, String> ed in education.getRange(0, education.length ~/ 2)) StepperItemData(content: ed)],
                  stepAvatar: (BuildContext context, dynamic value) => PreferredSize(preferredSize: const Size.fromRadius(15), child: Radio<bool>(value: true, groupValue: true, onChanged: (bool? value) => true, activeColor: reddish, hoverColor: hoverediconContainerColor)),
                  stepContentWidget: (BuildContext context, dynamic value) => EducationGlass(data: value.content),
                ),
              ),
              const SizedBox(width: 40),
              SizedBox(
                width: 590,
                child: StepperListView(
                  shrinkWrap: true,
                  stepperData: <StepperItemData>[for (final Map<String, String> ed in education.getRange(education.length ~/ 2, education.length)) StepperItemData(content: ed)],
                  stepAvatar: (BuildContext context, dynamic value) => PreferredSize(preferredSize: const Size.fromRadius(15), child: Radio<bool>(value: true, groupValue: true, onChanged: (bool? value) => true, activeColor: reddish, hoverColor: hoverediconContainerColor)),
                  stepContentWidget: (BuildContext context, dynamic value) => EducationGlass(data: value.content),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
