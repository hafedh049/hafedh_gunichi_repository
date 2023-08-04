import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hafedh_gunichi/utils/global_variables.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CustomizedText extends StatelessWidget {
  const CustomizedText({super.key, required this.text, this.fontSize = 14, this.fontWeight = FontWeight.normal, this.color = Colors.white, this.letterSpacing = 1});
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double letterSpacing;
  @override
  Widget build(BuildContext context) {
    return Text(text, overflow: TextOverflow.fade, style: GoogleFonts.roboto(fontSize: fontSize, letterSpacing: letterSpacing, fontWeight: fontWeight, color: color));
  }
}

class IconGlass extends StatefulWidget {
  const IconGlass({super.key, required this.icon, this.image, this.url});
  final String? url;
  final IconData icon;
  final String? image;
  @override
  State<IconGlass> createState() => _IconGlassState();
}

class _IconGlassState extends State<IconGlass> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (bool value) => setState(() => _isHovered = value),
      onTap: () async => widget.url != null ? await launchUrlString(widget.url!) : null,
      child: AnimatedContainer(
        duration: 100.ms,
        margin: EdgeInsets.only(bottom: _isHovered ? 3 : 0),
        decoration: BoxDecoration(
          color: _isHovered ? hoverediconContainerColor : iconContainerColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: <BoxShadow>[BoxShadow(blurRadius: 5, spreadRadius: 5, color: grey.withOpacity(.05), offset: const Offset(-3, -3))],
        ),
        padding: const EdgeInsets.all(12),
        child: widget.image != null ? Image.asset("assets/icons/${widget.image}", width: 25, height: 25) : FaIcon(widget.icon, color: _isHovered ? white : iconColor),
      ),
    );
  }
}

