import 'package:flutter/material.dart';
import 'about/about_page.dart';
import 'contact/contact_page.dart';
import 'destinations/destinations_page.dart';
import 'travel_packages/travel_packages_page.dart';
import 'pages/home/home-page.dart';

void main() => runApp(const ExploreMundoApp());

class ExploreMundoApp extends StatelessWidget {
  const ExploreMundoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Mundo',
      home: const HomePage(),
      
      routes: {
        '/home': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/contact': (context) => const ContactPage(),
        '/destinations': (context) => const DestinationsPage(),
        '/travel_packages': (context) => const TravelPackagesPage(),
      },
    );
  }
}
