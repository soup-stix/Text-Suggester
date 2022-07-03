import 'package:flutter/material.dart';
import 'package:ds_project/homepage.dart';
import 'package:ds_project/spelling.dart';
import 'package:ds_project/choice.dart';
import 'package:ds_project/plagirism.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    initialRoute: 'choice',
    routes: {
      'homepage':(context) => MyHomepage(),
      'choice':(context) => MyChoice(),
      'spelling':(context) => MySpelling(),
      'plagirism':(context) => MyPlagirism(),

    },
  ));
}