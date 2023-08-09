import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/custom_classes.dart';
import '../utils/global_variables.dart';

class TestimonialMob extends StatefulWidget {
  const TestimonialMob({super.key});

  @override
  State<TestimonialMob> createState() => _TestimonialMobState();
}

class _TestimonialMobState extends State<TestimonialMob> {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CustomizedText(text: "WHAT CLIENTS SAY", color: reddish, fontWeight: FontWeight.bold, letterSpacing: 3).animate().slide().fade(),
          const SizedBox(height: 20),
          const CustomizedText(text: "Testimonial", fontSize: 50, fontWeight: FontWeight.bold, letterSpacing: 2).animate().slide().fade(),
          const SizedBox(height: 20),
          Flexible(
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: testimonials.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: iconContainerColor,
                          boxShadow: <BoxShadow>[BoxShadow(blurRadius: 5, spreadRadius: 5, color: grey.withOpacity(.05), offset: const Offset(-3, -3))],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Flexible(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                                      child: StatefulBuilder(
                                        builder: (BuildContext context, void Function(void Function()) setS) {
                                          return ClipRRect(
                                            borderRadius: BorderRadius.circular(15),
                                            child: Image.asset("assets/images/${testimonials[index]["image"]!}", fit: BoxFit.cover),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            CustomizedText(text: testimonials[index]["job"]!, color: reddish, fontSize: 12, letterSpacing: 3),
                            const SizedBox(height: 10),
                            CustomizedText(text: testimonials[index]["name"]!, color: white, fontSize: 20, fontWeight: FontWeight.bold),
                            const SizedBox(height: 10),
                            CustomizedText(text: testimonials[index]["position"]!, color: grey),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: iconContainerColor,
                                boxShadow: <BoxShadow>[BoxShadow(blurRadius: 5, spreadRadius: 5, color: grey.withOpacity(.05), offset: const Offset(-3, -3))],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  CustomizedText(text: testimonials[index]["todo"]!, fontSize: 25, fontWeight: FontWeight.bold),
                                  const SizedBox(height: 10),
                                  CustomizedText(text: testimonials[index]["period"]!, color: grey),
                                  const SizedBox(height: 10),
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: iconContainerColor,
                                      boxShadow: <BoxShadow>[BoxShadow(blurRadius: 5, spreadRadius: 5, color: grey.withOpacity(.05), offset: const Offset(-3, -3))],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: RatingBar(
                                        allowHalfRating: true,
                                        ignoreGestures: true,
                                        glowColor: yellow,
                                        itemSize: 15,
                                        itemPadding: const EdgeInsets.all(4),
                                        initialRating: double.parse(testimonials[index]["rating"]!),
                                        unratedColor: yellow.withOpacity(.1),
                                        ratingWidget: RatingWidget(
                                          full: const Icon(FontAwesomeIcons.solidStar, color: yellow),
                                          half: const Icon(FontAwesomeIcons.starHalf, color: yellow),
                                          empty: const Icon(FontAwesomeIcons.star, color: yellow),
                                        ),
                                        onRatingUpdate: (double value) => true,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Divider(color: grey.withOpacity(.1), thickness: 1, height: 1, indent: 15, endIndent: 15),
                                  const SizedBox(height: 20),
                                  Flexible(child: SingleChildScrollView(child: CustomizedText(text: testimonials[index]["testimony"]!, fontSize: 18, fontWeight: FontWeight.w600, color: grey))),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ).animate().slide().fade();
              },
            ),
          ),
          const SizedBox(height: 10),
          SmoothPageIndicator(
            controller: _pageController,
            onDotClicked: (int index) => _pageController.animateToPage(index, duration: 300.ms, curve: Curves.linear),
            count: testimonials.length,
            effect: CustomizableEffect(
              dotDecoration: DotDecoration(
                width: 32,
                height: 12,
                color: Colors.indigo,
                rotationAngle: 180,
                verticalOffset: -10,
                borderRadius: BorderRadius.circular(24),
                dotBorder: const DotBorder(padding: 2, width: 2, color: Colors.indigo),
              ),
              activeDotDecoration: const DotDecoration(
                width: 24,
                height: 12,
                color: Colors.grey,
                dotBorder: DotBorder(padding: 2, width: 2, color: Colors.grey),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(2), topRight: Radius.circular(16), bottomLeft: Radius.circular(16), bottomRight: Radius.circular(2)),
                verticalOffset: 0,
              ),
              spacing: 6.0,
              activeColorOverride: (int i) => Colors.primaries[i],
              inActiveColorOverride: (int i) => Colors.primaries[i],
            ),
          ).animate().slide().fade(),
        ],
      ),
    );
  }
}
