import 'package:flutter/material.dart';
import 'package:hafedh_gunichi/utils/global_variables.dart';

class ProfessionalSkillsMob extends StatelessWidget {
  const ProfessionalSkillsMob({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: professionalSkills.length,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 80),
      itemBuilder: (BuildContext context, int index) => professionalSkillsMob[index],
    );
  }
}
