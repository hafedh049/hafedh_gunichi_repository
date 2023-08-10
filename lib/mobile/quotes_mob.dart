import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/custom_classes.dart';
import '../utils/global_variables.dart';

class QuoteMob extends StatefulWidget {
  const QuoteMob({super.key});

  @override
  State<QuoteMob> createState() => _QuoteMobState();
}

class _QuoteMobState extends State<QuoteMob> {
  bool _isHovered = false;
  bool _back = false;
  bool _forth = false;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CustomizedText(text: "GOLDEN WORDS", color: reddish, fontWeight: FontWeight.bold, letterSpacing: 3).animate().slide().fade(),
          const SizedBox(height: 20),
          const CustomizedText(text: "Best Quotes", fontSize: 50, fontWeight: FontWeight.bold, letterSpacing: 2).animate().slide().fade(),
          const SizedBox(height: 30),
          Flexible(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  StatefulBuilder(
                    builder: (BuildContext context, void Function(void Function()) _) {
                      return InkWell(
                        onHover: (bool value) => _(() => _back = value),
                        onTap: () async => await _pageController.previousPage(duration: 300.ms, curve: Curves.linear),
                        child: AnimatedContainer(
                          duration: 100.ms,
                          decoration: BoxDecoration(
                            color: _back ? hoverediconContainerColor : iconContainerColor,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: <BoxShadow>[BoxShadow(blurRadius: 5, spreadRadius: 5, color: grey.withOpacity(.05), offset: const Offset(-3, -3))],
                          ),
                          padding: const EdgeInsets.all(24),
                          child: FaIcon(FontAwesomeIcons.chevronLeft, color: !_back ? white : reddish),
                        ),
                      );
                    },
                  ).animate().slide().fade(),
                  const SizedBox(height: 20),
                  Flexible(
                    child: PageView.builder(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: quotes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return StatefulBuilder(
                          builder: (BuildContext context, void Function(void Function()) _) {
                            return InkWell(
                              onTap: () => true,
                              onHover: (bool value) => _(() => _isHovered = value),
                              child: AnimatedContainer(
                                duration: 300.ms,
                                padding: const EdgeInsets.all(48),
                                decoration: BoxDecoration(color: _isHovered ? hoverediconContainerColor : iconContainerColor, borderRadius: BorderRadius.circular(25)),
                                child: Center(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Row(children: <Widget>[Icon(FontAwesomeIcons.quoteLeft, size: 60, color: _isHovered ? reddish : grey), const Spacer()]),
                                        const SizedBox(height: 10),
                                        Flexible(child: CustomizedText(text: quotes[index], color: reddish, fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 20)),
                                        const SizedBox(height: 10),
                                        Row(children: <Widget>[const Spacer(), Icon(FontAwesomeIcons.quoteRight, size: 60, color: _isHovered ? reddish : grey)]),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ).animate().slide().fade();
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  StatefulBuilder(
                    builder: (BuildContext context, void Function(void Function()) _) {
                      return InkWell(
                        onHover: (bool value) => _(() => _forth = value),
                        onTap: () async => await _pageController.nextPage(duration: 300.ms, curve: Curves.linear),
                        child: AnimatedContainer(
                          duration: 100.ms,
                          decoration: BoxDecoration(
                            color: _forth ? hoverediconContainerColor : iconContainerColor,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: <BoxShadow>[BoxShadow(blurRadius: 5, spreadRadius: 5, color: grey.withOpacity(.05), offset: const Offset(-3, -3))],
                          ),
                          padding: const EdgeInsets.all(24),
                          child: FaIcon(FontAwesomeIcons.chevronRight, color: !_forth ? white : reddish),
                        ),
                      );
                    },
                  ).animate().slide().fade(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
