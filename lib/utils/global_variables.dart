import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hafedh_gunichi/web/development_skills_and_frameworks.dart';
import 'package:hafedh_gunichi/web/education.dart';
import 'package:hafedh_gunichi/web/experience.dart';
import 'package:hafedh_gunichi/web/interview.dart';
import 'package:hafedh_gunichi/web/other_skills.dart';
import 'package:hafedh_gunichi/web/professional_skills.dart';

const Color backgroundColor = Color.fromRGBO(33, 36, 40, 1);
const Color iconContainerColor = Color.fromRGBO(24, 26, 30, 1);
const Color hoverediconContainerColor = Color.fromRGBO(24, 26, 25, 1);
const Color iconColor = Color.fromRGBO(227, 228, 228, 1);
const Color white = Color.fromARGB(255, 233, 233, 233);
const Color reddish = Color.fromRGBO(255, 1, 79, 1);
const Color grey = Color.fromRGBO(167, 177, 188, 1);
const Color green = Colors.green;
const Color blue = Colors.blue;

const String description = "I am proficient in Flutter, Django, and Firebase, which gives me the skills to build high-quality, scalable, and reliable mobile and web applications. I have a deep understanding of these technologies and how they can be used to create innovative and user-friendly applications.";

const List<Map<String, dynamic>> features = <Map<String, dynamic>>[
  <String, dynamic>{"icon": FontAwesomeIcons.android, "title": "Mobile Apps", "image": "", "description": "I can use Flutter's powerful features to create beautiful and engaging user interfaces. I can also use Django and Firebase to build scalable and reliable backend systems."},
  <String, dynamic>{"icon": FontAwesomeIcons.android, "title": "Mobile Apps", "image": "", "description": "I can use Flutter's powerful features to create beautiful and engaging user interfaces. I can also use Django and Firebase to build scalable and reliable backend systems."},
  <String, dynamic>{"icon": FontAwesomeIcons.android, "title": "Mobile Apps", "image": "", "description": "I can use Flutter's powerful features to create beautiful and engaging user interfaces. I can also use Django and Firebase to build scalable and reliable backend systems."},
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
  "Professional Skills": {"state": false, "page": const ProfessionalSkills(), "id": 1},
  "Experience": {"state": false, "page": const Experience(), "id": 2},
  "Interview": {"state": false, "page": const Interview(), "id": 3},
};

const List<Map<String, String>> education = <Map<String, String>>[
  <String, String>{
    "title": "Basic Schooling",
    "subtitle": "HAY AL HORRIYA (BOUARGOUB) [2007 - 2013]",
    "state": "PASSED",
    "description": "I attended Hay AL HORRIYA for my basic schooling. I was a bright student and graduated with honors. I am grateful for the foundation that Hay AL HORRIYA gave me, and I am excited to continue my education.",
  },
  <String, String>{
    "title": "Lower Secondary (Collège)",
    "subtitle": "Collège (2013 - 2016)",
    "state": "PASSED",
    "description": "In my lower secondary education. I made some great friends there, and I learned a lot. I moved away after I finished my final year, but I'll never forget my times.",
  },
  <String, String>{
    "title": "Higher Secondary",
    "subtitle": "Lycée Gafsa (2016 - 2018) -> LMSB (2018 - 2020)",
    "state": "PASSED",
    "description": "I studied at Lycée Jelma for my first two years of Upper Secondary Education. I then moved to Lycée Mixte Sidi-Bouzid to complete my last two years and take my Baccalaureate with High Honors as a Computer Science Student. I am grateful for the opportunities that my upper secondary education gave me.",
  },
  <String, String>{
    "title": "University (Bachelor Degree)",
    "subtitle": "ISIMM (2020 - 2023)",
    "state": "PASSED",
    "description": "Graduated with high honors from the Higher Institute of Informatics and Mathematics of Monastir with a specialization of Software Engineering in the Computer Science field. This is a great accomplishment. I'm eager to start their career and make a difference in the world.",
  },
  <String, String>{
    "title": "University (Engineering Degree)",
    "subtitle": "TEK-UP (2023 - 2026)",
    "state": "IN PROGRESS",
    "description": "I am excited to study at TEK-UP University as an engineer in a cloud computing specialty. I know that I will learn a lot and that I will be able to achieve my goals. I am also excited to tackle down many certificates and become a certified cloud computing engineer.",
  },
];

