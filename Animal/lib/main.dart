import 'package:flutter/material.dart';
import 'package:flutter_app/screens/HomePage1.dart';
import 'package:flutter_app/screens/HomePage2.dart';
import 'package:flutter_app/screens/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'HomePage1',
      routes: {
        '/': (context) => const HomePage(),
        'HomePage1': (context) => const HomePage1(),
        'HomePage2': (context) => const HomePage2(),
      },
    ),
  );
}
