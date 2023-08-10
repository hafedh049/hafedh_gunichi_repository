// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
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
      child: AnimatedScale(
        duration: 100.ms,
        scale: _isHovered ? 1.1 : 1,
        child: AnimatedContainer(
          duration: 100.ms,
          decoration: BoxDecoration(
            color: _isHovered ? hoverediconContainerColor : iconContainerColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: <BoxShadow>[BoxShadow(blurRadius: 5, spreadRadius: 5, color: grey.withOpacity(.05), offset: const Offset(-3, -3))],
          ),
          padding: const EdgeInsets.all(12),
          child: widget.image != null
              ? widget.image!.endsWith(".svg")
                  ? SvgPicture.asset("assets/svgs/${widget.image}", color: !_isHovered ? white : reddish, width: 25, height: 25)
                  : Image.asset("assets/icons/${widget.image}", color: !_isHovered ? null : reddish, width: 25, height: 25)
              : FaIcon(widget.icon, color: !_isHovered ? white : reddish),
        ),
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
              duration: 300.ms,
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
  final GlobalKey _likesKey = GlobalKey();
  bool _isHovered = false;
  bool _heartHovered = false;
  bool _titleHovered = false;
  bool _isLiked = false;
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
              child: MediaQuery.sizeOf(context).width < 1320
                  ? Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(image: AssetImage("assets/images/${widget.data['image']}"), fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                CustomizedText(text: "Featured - ${widget.data['topic']}", color: grey, fontSize: 16, fontWeight: FontWeight.w500),
                                const SizedBox(height: 20),
                                CustomizedText(text: "${widget.data['title']}.", fontWeight: FontWeight.bold, fontSize: 25),
                                const SizedBox(height: 20),
                                Flexible(child: SingleChildScrollView(child: CustomizedText(text: widget.data['description'], color: grey))),
                                const SizedBox(height: 10),
                                Center(
                                  child: Container(
                                    width: 150,
                                    height: 50,
                                    decoration: BoxDecoration(color: hoverediconContainerColor, borderRadius: BorderRadius.circular(5)),
                                    padding: const EdgeInsets.all(12),
                                    child: Center(
                                      child: StatefulBuilder(
                                        builder: (BuildContext context, void Function(void Function()) _) {
                                          return GestureDetector(
                                            onTap: () {
                                              _(() => _isLiked = !_isLiked);
                                              widget.data['i like it'] = _isLiked;
                                              widget.data['likes'] += _isLiked ? 1 : -1;
                                              _likesKey.currentState!.setState(() {});
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                CustomizedText(text: _isLiked ? "LIKED" : "LIKE THIS", color: _isLiked ? green : reddish, fontWeight: FontWeight.bold),
                                                const SizedBox(width: 5),
                                                Icon(_isLiked ? FontAwesomeIcons.check : FontAwesomeIcons.thumbsUp, color: _isLiked ? green : reddish, size: 15),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: GestureDetector(
                                    onTap: () => launchUrlString(widget.data['url']),
                                    child: Container(
                                      width: 150,
                                      height: 50,
                                      decoration: BoxDecoration(color: hoverediconContainerColor, borderRadius: BorderRadius.circular(5)),
                                      padding: const EdgeInsets.all(8),
                                      child: const Center(
                                        child: CustomizedText(text: "VIEW PROJECT", color: reddish, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
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
                              Flexible(child: SingleChildScrollView(child: CustomizedText(text: widget.data['description'], color: grey))),
                              const SizedBox(height: 20),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 150,
                                    height: 50,
                                    decoration: BoxDecoration(color: hoverediconContainerColor, borderRadius: BorderRadius.circular(5)),
                                    padding: const EdgeInsets.all(12),
                                    child: Center(
                                      child: StatefulBuilder(
                                        builder: (BuildContext context, void Function(void Function()) _) {
                                          return GestureDetector(
                                            onTap: () {
                                              _(() => _isLiked = !_isLiked);
                                              widget.data['i like it'] = _isLiked;
                                              widget.data['likes'] += _isLiked ? 1 : -1;
                                              _likesKey.currentState!.setState(() {});
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                CustomizedText(text: _isLiked ? "LIKED" : "LIKE THIS", color: _isLiked ? green : reddish, fontWeight: FontWeight.bold),
                                                const SizedBox(width: 5),
                                                Icon(_isLiked ? FontAwesomeIcons.check : FontAwesomeIcons.thumbsUp, color: _isLiked ? green : reddish, size: 15),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 30),
                                  GestureDetector(
                                    onTap: () => launchUrlString(widget.data['url']),
                                    child: Container(
                                      width: 150,
                                      height: 50,
                                      decoration: BoxDecoration(color: hoverediconContainerColor, borderRadius: BorderRadius.circular(5)),
                                      padding: const EdgeInsets.all(8),
                                      child: const Center(
                                        child: CustomizedText(text: "VIEW PROJECT", color: reddish, fontWeight: FontWeight.bold),
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
                width: 352,
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
                    StatefulBuilder(
                      key: _likesKey,
                      builder: (BuildContext context, void Function(void Function()) _) {
                        return CustomizedText(text: widget.data["likes"].toString(), color: grey, fontSize: 16, fontWeight: FontWeight.w500);
                      },
                    ),
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
                  child: CustomizedText(text: widget.data["completed"] ? "COMPLETED" : "IN PROGRESS", color: widget.data["completed"] ? green : reddish, fontWeight: FontWeight.bold),
                ).animate(onComplete: (AnimationController controller) => controller.repeat(reverse: true)).shimmer(duration: 3.seconds, color: grey.withOpacity(.2), colors: <Color>[grey.withOpacity(.1), white.withOpacity(.2)]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Tabulation extends StatefulWidget {
  const Tabulation({super.key, required this.tab, required this.selected, required this.func});
  final String tab;
  final void Function() func;
  final bool selected;
  @override
  State<Tabulation> createState() => _TabulationState();
}

class _TabulationState extends State<Tabulation> {
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
              child: Center(child: CustomizedText(text: widget.tab, color: reddish, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2)),
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
                        child: Center(child: CustomizedText(text: widget.tab, color: reddish, fontWeight: _isHovered ? FontWeight.bold : FontWeight.normal, fontSize: 20, letterSpacing: 2)),
                      ),
                    )
                  : Center(child: CustomizedText(text: widget.tab, color: white, fontSize: 20, letterSpacing: 2)),
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
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Row(
        children: <Widget>[
          Container(color: grey, width: 20, height: 1),
          const SizedBox(width: 20),
          InkWell(
            onHover: (bool value) => setState(() => _isHovered = value),
            onTap: () => true,
            child: AnimatedScale(
              duration: 300.ms,
              scale: _isHovered ? 1.01 : 1,
              child: AnimatedContainer(
                duration: 100.ms,
                width: 500,
                height: 300,
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
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            CustomizedText(text: widget.data["title"], color: white, fontSize: 20),
                            const SizedBox(height: 10),
                            CustomizedText(text: widget.data["subtitle"], color: grey),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(3), border: Border.all(color: grey, width: .1)),
                          padding: const EdgeInsets.all(8),
                          child: CustomizedText(text: widget.data["state"], color: widget.data["state"] == "PASSED" ? green : blue, fontWeight: FontWeight.bold),
                        ).animate(onComplete: (AnimationController controller) => controller.repeat(reverse: true)).shimmer(duration: 3.seconds, color: grey.withOpacity(.2), colors: <Color>[grey.withOpacity(.1), white.withOpacity(.2)]),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(indent: 15, endIndent: 15, color: grey, height: .3, thickness: .3),
                    const SizedBox(height: 20),
                    Flexible(child: SingleChildScrollView(child: CustomizedText(text: widget.data["description"], color: grey, fontSize: 16))),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SkillGlass extends StatefulWidget {
  const SkillGlass({super.key, required this.data, required this.title});
  final Map<String, dynamic> data;
  final String title;
  @override
  State<SkillGlass> createState() => _SkillGlassState();
}

class _SkillGlassState extends State<SkillGlass> {
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
        padding: const EdgeInsets.all(24),
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[BoxShadow(blurRadius: 5, spreadRadius: 5, color: grey.withOpacity(.05), offset: const Offset(-3, -3))],
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: AssetImage("assets/${widget.data['image']}"), fit: BoxFit.contain),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomizedText(text: widget.title, color: grey, fontSize: 20, fontWeight: FontWeight.bold),
                  const SizedBox(height: 20),
                  CustomizedText(text: widget.data["description"], color: grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackAndForth extends StatefulWidget {
  const BackAndForth({super.key, required this.back, required this.forth});
  final void Function() back;
  final void Function() forth;

  @override
  State<BackAndForth> createState() => _BackAndForthState();
}

class _BackAndForthState extends State<BackAndForth> {
  bool _isBackHovered = false;
  bool _isForthHovered = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        InkWell(
          onTap: widget.back,
          onHover: (bool value) => setState(() => _isBackHovered = value),
          child: AnimatedContainer(
            duration: 300.ms,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: _isBackHovered ? iconContainerColor : hoverediconContainerColor,
              boxShadow: <BoxShadow>[BoxShadow(blurRadius: 5, spreadRadius: 5, color: grey.withOpacity(.05), offset: const Offset(-3, -3))],
            ),
            child: Center(child: Icon(FontAwesomeIcons.chevronLeft, size: 35, color: _isBackHovered ? reddish : grey)),
          ),
        ),
        const SizedBox(width: 20),
        InkWell(
          onTap: widget.forth,
          onHover: (bool value) => setState(() => _isForthHovered = value),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: _isForthHovered ? iconContainerColor : hoverediconContainerColor,
              boxShadow: <BoxShadow>[BoxShadow(blurRadius: 5, spreadRadius: 5, color: grey.withOpacity(.05), offset: const Offset(-3, -3))],
            ),
            child: Center(child: Icon(FontAwesomeIcons.chevronRight, size: 35, color: _isForthHovered ? reddish : grey)),
          ),
        ),
      ],
    );
  }
}