const List<Map<String, String>> experience = <Map<String, String>>[
  <String, String>{
    "title": "End Of Study (PFE Project)",
    "subtitle": "Faculty Of Medecin (MONASTIR) [Feb -> July, 2023]",
    "state": "PASSED",
    "description": "",
  },
  <String, String>{
    "title": "Flutter Developer",
    "subtitle": "ACI (Jun -> July, 2022)",
    "state": "PASSED",
    "description": "",
  },
  <String, String>{
    "title": "Freelance",
    "subtitle": "Fiverr (2020 -> OO)",
    "state": "PASSED",
    "description": "",
  },
];

const List<Map<String, String>> interview = <Map<String, String>>[
  <String, String>{
    "title": "Proxym",
    "subtitle": "Flutter Developer",
    "state": "PENDING",
    "description": "",
  },
  <String, String>{
    "title": "Fiverr",
    "subtitle": "Flutter Expert",
    "state": "PASSED",
    "description": "",
  },
];

const Map<String, double> programmingLanguages = <String, double>{
  "Dart": 95,
  "Python": 95,
  "Mojo": 95,
  "C": 80,
  "JAVA": 83,
  "C# / C++": 60,
  "JavaScript": 70,
  "PHP": 60,
  "Ruby": 20,
  "Swift": 20,
  "Kotlin": 30,
  "Go": 30,
  "SQL": 80,
  "HTML": 80,
};

const Map<String, double> frameworks = <String, double>{
  "Flutter": 95,
  "Django": 75,
  "Flask": 80,
  "Spring Boot": 20,
  "Laravel": 10,
  "Angular": 38,
  "TailWind": 45,
  "Bootstrap": 50,
};

const Map<String, Map<String, dynamic>> baaSs = <String, Map<String, dynamic>>{
  "Firebase": <String, dynamic>{"image": "icons/firebase.png", "description": "Firebase is a set of backend cloud computing services and application development platforms provided by Google. It hosts databases, services, authentication, and integration for a variety of applications, including Android, iOS, JavaScript, Node.js, Java, Unity, PHP, and C++."},
  "Supabase": <String, dynamic>{"image": "", "description": "Supabase is a fully-managed, open-source alternative to Firebase that offers a similar set of features. It is a good option for developers who want a scalable and reliable platform without the need to manage their own infrastructure."},
  "AppWrite": <String, dynamic>{"image": "", "description": "Appwrite is a self-hosted, open-source BaaS platform that offers a wide range of features, including real-time data storage, authentication and authorization, push notifications, and hosting. It is a good option for developers who want more control over their infrastructure."},
};

const Map<String, Map<String, dynamic>> databases = <String, Map<String, dynamic>>{
  "MySQL": <String, dynamic>{"image": "", "description": "MySQL is a relational database management system (RDBMS) that is open-source and free to use. It is one of the most popular databases in the world, and is used by a wide range of applications, including web applications, e-commerce applications, and content management systems."},
  "PostgreSQL": <String, dynamic>{"image": "", "description": "PostgreSQL is another popular RDBMS that is open-source and free to use. It is similar to MySQL, but offers a number of additional features, such as support for JSON data and triggers."},
  "Oracle Database": <String, dynamic>{"image": "", "description": "Oracle Database is a commercial RDBMS that is owned by Oracle Corporation. It is one of the most powerful and scalable databases available, and is used by a wide range of enterprise applications."},
  "Microsoft SQL Server": <String, dynamic>{"image": "", "description": "Microsoft SQL Server is a commercial RDBMS that is owned by Microsoft. It is a popular choice for Windows-based applications, and offers a wide range of features, including support for XML data and replication."},
  "MongoDB": <String, dynamic>{"image": "", "description": "MongoDB is a NoSQL database that is document-oriented. This means that data is stored in JSON documents, which makes it more flexible than traditional RDBMSs. MongoDB is a popular choice for web applications and mobile applications."},
  "Cassandra": <String, dynamic>{"image": "", "description": "Apache Cassandra is a distributed NoSQL database that is designed to be scalable and fault-tolerant. It is a good option for applications that need to be able to handle a lot of data and that need to be able to recover from failures."},
  "Milvus": <String, dynamic>{"image": "", "description": "Milvus is a vector database that is designed to be scalable and efficient. It is a good option for applications that need to be able to store and query large amounts of high-dimensional data."},
  "Neo4j": <String, dynamic>{"image": "", "description": " Neo4j is a graph database that is designed to be able to store and query relationships between data. It is a good option for applications that need to be able to represent and analyze relationships between data."},
};

