import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../utils/custom_classes.dart';
import '../utils/global_variables.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 200,
      color: backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const CircleAvatar(radius: 35, backgroundColor: backgroundColor, backgroundImage: AssetImage("assets/images/me.jpg")),
            const SizedBox(height: 20),
            const CustomizedText(text: "Hafedh GUNICHI", color: reddish, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 3),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const CustomizedText(text: "© 2022. All rights reserved by", color: grey, fontSize: 16, letterSpacing: 3),
                const SizedBox(width: 5),
                StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) _) {
                    return InkWell(
                      onTap: () async => _(() => _isHovered = !_isHovered),
                      onHover: (bool value) => _(() => _isHovered = value),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CustomizedText(text: "The Real World.", color: _isHovered ? reddish : grey.withOpacity(.6), fontSize: 16, letterSpacing: 2),
                          const SizedBox(height: 1),
                          AnimatedContainer(duration: 700.ms, height: 1, width: !_isHovered ? 0 : "The Real World.".length * 9, color: reddish),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