class FeatureGlassContainer extends StatefulWidget {
  const FeatureGlassContainer({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  State<FeatureGlassContainer> createState() => _FeatureGlassContainerState();
}

class _FeatureGlassContainerState extends State<FeatureGlassContainer> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (bool value) => setState(() => _isHovered = value),
      onTap: () async => true,
      child: AnimatedContainer(
        duration: 100.ms,
        width: 500,
        margin: EdgeInsets.only(bottom: _isHovered ? 3 : 0),
        decoration: BoxDecoration(
          color: _isHovered ? hoverediconContainerColor : iconContainerColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: <BoxShadow>[BoxShadow(blurRadius: 5, spreadRadius: 5, color: grey.withOpacity(.05), offset: const Offset(-3, -3))],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(widget.data["icon"], size: 50, color: reddish),
            const SizedBox(height: 20),
            CustomizedText(text: widget.data["title"], color: grey, fontSize: 20, fontWeight: FontWeight.bold),
            const SizedBox(height: 20),
            CustomizedText(text: widget.data["description"], color: grey),
            const SizedBox(height: 20),
            AnimatedOpacity(
              duration: 100.ms,
              opacity: _isHovered ? 1 : 0,
              child: Visibility(
                visible: _isHovered ? true : false,
                child: const Icon(FontAwesomeIcons.chevronRight, size: 30, color: reddish),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PorfolioGlass extends StatefulWidget {
  const PorfolioGlass({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  State<PorfolioGlass> createState() => _PorfolioGlassState();
}

class _PorfolioGlassState extends State<PorfolioGlass> {
  bool _isHovered = false;
  bool _heartHovered = false;
  bool _titleHovered = false;
  final String _progress = progress[Random().nextInt(2)];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (bool value) => setState(() => _isHovered = value),
      onTap: () async => await showDialog(
        context: context,
        builder: (BuildContext context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: AlertDialog(
            shadowColor: grey,
            icon: Align(
              alignment: AlignmentDirectional.topEnd,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: const BoxDecoration(color: hoverediconContainerColor, shape: BoxShape.circle),
                  padding: const EdgeInsets.all(12),
                  child: const Icon(FontAwesomeIcons.x, color: white, size: 20),
                ),
              ),
            ),
            backgroundColor: backgroundColor,
            content: SizedBox(
              width: MediaQuery.sizeOf(context).width * .7,
              height: MediaQuery.sizeOf(context).height * .5,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: AssetImage("assets/images/${widget.data['image']}"), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CustomizedText(text: "Featured - ${widget.data['topic']}", color: grey, fontSize: 16, fontWeight: FontWeight.w500),
                        const SizedBox(height: 20),
                        CustomizedText(text: "${widget.data['title']}.", fontWeight: FontWeight.bold, fontSize: 25),
                        const SizedBox(height: 20),
                        CustomizedText(text: widget.data['description'], color: grey),
                        const SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(color: hoverediconContainerColor, borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.all(12),
                              child: const Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    CustomizedText(text: "LIKE THIS", color: reddish, fontWeight: FontWeight.bold),
                                    SizedBox(width: 5),
                                    Icon(FontAwesomeIcons.thumbsUp, color: reddish, size: 15),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 30),
                            Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(color: hoverediconContainerColor, borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.all(8),
                              child: const Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    CustomizedText(text: "VIEW PROJECT", color: reddish, fontWeight: FontWeight.bold),
                                    Icon(FontAwesomeIcons.chevronRight, color: reddish, size: 15),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      child: AnimatedContainer(
        duration: 100.ms,
        width: 400,
        height: 450,
        decoration: BoxDecoration(
          color: _isHovered ? hoverediconContainerColor : iconContainerColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: <BoxShadow>[BoxShadow(blurRadius: 5, spreadRadius: 5, color: grey.withOpacity(.05), offset: const Offset(-3, -3))],
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AnimatedScale(duration: 500.ms, scale: _isHovered ? 1.1 : 1, child: Image.asset("assets/images/${widget.data['image']}", fit: BoxFit.cover)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                CustomizedText(text: widget.data["topic"], color: reddish, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 2),
                const Spacer(),
                Row(
                  children: <Widget>[
                    StatefulBuilder(
                      builder: (BuildContext context, void Function(void Function()) _) {
                        return InkWell(
                          onHover: (bool value) => _(() => _heartHovered = value),
                          onTap: () => 1,
                          child: Icon(FontAwesomeIcons.heart, size: 15, color: _heartHovered ? reddish : grey),
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    const CustomizedText(text: "600", color: grey, fontSize: 16, fontWeight: FontWeight.w500),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            StatefulBuilder(
              builder: (BuildContext context, void Function(void Function()) _) {
                return InkWell(
                  onHover: (bool value) => _(() => _titleHovered = value),
                  onTap: () => 1,
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: <Widget>[
                      for (final String text in widget.data["title"].split(" ")) CustomizedText(text: text, color: _titleHovered ? reddish : grey, fontSize: 25, fontWeight: FontWeight.bold),
                      AnimatedOpacity(
                        duration: 300.ms,
                        opacity: _titleHovered ? 1 : 0,
                        child: const Icon(FontAwesomeIcons.squareArrowUpRight, size: 30, color: reddish),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                const Spacer(),
                Container(
                  decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(3), border: Border.all(color: grey, width: .1)),
                  padding: const EdgeInsets.all(8),
                  child: CustomizedText(text: _progress, color: _progress == "COMPLETED" ? green : reddish, fontWeight: FontWeight.bold),
                ).animate(onComplete: (AnimationController controller) => controller.repeat(reverse: true)).shimmer(duration: 3.seconds, color: grey.withOpacity(.2), colors: <Color>[grey.withOpacity(.1), white.withOpacity(.2)]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ResumeTab extends StatefulWidget {
  const ResumeTab({super.key, required this.tab, required this.selected, required this.func});
  final String tab;
  final void Function() func;
  final bool selected;
  @override
  State<ResumeTab> createState() => _ResumeTabState();
}

class _ResumeTabState extends State<ResumeTab> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (bool value) => widget.selected ? _isHovered = false : setState(() => _isHovered = value),
      onTap: widget.func,
      child: widget.selected
          ? Container(
              decoration: BoxDecoration(
                color: hoverediconContainerColor,
                borderRadius: BorderRadius.circular(5),
                boxShadow: <BoxShadow>[BoxShadow(blurRadius: 5, spreadRadius: 5, color: grey.withOpacity(.05), offset: const Offset(-3, -3))],
              ),
              padding: const EdgeInsets.all(12),
              child: Center(child: CustomizedText(text: widget.tab, color: reddish, fontSize: 25, letterSpacing: 2)),
            )
          : AnimatedSwitcher(
              duration: 300.ms,
              child: _isHovered
                  ? AnimatedScale(
                      duration: 300.ms,
                      scale: _isHovered ? 1.01 : 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: hoverediconContainerColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: <BoxShadow>[BoxShadow(blurRadius: 5, spreadRadius: 5, color: grey.withOpacity(.05), offset: const Offset(-3, -3))],
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Center(child: CustomizedText(text: widget.tab, color: reddish, fontSize: 25, letterSpacing: 2)),
                      ),
                    )
                  : Center(child: CustomizedText(text: widget.tab, color: white, fontSize: 25, letterSpacing: 2)),
            ),
    );
  }
}

class EducationGlass extends StatefulWidget {
  const EducationGlass({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  State<EducationGlass> createState() => _EducationGlassState();
}

class _EducationGlassState extends State<EducationGlass> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (bool value) => setState(() => _isHovered = value),
      onTap: () => true,
      child: AnimatedScale(
        duration: 300.ms,
        scale: _isHovered ? 1.01 : 1,
        child: AnimatedContainer(
          duration: 100.ms,
          width: 300,
          height: 250,
          decoration: BoxDecoration(
            color: _isHovered ? hoverediconContainerColor : iconContainerColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: <BoxShadow>[BoxShadow(blurRadius: 5, spreadRadius: 5, color: grey.withOpacity(.05), offset: const Offset(-3, -3))],
          ),
          padding: const EdgeInsets.all(24),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