const Map<String, Map<String, dynamic>> vcs = <String, Map<String, dynamic>>{
  "Git": <String, dynamic>{"image": "", "description": "Git is a distributed version control system that is free and open-source. It is one of the most popular version control systems in the world, and is used by a wide range of developers, including those who work on open-source projects and those who work on commercial projects."},
  "Github": <String, dynamic>{"image": "", "description": "GitHub is a popular cloud-based Git repository hosting service. It offers a wide range of features, including issue tracking, pull requests, and code reviews. GitHub is a good choice for developers who want to collaborate on open-source projects or who want to use a hosted Git service."},
  "BitBucket": <String, dynamic>{"image": "", "description": "Bitbucket is a cloud-based Git repository hosting service that is owned by Atlassian. It offers a wide range of features, including issue tracking, pull requests, and code reviews. Bitbucket is a good choice for developers who want to collaborate on commercial projects or who want a hosted Git service with atlassian integration."},
  "Gitlab": <String, dynamic>{"image": "", "description": "GitLab is a self-hosted Git repository hosting service that offers a wide range of features, including issue tracking, pull requests, and code reviews. GitLab is a good choice for developers who want to self-host their Git repository or who want a more feature-rich Git service than GitHub"},
  "Azure DevOps": <String, dynamic>{"image": "", "description": "Azure DevOps is a cloud-based version control system that is owned by Microsoft. It offers a wide range of features, including issue tracking, pull requests, code reviews, and build automation. Azure DevOps is a good choice for developers who want to use a hosted Git service with Microsoft integration."},
};

const Map<String, Map<String, dynamic>> ides = <String, Map<String, dynamic>>{
  "VS Code": <String, dynamic>{"image": "", "description": "Visual Studio Code is a free and open-source IDE developed by Microsoft. It is a versatile IDE that can be used for a wide range of programming languages, including JavaScript, Python, and C#. Visual Studio Code is known for its lightweight and customizable user interface."},
  "IntelliJ IDEA": <String, dynamic>{"image": "", "description": "IntelliJ IDEA is a commercial IDE developed by JetBrains. It is a popular choice for Java developers, and offers a wide range of features, including code completion, refactoring, and debugging. IntelliJ IDEA is known for its powerful code analysis tools and its intuitive user interface."},
  "PyCharm": <String, dynamic>{"image": "", "description": "PyCharm is a commercial IDE developed by JetBrains. It is a popular choice for Python developers, and offers a wide range of features, including code completion, refactoring, and debugging. PyCharm is known for its powerful code analysis tools and its intuitive user interface"},
  "Eclipse": <String, dynamic>{"image": "", "description": "Eclipse is a free and open-source IDE developed by the Eclipse Foundation. It is a popular choice for Java developers, and offers a wide range of features, including code completion, refactoring, and debugging. Eclipse is known for its extensible architecture and its large community of plugins"},
  "Sublime Text": <String, dynamic>{"image": "", "description": "Sublime Text is a proprietary IDE developed by Sublime HQ. It is a popular choice for a wide range of programming languages, and offers a wide range of features, including code completion, refactoring, and debugging. Sublime Text is known for its customizability and its speed."},
  "Atom": <String, dynamic>{"image": "", "description": "Atom is a free and open-source IDE developed by GitHub. It is a popular choice for a wide range of programming languages, and offers a wide range of features, including code completion, refactoring, and debugging. Atom is known for its hackable nature and its large community of plugins."},
  "Vim": <String, dynamic>{"image": "", "description": "Vim is a free and open-source text editor developed by Bram Moolenaar. It is a popular choice for a wide range of programming languages, and offers a wide range of features, including syntax highlighting, code folding, and debugging. Vim is known for its power and its flexibility."},
};

