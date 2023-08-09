import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/custom_classes.dart';
import '../utils/global_variables.dart';

class Testimonail extends StatefulWidget {
  const Testimonail({super.key});

  @override
  State<Testimonail> createState() => _TestimonailState();
}

class _TestimonailState extends State<Testimonail> {
  bool _isHovered = false;
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
          const CustomizedText(text: "WHAT CLIENTS SAY", color: reddish, fontWeight: FontWeight.bold, letterSpacing: 3).animate().slide().fade(),
          const SizedBox(height: 20),
          const CustomizedText(text: "Testimonial", fontSize: 50, fontWeight: FontWeight.bold, letterSpacing: 2).animate().slide().fade(),
          const SizedBox(height: 30),
          Flexible(
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: testimonials.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 450,
                      height: 400,
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
                          Expanded(
                            child: Container(
                              width: 476,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                              child: StatefulBuilder(
                                builder: (BuildContext context, void Function(void Function()) setS) {
                                  return InkWell(
                                    onTap: () => true,
                                    onHover: (bool value) => setS(() => _isHovered = value),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: AnimatedScale(duration: 500.ms, scale: _isHovered ? 1.1 : 1, child: Image.asset("assets/images/${testimonials[index]["image"]!}", fit: BoxFit.cover)),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomizedText(text: testimonials[index]["job"]!, color: reddish, fontSize: 12, letterSpacing: 3),
                          const SizedBox(height: 10),
                          CustomizedText(text: testimonials[index]["name"]!, color: white, fontSize: 20, fontWeight: FontWeight.bold),
                          const SizedBox(height: 10),
                          CustomizedText(text: testimonials[index]["position"]!, color: grey),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    Container(color: hoverediconContainerColor, width: 40, height: 2),
                    SizedBox(
                      height: 400,
                      width: 700,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Image.asset("assets/images/quotes.png", color: iconContainerColor, width: 120, height: 120),
                              const Spacer(),
                              SizedBox(
                                height: 60,
                                width: 122,
                                child: BackAndForth(
                                  back: () => _pageController.previousPage(duration: 300.ms, curve: Curves.linear),
                                  forth: () => _pageController.nextPage(duration: 300.ms, curve: Curves.linear),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
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
                                  Row(
                                    children: <Widget>[
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          CustomizedText(text: testimonials[index]["todo"]!, fontSize: 25, fontWeight: FontWeight.bold),
                                          const SizedBox(height: 10),
                                          CustomizedText(text: testimonials[index]["period"]!, color: grey),
                                        ],
                                      ),
                                      const Spacer(),
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
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Divider(color: grey.withOpacity(.1), thickness: 1, height: 1, indent: 15, endIndent: 15),
                                  const SizedBox(height: 20),
                                  Flexible(child: CustomizedText(text: testimonials[index]["testimony"]!, fontSize: 18, fontWeight: FontWeight.w600, color: grey)),
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
          const SizedBox(height: 30),
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
