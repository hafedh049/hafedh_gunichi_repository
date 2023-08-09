import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hafedh_gunichi/utils/custom_classes.dart';
import 'package:hafedh_gunichi/utils/global_variables.dart';
import 'package:lottie/lottie.dart';

class HomeMob extends StatefulWidget {
  const HomeMob({super.key});

  @override
  State<HomeMob> createState() => _HomeMobState();
}

class _HomeMobState extends State<HomeMob> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      color: backgroundColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Flexible(child: Center(child: LottieBuilder.asset("assets/lotties/home.json"))),
            const SizedBox(height: 10),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const CustomizedText(text: "WELCOME TO MY WORLD", fontSize: 16, fontWeight: FontWeight.w500, color: grey, letterSpacing: 2),
                const SizedBox(height: 10),
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomizedText(text: "Hi, I'm ", fontSize: 35, fontWeight: FontWeight.bold),
                    Flexible(child: CustomizedText(text: "Hafedh Gunichi", color: reddish, fontSize: 35, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const CustomizedText(text: "a ", fontSize: 35, fontWeight: FontWeight.bold),
                    Flexible(
                      child: AnimatedTextKit(
                        repeatForever: true,
                        pause: 800.ms,
                        animatedTexts: <AnimatedText>[
                          for (final String text in const <String>["Professional Coder.", "Developer."]) TypewriterAnimatedText(text, speed: 60.ms, textStyle: GoogleFonts.roboto(fontSize: 35, fontWeight: FontWeight.bold, color: reddish))
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const Flexible(child: SingleChildScrollView(child: CustomizedText(text: description, color: grey, fontSize: 16, letterSpacing: 2))),
                const SizedBox(height: 10),
                const CustomizedText(text: "FIND ME", fontSize: 16, color: grey, letterSpacing: 2),
                const SizedBox(height: 10),
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    IconGlass(icon: FontAwesomeIcons.facebookF, url: ""),
                    SizedBox(width: 20),
                    IconGlass(icon: FontAwesomeIcons.x, url: "", image: "x_core.svg"),
                    SizedBox(width: 20),
                    IconGlass(icon: FontAwesomeIcons.linkedinIn, url: ""),
                  ],
                ),
                const SizedBox(height: 10),
                const CustomizedText(text: "BEST SKILLS ON", fontSize: 16, color: grey, letterSpacing: 2),
                const SizedBox(height: 10),
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    IconGlass(icon: FontAwesomeIcons.a, image: "flutter.png"),
                    SizedBox(width: 20),
                    IconGlass(icon: FontAwesomeIcons.a, image: "firebase.png"),
                    SizedBox(width: 20),
                    IconGlass(icon: FontAwesomeIcons.a, image: "django.png"),
                    SizedBox(width: 20),
                    IconGlass(icon: FontAwesomeIcons.a, image: "figma.png"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