const Map<String, Map<String, dynamic>> gamesAndPhysicsEngines = <String, Map<String, dynamic>>{
  "Unity": <String, dynamic>{"image": "", "description": "Unity is a popular game engine that is used to create 2D and 3D games. It is a popular choice for indie developers and AAA studios alike. Unity is known for its ease of use, its powerful features, and its large community of developers."},
  "Unreal Engine": <String, dynamic>{"image": "", "description": "Unreal Engine is a popular game engine that is used to create 3D games. It is a popular choice for AAA studios, and is known for its high-quality graphics and its powerful physics engine. Unreal Engine is also used to create real-time cinematics and simulations."},
  "Flame": <String, dynamic>{"image": "", "description": "Flame is a modular Flutter game engine that provides a complete set of out-of-the-way solutions for games. It takes advantage of the powerful infrastructure provided by Flutter but simplifies the code you need to build your projects."},
  "Panda3D": <String, dynamic>{"image": "", "description": "Panda3D is a game engine that includes graphics, audio, I/O, collision detection, and other abilities relevant to the creation of 3D games. Panda3D is free, open-source software under the revised BSD license. Panda3D's intended game-development language is Python"},
  "Pymunk": <String, dynamic>{"image": "", "description": "Pymunk is an easy-to-use pythonic 2d physics library that can be used whenever you need 2d rigid body physics from Python. Perfect when you need 2d physics in your game, demo or simulation! It is built on top of the very capable 2d physics library Chipmunk."},
  "Havok": <String, dynamic>{"image": "", "description": "Havok is a physics engine that is developed by Havok. It is used in a variety of games, including Grand Theft Auto and The Elder Scrolls. Havok is known for its realism and its ability to handle large numbers of objects."},
  "Bullet": <String, dynamic>{"image": "", "description": "Bullet is a popular physics engine that is used in a variety of games, including Unity and Unreal Engine. It is known for its accuracy and performance."},
  "PhysX": <String, dynamic>{"image": "", "description": "PhysX is a physics engine that is developed by NVIDIA. It is used in a variety of games, including Call of Duty and Battlefield. PhysX is known for its power and its ability to handle complex physics simulations."},
};

const Map<String, Map<String, dynamic>> buildAutomationTools = <String, Map<String, dynamic>>{
  "Maven": <String, dynamic>{"image": "", "description": "Maven is an open-source build automation tool that is based on the Java language. Maven is known for its simplicity and its ability to be used with a variety of projects."},
  "Gradle": <String, dynamic>{"image": "", "description": "Gradle is an open-source build automation tool that is based on the Groovy language. Gradle is known for its powerful features and its ability to be used with a variety of programming languages."},
  "Jenkins": <String, dynamic>{"image": "", "description": "Jenkins is an open-source automation server that can be used to automate a wide range of tasks, including building, testing, and deploying software. Jenkins is known for its flexibility and its large community of plugins."},
};

const Map<String, Map<String, dynamic>> testTools = <String, Map<String, dynamic>>{
  "JUnit": <String, dynamic>{"image": "", "description": "JUnit is a unit testing framework for Java. It is a popular choice for testing Java applications."},
  "Pytest": <String, dynamic>{"image": "", "description": "Pytest is a unit testing framework for Python. It is a popular choice for unit testing Python applications"},
  "Selenium": <String, dynamic>{"image": "", "description": "Selenium is a suite of tools that can be used to automate web browser testing. It is a popular choice for testing web applications."},
  "Postman": <String, dynamic>{"image": "", "description": "Postman is a tool for API testing. It is a popular choice for testing APIs."},
};

const Map<String, Map<String, dynamic>> solutionsDeployment = <String, Map<String, dynamic>>{
  "Docker Swarm": <String, dynamic>{"image": "", "description": "Docker Swarm is a container orchestration system that is built on top of Docker. It is used to automate the deployment, scaling, and management of Docker containers."},
  "Kubernetes": <String, dynamic>{"image": "", "description": " Kubernetes is an open-source container orchestration system. It is used to automate the deployment, scaling, and management of containerized applications."},
};

const Map<String, Map<String, dynamic>> designTools = <String, Map<String, dynamic>>{
  "Manim": <String, dynamic>{"image": "", "description": "A community maintained Python library for creating mathematical animations."},
  "Adobe AE": <String, dynamic>{"image": "", "description": "Adobe After Effects is a digital visual effects, motion graphics, and compositing application developed by Adobe Inc.; it is used in the post-production process of film making, video games and television production. Among other things, After Effects can be used for keying, tracking, compositing, and animation."},
  "Adobe PS": <String, dynamic>{"image": "", "description": "Adobe Photoshop is a raster graphics editor developed and published by Adobe Inc. for Windows and macOS. It was originally created in 1987 by Thomas and John Knoll. Since then, the software has become the most used tool for professional digital art, especially in raster graphics editing."},
  "Figma": <String, dynamic>{"image": "", "description": "Figma is a collaborative web application for interface design, with additional offline features enabled by desktop applications for macOS and Windows."},
};

