import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/custom_classes.dart';
import '../utils/global_variables.dart';

class PricePlanMob extends StatelessWidget {
  const PricePlanMob({super.key, required this.plan});
  final Map<String, dynamic> plan;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CustomizedText(text: plan['title'], fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 3),
                  const SizedBox(height: 10),
                  CustomizedText(text: plan['subtitle'], color: grey, letterSpacing: 2),
                ],
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(3), border: Border.all(color: grey, width: .1)),
                padding: const EdgeInsets.all(8),
                child: CustomizedText(text: "\$${plan['price']}", color: reddish, fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ],
          ),
          const SizedBox(height: 40),
          CustomizedText(text: plan['description'], color: grey, fontSize: 16, letterSpacing: 2),
          const Spacer(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (final String task in plan["tasks"]) ...<Widget>[
                  Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.check, color: white.withOpacity(.8), size: 20),
                      const SizedBox(width: 5),
                      CustomizedText(text: task, color: white.withOpacity(.8), fontSize: 18),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(7), border: Border.all(color: Colors.black, width: .1)),
              padding: const EdgeInsets.all(8),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomizedText(text: "CONTACT ME ", color: reddish, fontSize: 20),
                  Icon(FontAwesomeIcons.chevronRight, color: reddish, size: 20),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(FontAwesomeIcons.clock, color: white.withOpacity(.4), size: 15),
                const SizedBox(width: 5),
                CustomizedText(text: plan['delivery'], color: white.withOpacity(.4), fontSize: 12, letterSpacing: 2),
                const SizedBox(width: 20),
                Icon(FontAwesomeIcons.waveSquare, color: white.withOpacity(.4), size: 15),
                const SizedBox(width: 10),
                CustomizedText(text: 'Unlimited Revision', color: white.withOpacity(.4), fontSize: 12, letterSpacing: 2),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
