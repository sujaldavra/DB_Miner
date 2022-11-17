import 'package:flutter/material.dart';
import 'package:flutter_app/Screen/HomePage.dart';
import 'package:flutter_app/Screen/Splash_screen.dart';
import 'package:flutter_app/Screen/catagory_page.dart';
import 'package:flutter_app/Screen/details_page.dart';
import 'package:flutter_app/Screen/quouts_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash_screen',
      routes: {
        'splash_screen': (context) => const SplashScreen(),
        '/': (context) => const HomePage(),
        'details_page': (context) => const DetailsPage(),
        'category_or_author_page': (context) => const CategoryOrAuthorPage(),
        'quotes_page': (context) => const QuotesPage(),
      },
    ),
  );
}
