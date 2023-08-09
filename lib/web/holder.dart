import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:hafedh_gunichi/utils/custom_classes.dart';
import 'package:hafedh_gunichi/utils/global_variables.dart';

class Holder extends StatefulWidget {
  const Holder({super.key});

  @override
  State<Holder> createState() => _HolderState();
}

class _HolderState extends State<Holder> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  final ScrollController _scrollbar = ScrollController();
  bool _menuIsOpen = false;
  final GlobalKey<SliderDrawerState> _drawerKey = GlobalKey<SliderDrawerState>();
  bool _isHovered = false;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: 1.seconds);
    super.initState();
  }

  @override
  void dispose() {
    _scrollbar.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
          //1025 , 790
          if (constraint.maxHeight >= 790 && constraint.maxWidth >= 1320) {
            return Scaffold(
              backgroundColor: backgroundColor,
              body: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView.separated(
                          controller: _scrollbar,
                          padding: EdgeInsets.zero,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) => screens[index]["screen"],
                          separatorBuilder: (BuildContext _, int $) => Center(child: Container(width: MediaQuery.sizeOf(context).width * .8, height: .5, color: grey)),
                          itemCount: screens.length,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(color: hoverediconContainerColor.withOpacity(.4)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 48),
                    child: StatefulBuilder(
                      builder: (BuildContext context, void Function(void Function()) _) {
                        return Row(
                          children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const CircleAvatar(radius: 20, backgroundColor: backgroundColor, backgroundImage: AssetImage("assets/images/me.jpg")),
                                const SizedBox(width: 10),
                                const CustomizedText(text: "HAFEDH GUNICHI", color: white, fontWeight: FontWeight.bold, letterSpacing: 3).animate(onComplete: (AnimationController controller) => controller.loop(reverse: true)).shimmer(color: white, colors: <Color>[grey, white.withOpacity(.001)], duration: 3.seconds),
                              ],
                            ),
                            const Spacer(),
                            for (final Map<String, dynamic> item in screens.sublist(0, screens.length - 1))
                              InkWell(
                                onHover: (bool value) => _(() => item["state"] = value),
                                onTap: () {
                                  _scrollbar.animateTo(MediaQuery.sizeOf(context).height * screens.indexOf(item), duration: 500.ms, curve: Curves.linear);
                                  for (final Map<String, dynamic> map in screens) {
                                    map["clicked"] = false;
                                  }
                                  _(() => item["clicked"] = true);
                                },
                                child: Container(
                                  height: 80,
                                  margin: const EdgeInsets.only(left: 20),
                                  child: Center(
                                    child: CustomizedText(
                                      text: item["title"],
                                      color: item["clicked"]
                                          ? reddish
                                          : item["state"]
                                              ? white
                                              : grey,
                                      fontSize: item["clicked"] ? 18 : 16,
                                      fontWeight: item["clicked"] || item["state"] ? FontWeight.bold : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: backgroundColor,
              body: SliderDrawer(
                appBar: null,
                key: _drawerKey,
                slider: Container(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Center(child: CircleAvatar(radius: 30, backgroundColor: backgroundColor, backgroundImage: AssetImage("assets/images/me.jpg"))),
                      const SizedBox(height: 20),
                      const Center(child: CustomizedText(text: "Hafedh GUNICHI", color: white, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 2)),
                      const SizedBox(height: 20),
                      for (final Map<String, dynamic> item in screensMob.sublist(0, screensMob.length - 1))
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(backgroundColor: backgroundColor, backgroundImage: AssetImage("assets/icons/${item['icon']}"), radius: 20),
                              const SizedBox(width: 10),
                              CustomizedText(text: item['title'], color: white, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 2),
                            ],
                          ),
                        ),
                      const Spacer(),
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
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView.separated(
                            controller: _scrollbar,
                            padding: EdgeInsets.zero,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) => screensMob[index]["screen"],
                            separatorBuilder: (BuildContext _, int $) => Center(child: Container(width: MediaQuery.sizeOf(context).width * .6, height: .2, color: grey)),
                            itemCount: screensMob.length,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      splashColor: backgroundColor,
                      onPressed: () {
                        _menuIsOpen = !_menuIsOpen;
                        if (_menuIsOpen) {
                          _animationController.forward();
                          _drawerKey.currentState!.openSlider();
                        } else {
                          _animationController.reverse();
                          _drawerKey.currentState!.closeSlider();
                        }
                      },
                      icon: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: _animationController, color: reddish, size: 35),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
