import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hafedh_gunichi/utils/custom_classes.dart';

import '../utils/global_variables.dart';

class Feature extends StatelessWidget {
  const Feature({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      color: backgroundColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const CustomizedText(text: "FEATURES", color: reddish, letterSpacing: 2).animate().slide().fade(),
            const SizedBox(height: 20),
            const CustomizedText(text: "WHAT I DO ?", fontSize: 50, fontWeight: FontWeight.bold, letterSpacing: 2).animate().slide().fade(),
            const SizedBox(height: 20),
            Flexible(
              child: SingleChildScrollView(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  spacing: 40,
                  runSpacing: 40,
                  children: <Widget>[
                    for (final Map<String, dynamic> feature in features) Animate(effects: const <Effect>[FadeEffect(), SlideEffect()], child: FeatureGlassContainer(data: feature))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
