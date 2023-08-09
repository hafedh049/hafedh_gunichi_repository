import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hafedh_gunichi/utils/custom_classes.dart';
import 'package:hafedh_gunichi/utils/global_variables.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class DevelopmentSkillsAndFrameworksMob extends StatelessWidget {
  const DevelopmentSkillsAndFrameworksMob({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const CustomizedText(text: "Features", fontSize: 18, color: reddish, letterSpacing: 2).animate().slide().fade(),
              const SizedBox(height: 20),
              const CustomizedText(text: "Development Skills", fontSize: 25, color: white, fontWeight: FontWeight.bold).animate().slide().fade(),
              const SizedBox(height: 20),
              for (final MapEntry<String, double> entry in programmingLanguages.entries) ...<Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CustomizedText(text: entry.key, color: white, fontSize: 16, letterSpacing: 2),
                        const Spacer(),
                        CustomizedText(text: "${entry.value}%", color: white, fontSize: 16, letterSpacing: 2),
                      ],
                    ),
                    const SizedBox(height: 10),
                    FAProgressBar(
                      currentValue: entry.value,
                      animatedDuration: 1.seconds,
                      backgroundColor: iconContainerColor,
                      size: 5,
                      progressGradient: const LinearGradient(colors: <Color>[Colors.pinkAccent, reddish]),
                    ),
                    const SizedBox(height: 25),
                  ],
                ).animate().slide().fade(),
              ],
            ],
          ),
        ),
        const SizedBox(height: 20),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CustomizedText(text: "Features", fontSize: 18, color: reddish, letterSpacing: 2).animate().slide().fade(),
            const SizedBox(height: 20),
            const CustomizedText(text: "Frameworks", fontSize: 25, color: white, fontWeight: FontWeight.bold).animate().slide().fade(),
            const SizedBox(height: 20),
            for (final MapEntry<String, double> entry in frameworks.entries) ...<Widget>[
              CustomizedText(text: entry.key, color: white, fontSize: 16, letterSpacing: 2).animate().slide().fade(),
              const SizedBox(height: 10),
              Center(
                child: SimpleCircularProgressBar(
                  size: 150,
                  progressStrokeWidth: 5,
                  backStrokeWidth: 5,
                  valueNotifier: ValueNotifier(entry.value),
                  animationDuration: 1,
                  backColor: iconContainerColor,
                  progressColors: const <Color>[Colors.pinkAccent, reddish],
                  onGetText: (double p0) => Text("${p0.toStringAsFixed(0)}%", style: GoogleFonts.roboto(fontSize: 25, letterSpacing: 2, fontWeight: FontWeight.bold, color: reddish)),
                ).animate().slide().fade(),
              ),
              const SizedBox(height: 20),
            ],
          ],
        ),
      ],
    );
  }
}
