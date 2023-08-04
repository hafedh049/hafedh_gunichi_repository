import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hafedh_gunichi/web/education.dart';

const Color backgroundColor = Color.fromRGBO(33, 36, 40, 1);
const Color iconContainerColor = Color.fromRGBO(24, 26, 30, 1);
const Color hoverediconContainerColor = Color.fromRGBO(24, 26, 25, 1);
const Color iconColor = Color.fromRGBO(227, 228, 228, 1);
const Color white = Color.fromARGB(255, 233, 233, 233);
const Color reddish = Color.fromRGBO(255, 1, 79, 1);
const Color grey = Color.fromRGBO(167, 177, 188, 1);
const Color green = Colors.green;

const String description = "I am proficient in Flutter, Django, and Firebase, which gives me the skills to build high-quality, scalable, and reliable mobile and web applications. I have a deep understanding of these technologies and how they can be used to create innovative and user-friendly applications.";

const List<Map<String, dynamic>> features = <Map<String, dynamic>>[
  <String, dynamic>{"icon": FontAwesomeIcons.android, "title": "Mobile Apps", "description": "I can use Flutter's powerful features to create beautiful and engaging user interfaces. I can also use Django and Firebase to build scalable and reliable backend systems."},
  <String, dynamic>{"icon": FontAwesomeIcons.android, "title": "Mobile Apps", "description": "I can use Flutter's powerful features to create beautiful and engaging user interfaces. I can also use Django and Firebase to build scalable and reliable backend systems."},
  <String, dynamic>{"icon": FontAwesomeIcons.android, "title": "Mobile Apps", "description": "I can use Flutter's powerful features to create beautiful and engaging user interfaces. I can also use Django and Firebase to build scalable and reliable backend systems."},
];

const List<Map<String, dynamic>> portfolios = <Map<String, dynamic>>[
  <String, dynamic>{"id": 0, "image": "portfolio-02.jpg", "topic": "APPLICATION", "title": "Food Delivery App", "description": "I can use Flutter's powerful features to create beautiful and engaging user interfaces. I can also use Django and Firebase to build scalable and reliable backend systems."},
  <String, dynamic>{"id": 0, "image": "portfolio-02.jpg", "topic": "APPLICATION", "title": "Food Delivery App", "description": "I can use Flutter's powerful features to create beautiful and engaging user interfaces. I can also use Django and Firebase to build scalable and reliable backend systems."},
  <String, dynamic>{"id": 0, "image": "portfolio-02.jpg", "topic": "APPLICATION", "title": "Food Delivery App", "description": "I can use Flutter's powerful features to create beautiful and engaging user interfaces. I can also use Django and Firebase to build scalable and reliable backend systems."},
  <String, dynamic>{"id": 0, "image": "portfolio-02.jpg", "topic": "APPLICATION", "title": "Food Delivery App", "description": "I can use Flutter's powerful features to create beautiful and engaging user interfaces. I can also use Django and Firebase to build scalable and reliable backend systems."},
  <String, dynamic>{"id": 0, "image": "portfolio-02.jpg", "topic": "APPLICATION", "title": "Food Delivery App", "description": "I can use Flutter's powerful features to create beautiful and engaging user interfaces. I can also use Django and Firebase to build scalable and reliable backend systems."},
  <String, dynamic>{"id": 0, "image": "portfolio-02.jpg", "topic": "APPLICATION", "title": "Food Delivery App", "description": "I can use Flutter's powerful features to create beautiful and engaging user interfaces. I can also use Django and Firebase to build scalable and reliable backend systems."},
  <String, dynamic>{"id": 0, "image": "portfolio-02.jpg", "topic": "APPLICATION", "title": "Food Delivery App", "description": "I can use Flutter's powerful features to create beautiful and engaging user interfaces. I can also use Django and Firebase to build scalable and reliable backend systems."},
  <String, dynamic>{"id": 0, "image": "portfolio-02.jpg", "topic": "APPLICATION", "title": "Food Delivery App", "description": "I can use Flutter's powerful features to create beautiful and engaging user interfaces. I can also use Django and Firebase to build scalable and reliable backend systems."},
];

const List<String> progress = <String>["COMPLETED", "IN PROGRESS"];
final Map<String, Map<String, dynamic>> resumeTabBar = <String, Map<String, dynamic>>{
  "Education": {"state": true, "page": const Education(), "id": 0},
  "Professional Skills": {"state": false, "page": null, "id": 1},
  "Experience": {"state": false, "page": null, "id": 2},
  "Interview": {"state": false, "page": null, "id": 3},
};

const List<Map<String, dynamic>> education = <Map<String, dynamic>>[];
