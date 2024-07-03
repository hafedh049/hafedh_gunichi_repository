import 'package:flutter/material.dart';

import '../utils/custom_classes.dart';
import '../utils/global_variables.dart';

class Resume extends StatefulWidget {
  const Resume({super.key});

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  final GlobalKey<State<StatefulWidget>> _pagesKey = GlobalKey<State<StatefulWidget>>();

  String _item = "Education";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      color: backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CustomizedText(text: "3+ YEARS OF EXPERIENCE", color: reddish, fontWeight: FontWeight.bold, letterSpacing: 2),
            const SizedBox(height: 20),
            const CustomizedText(text: "My Resume", fontSize: 50, fontWeight: FontWeight.bold, letterSpacing: 2),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.sizeOf(context).width * .8,
              height: 70,
              decoration: BoxDecoration(
                color: iconContainerColor,
                borderRadius: BorderRadius.circular(5),
                boxShadow: <BoxShadow>[BoxShadow(blurRadius: 5, spreadRadius: 5, color: grey.withOpacity(.05), offset: const Offset(-3, -3))],
              ),
              child: StatefulBuilder(
                builder: (BuildContext context, void Function(void Function()) _) {
                  return Row(
                    children: <Widget>[
                      for (final String key in resumeTabBar.keys)
                        Expanded(
                          child: Tabulation(
                            tab: key,
                            selected: resumeTabBar[key]!["state"],
                            func: () => _(
                              () {
                                _item = key;
                                for (final MapEntry<String, Map<String, dynamic>> entry in resumeTabBar.entries) {
                                  if (entry.key != _item) {
                                    resumeTabBar[entry.key]!["state"] = false;
                                  } else {
                                    resumeTabBar[entry.key]!["state"] = true;
                                  }
                                }
                                if (key == _item) {
                                  _pagesKey.currentState!.setState(() {});
                                }
                              },
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: StatefulBuilder(
                key: _pagesKey,
                builder: (BuildContext context, void Function(void Function()) _) => resumeTabBar.entries
                    .firstWhere(
                      (MapEntry<String, Map<String, dynamic>> element) => element.key == _item,
                    )
                    .value["page"],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
