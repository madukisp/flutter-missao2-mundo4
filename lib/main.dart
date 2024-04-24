// main.dart

import 'package:flutter/material.dart';
import 'pages/about/about_page.dart';
import 'pages/contact/contact_page.dart';
import 'pages/destinations/destinations_page.dart';
import 'pages/travel_packages/travel_packages_page.dart';
import 'pages/home/home-page.dart';
import 'widgets/custom_drawer.dart';

void main() => runApp(ExploreMundoApp());

class ExploreMundoApp extends StatelessWidget {
  ExploreMundoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
        ),
      ),
      home: MainScreen(),
      routes: {
        '/home': (context) => Scaffold(
          appBar: AppBar(
            title: Text('Explore Mundo'),
          ),
          drawer: CustomDrawer(),
          body: HomePage(),
        ),
        '/about': (context) => Scaffold(
          appBar: AppBar(
            title: Text('About'),
          ),
          drawer: CustomDrawer(),
          body: AboutPage(),
        ),
        '/contact': (context) => Scaffold(
          appBar: AppBar(
            title: Text('Contact'),
          ),
          drawer: CustomDrawer(),
          body: ContactPage(),
        ),
        '/destinations': (context) => Scaffold(
          appBar: AppBar(
            title: Text('Destinations'),
          ),
          drawer: CustomDrawer(),
          body: DestinationsPage(),
        ),
        '/travel_packages': (context) => Scaffold(
          appBar: AppBar(
            title: Text('Travel Packages'),
          ),
          drawer: CustomDrawer(),
          body: TravelPackagesPage(),
        ),
        '/cards': (context) => Scaffold(
          appBar: AppBar(
            title: Text('Cards'),
          ),
          drawer: CustomDrawer(),
          body: Container(), 
        ),
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Mundo'),
      ),
      drawer: CustomDrawer(),
      body: Navigator(
        onGenerateRoute: (settings) {
          Widget page;
          switch (settings.name) {
            case '/home':
              page = HomePage();
              break;
            case '/about':
              page = AboutPage();
              break;
            case '/contact':
              page = ContactPage();
              break;
            case '/destinations':
              page = DestinationsPage();
              break;
            case '/travel_packages':
              page = TravelPackagesPage();
              break;
            default:
              page = HomePage();
              break;
          }
          return MaterialPageRoute(builder: (_) => page);
        },
      ),
    );
  }
}
