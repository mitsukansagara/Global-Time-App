import 'package:flutter/material.dart';
import 'package:com/pages/home.dart';
import 'package:com/pages/choose_location.dart';
import 'package:com/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));

