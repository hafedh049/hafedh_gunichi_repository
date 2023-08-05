import 'package:flutter/material.dart';
import 'package:hafedh_gunichi/utils/custom_classes.dart';
import 'package:hafedh_gunichi/utils/global_variables.dart';

class OtherSkills extends StatelessWidget {
  const OtherSkills({super.key, required this.data, required this.header, required this.subheader});
  final Map<String, Map<String, dynamic>> data;
  final String header;
  final String subheader;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomizedText(text: header, color: grey, fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 2),
          const SizedBox(height: 10),
          CustomizedText(text: subheader, color: grey.withOpacity(.8), fontSize: 16),
          const SizedBox(height: 10),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            children: <Widget>[
              for (final MapEntry<String, Map<String, dynamic>> entry in data.entries) SkillGlass(data: entry.value, title: entry.key),
            ],
          ),
        ],
      ),
    );
  }
}
