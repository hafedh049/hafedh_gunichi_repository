import 'package:flutter/material.dart';

import '../utils/custom_classes.dart';
import '../utils/global_variables.dart';

class ResumeMob extends StatefulWidget {
  const ResumeMob({super.key});

  @override
  State<ResumeMob> createState() => _ResumeMobState();
}

class _ResumeMobState extends State<ResumeMob> {
  final PageController _pageController = PageController();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  String _item = "Education";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      color: backgroundColor,
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
            decoration: BoxDecoration(
              color: iconContainerColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: <BoxShadow>[BoxShadow(blurRadius: 5, spreadRadius: 5, color: grey.withOpacity(.05), offset: const Offset(-3, -3))],
            ),
            child: StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) _) {
                return Column(
                  children: <Widget>[
                    for (final String key in resumeTabBarMob.keys)
                      Center(
                        child: SizedBox(
                          height: 70,
                          child: Tabulation(
                            tab: key,
                            selected: resumeTabBarMob[key]!["state"],
                            func: () => _(
                              () {
                                _item = key;
                                for (final MapEntry<String, Map<String, dynamic>> entry in resumeTabBarMob.entries) {
                                  if (entry.key != _item) {
                                    resumeTabBarMob[entry.key]!["state"] = false;
                                  } else {
                                    resumeTabBarMob[entry.key]!["state"] = true;
                                  }
                                }
                                if (key == _item) {
                                  _pageController.jumpToPage(resumeTabBarMob.entries.firstWhere((MapEntry<String, Map<String, dynamic>> element) => element.key == _item).value["id"]);
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: PageView.builder(
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemBuilder: (BuildContext context, int index) => resumeTabBarMob.entries.firstWhere((MapEntry<String, Map<String, dynamic>> element) => element.key == _item).value["page"],
            ),
          ),
        ],
      ),
    );
  }
}
