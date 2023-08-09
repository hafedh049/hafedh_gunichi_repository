import 'package:flutter/material.dart';
import 'package:hafedh_gunichi/mobile/pricing_plan_mob.dart';

import '../utils/custom_classes.dart';
import '../utils/global_variables.dart';

class PricingMob extends StatefulWidget {
  const PricingMob({super.key});

  @override
  State<PricingMob> createState() => _PricingMobState();
}

class _PricingMobState extends State<PricingMob> {
  String _item = "Static";
  final PageController _pageController = PageController();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      color: backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CustomizedText(text: "PRICING PLAN", color: reddish, fontWeight: FontWeight.bold, letterSpacing: 3),
            const SizedBox(height: 20),
            const CustomizedText(text: "My Pricing", fontSize: 50, fontWeight: FontWeight.bold, letterSpacing: 2),
            const SizedBox(height: 10),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: iconContainerColor,
                  boxShadow: <BoxShadow>[BoxShadow(blurRadius: 5, spreadRadius: 5, color: grey.withOpacity(.05), offset: const Offset(-3, -3))],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
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
                              for (final Map<String, dynamic> header in pricingTabs)
                                Flexible(
                                  child: Tabulation(
                                    tab: header["header"],
                                    selected: header["hover"],
                                    func: () {
                                      _item = header["header"];
                                      for (final Map<String, dynamic> entry in pricingTabs) {
                                        if (entry["header"] != _item) {
                                          entry["hover"] = false;
                                        } else {
                                          entry["hover"] = true;
                                        }
                                      }
                                      _(() => true);
                                      if (header["header"] == _item) {
                                        _pageController.jumpToPage(pricingTabs.firstWhere((Map<String, dynamic> element) => element["header"] == _item)["id"]);
                                      }
                                    },
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Flexible(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: plans.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) => PricePlanMob(plan: plans[index]),
                      ),
                    ),
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
