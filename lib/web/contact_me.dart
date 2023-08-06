import 'package:flutter/material.dart';

import '../utils/global_variables.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        color: backgroundColor,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[],
            ),
          ],
        ),
      ),
    );
  }
}
