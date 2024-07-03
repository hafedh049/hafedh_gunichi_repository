import 'package:flutter/material.dart';
import 'package:hafedh_gunichi/utils/global_variables.dart';

class ProfessionalSkills extends StatelessWidget {
  const ProfessionalSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: professionalSkills.length,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 80),
      itemBuilder: (BuildContext context, int index) => professionalSkills[index],
    );
  }
}
