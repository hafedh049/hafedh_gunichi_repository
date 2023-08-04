import 'package:flutter/material.dart';
import 'package:hafedh_gunichi/utils/custom_classes.dart';

import '../utils/global_variables.dart';

class Feature extends StatelessWidget {
  const Feature({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        color: backgroundColor,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const CustomizedText(text: "FEATURES", color: reddish, letterSpacing: 2),
              const SizedBox(height: 20),
              const CustomizedText(text: "WHAT I DO ?", fontSize: 50, fontWeight: FontWeight.bold, letterSpacing: 2),
              const SizedBox(height: 20),
              Flexible(
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 40,
                    runSpacing: 40,
                    children: <Widget>[for (final Map<String, dynamic> feature in features) FeatureGlassContainer(data: feature)],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
