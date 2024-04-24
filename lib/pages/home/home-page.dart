// lib/pages/home/home-page.dart

import 'package:flutter/material.dart';
import 'package:explore_mundo/pages/destinations/destinations_page.dart';
import 'package:explore_mundo/pages/contact/contact_page.dart';
import 'package:explore_mundo/pages/about/about_page.dart';
import 'package:explore_mundo/pages/travel_packages/travel_packages_page.dart';
import 'package:explore_mundo/custom_search_delegate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Mundo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesquisar Destinos'),
        backgroundColor: theme.primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/banner.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _createHomeButton(
              context,
              icon: Icons.map,
              text: 'Descubra lugares incríveis',
              onTap: () => _navigateTo(context, DestinationsPage()),
            ),
            _createHomeButton(
              context,
              icon: Icons.card_travel,
              text: 'Pacotes de Viagem',
              onTap: () => _navigateTo(context, TravelPackagesPage()),
            ),
            _createHomeButton(
              context,
              icon: Icons.star,
              text: 'Ofertas especiais',
              onTap: () {
                
              },
            ),
            _createHomeButton(
              context,
              icon: Icons.phone,
              text: 'Entre em Contato',
              onTap: () => _navigateTo(context, ContactPage()),
            ),
            _createHomeButton(
              context,
              icon: Icons.info_outline,
              text: 'Sobre Nós',
              onTap: () => _navigateTo(context, AboutPage()),
            ),
            
            
          ],
        ),
      ),
    );
  }

  Widget _createHomeButton(BuildContext context, {required IconData icon, required String text, required VoidCallback onTap}) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(text),
        onTap: onTap,
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}
}

