import 'package:flutter/material.dart';
import 'package:hafedh_gunichi/utils/custom_classes.dart';

class OtherSkills extends StatelessWidget {
  const OtherSkills({super.key, required this.data, required this.header, required this.subheader});
  final Map<String, Map<String, dynamic>> data;
  final String header;
  final String subheader;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 40,
        runSpacing: 40,
        children: <Widget>[
          for (final MapEntry<String, Map<String, dynamic>> entry in data.entries) SkillGlass(data: entry.value, title: entry.key),
        ],
      ),
    );
  }
}