const Map<String, Map<String, dynamic>> osAndDistributions = <String, Map<String, dynamic>>{
  "Windows": <String, dynamic>{"image": "", "description": "Microsoft Windows is a group of several proprietary graphical operating system families developed and marketed by Microsoft. Each family caters to a certain sector of the computing industry. For example, Windows NT for consumers, Windows Server for servers, and Windows IoT for embedded systems."},
  "Kali Linux": <String, dynamic>{"image": "", "description": "Kali Linux is a Debian-derived Linux distribution designed for digital forensics and penetration testing. It is maintained and funded by Offensive Security."},
  "Ubuntu": <String, dynamic>{"image": "", "description": "Ubuntu is a Linux distribution based on Debian and composed mostly of free and open-source software. Ubuntu is officially released in three editions: Desktop, Server, and Core for Internet of things devices and robots. All of the editions can run on a computer alone, or in a virtual machine."},
  "Cent-OS": <String, dynamic>{"image": "", "description": "CentOS is a discontinued Linux distribution that provided a free and open-source community-supported computing platform, functionally compatible with its upstream source, Red Hat Enterprise Linux."},
  "MacOS Big Sur": <String, dynamic>{"image": "", "description": "macOS Big Sur is the seventeenth major release of macOS, Apple Inc.'s operating system for Macintosh computers. It was announced at Apple's Worldwide Developers Conference on June 22, 2020, and was released to the public on November 12, 2020."},
};

const Map<String, Map<String, dynamic>> electronics = <String, Map<String, dynamic>>{
  "Raspberry Pi": <String, dynamic>{"image": "", "description": "Raspberry Pi is a series of small single-board computers developed in the United Kingdom by the Raspberry Pi Foundation in association with Broadcom. The Raspberry Pi project originally leaned toward the promotion of teaching basic computer science in schools."},
  "Arduino": <String, dynamic>{"image": "", "description": "Arduino is an open-source hardware and software company, project, and user community that designs and manufactures single-board microcontrollers and microcontroller kits for building digital devices."},
};

const Map<String, Map<String, dynamic>> interestedTopics = <String, Map<String, dynamic>>{
  "Cloud & IOT": <String, dynamic>{"image": "", "description": "macOS Big Sur is the seventeenth major release of macOS, Apple Inc.'s operating system for Macintosh computers. It was announced at Apple's Worldwide Developers Conference on June 22, 2020, and was released to the public on November 12, 2020."},
  "Data Science & AI": <String, dynamic>{"image": "", "description": "macOS Big Sur is the seventeenth major release of macOS, Apple Inc.'s operating system for Macintosh computers. It was announced at Apple's Worldwide Developers Conference on June 22, 2020, and was released to the public on November 12, 2020."},
  "Cyber Security": <String, dynamic>{"image": "", "description": "macOS Big Sur is the seventeenth major release of macOS, Apple Inc.'s operating system for Macintosh computers. It was announced at Apple's Worldwide Developers Conference on June 22, 2020, and was released to the public on November 12, 2020."},
  "Web 3.0, Blockchain & Metaverse": <String, dynamic>{"image": "", "description": "macOS Big Sur is the seventeenth major release of macOS, Apple Inc.'s operating system for Macintosh computers. It was announced at Apple's Worldwide Developers Conference on June 22, 2020, and was released to the public on November 12, 2020."},
};

const List<Widget> professionalSkills = <Widget>[
  DevelopmentSkillsAndFrameworks(),
  OtherSkills(data: baaSs),
  OtherSkills(data: databases),
  OtherSkills(data: vcs),
  OtherSkills(data: ides),
  OtherSkills(data: gamesAndPhysicsEngines),
  OtherSkills(data: buildAutomationTools),
  OtherSkills(data: testTools),
  OtherSkills(data: solutionsDeployment),
  OtherSkills(data: designTools),
  OtherSkills(data: osAndDistributions),
  OtherSkills(data: electronics),
  OtherSkills(data: interestedTopics),
];
