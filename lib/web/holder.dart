import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hafedh_gunichi/utils/custom_classes.dart';
import 'package:hafedh_gunichi/utils/global_variables.dart';

class Holder extends StatefulWidget {
  const Holder({super.key});

  @override
  State<Holder> createState() => _HolderState();
}

class _HolderState extends State<Holder> {
  final ScrollController _scrollbar = ScrollController();
  @override
  Widget build(BuildContext context) {
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
                        const CircleAvatar(radius: 20, backgroundColor: backgroundColor, backgroundImage: AssetImage("assets/images/me.jpg")).animate(onComplete: (AnimationController controller) => controller.loop(reverse: true)).shake(duration: 3.seconds, hz: .8),
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
  }
}
