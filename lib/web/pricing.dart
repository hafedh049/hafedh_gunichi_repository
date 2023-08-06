import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hafedh_gunichi/web/price_plan.dart';

import '../utils/custom_classes.dart';
import '../utils/global_variables.dart';

class Pricing extends StatefulWidget {
  const Pricing({super.key});

  @override
  State<Pricing> createState() => _PricingState();
}

class _PricingState extends State<Pricing> {
  String _item = "Static";
  final PageController _pageController = PageController();
  final GlobalKey<TooltipState> _recomKey = GlobalKey<TooltipState>();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Future.delayed(1.5.seconds, () => _recomKey.currentState!.ensureTooltipVisible());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(48),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        color: backgroundColor,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CustomizedText(text: "PRICING PLAN", color: reddish, fontWeight: FontWeight.bold, letterSpacing: 3),
                  SizedBox(height: 20),
                  CustomizedText(text: "My Pricing", fontSize: 50, fontWeight: FontWeight.bold, letterSpacing: 2),
                ],
              ),
              const SizedBox(width: 60),
              Container(
                height: MediaQuery.sizeOf(context).height * .7,
                width: MediaQuery.sizeOf(context).width * .4,
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
                                  child: Tooltip(
                                    preferBelow: false,
                                    key: header["header"] == "Standard" ? _recomKey : null,
                                    message: header["header"] == "Standard" ? "Recommended" : "",
                                    showDuration: 10.minutes,
                                    child: Tabulation(
                                      tab: header["header"],
                                      selected: header["hover"],
                                      func: () {
                                        for (final Map<String, dynamic> entry in pricingTabs) {
                                          if (entry["header"] != _item) {
                                            entry["hover"] = false;
                                          } else {
                                            entry["hover"] = true;
                                          }
                                        }
                                        _(() => true);
                                        if (header["header"] != _item) {
                                          _item = header["header"];
                                          _pageController.jumpToPage(pricingTabs.firstWhere((Map<String, dynamic> element) => element["header"] == _item)["id"]);
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
                    Flexible(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: plans.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) => PricePlan(plan: plans[index]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
