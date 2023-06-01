import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_project_1/home_page.dart';
import 'package:flutter_project_1/page_name.dart';
import 'package:flutter_project_1/pokemon.dart';

import 'detail-page.dart';

void main() => runApp(
      const MyApp(),
    );

//--------------------------------------MY APP------------------------------------------------

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // <== définit le thème Light
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        // <== définit le thème Dark
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
      initialRoute: PageName.home,
      routes: {
        PageName.detail: (context) => const SecondScreen(),
        PageName.home: (context) => const HomePage(),
      },
    );
  }
}
