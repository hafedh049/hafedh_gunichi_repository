import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hafedh_gunichi/mobile/education_glass_mob.dart';
import 'package:stepper_list_view/stepper_list_view.dart';

import '../utils/custom_classes.dart';
import '../utils/global_variables.dart';

class EducationMob extends StatelessWidget {
  const EducationMob({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 10),
          const CustomizedText(text: "2006 - 2023", color: reddish, fontWeight: FontWeight.bold, letterSpacing: 3).animate().slide().fade(),
          const SizedBox(height: 20),
          const CustomizedText(text: "Education Background", fontSize: 35, fontWeight: FontWeight.bold, letterSpacing: 2).animate().slide().fade(),
          const SizedBox(height: 20),
          StepperListView(
            shrinkWrap: true,
            stepperData: <StepperItemData>[for (final Map<String, String> ed in education) StepperItemData(content: ed)],
            stepAvatar: (BuildContext context, dynamic value) => PreferredSize(preferredSize: const Size.fromRadius(15), child: Radio<bool>(value: true, groupValue: true, onChanged: (bool? value) => true, activeColor: reddish, hoverColor: hoverediconContainerColor)),
            stepContentWidget: (BuildContext context, dynamic value) => EducationGlassMob(data: value.content).animate().slide().fade(),
          ),
        ],
      ),
    );
  }
}
