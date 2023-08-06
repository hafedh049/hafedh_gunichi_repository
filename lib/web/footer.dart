import 'package:flutter/material.dart';

import '../utils/global_variables.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        padding: const EdgeInsets.all(48),
        color: backgroundColor,
        child: Center(),
      ),
    );
  }
}
