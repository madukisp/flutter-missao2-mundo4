import 'package:flutter/material.dart';
import 'package:explore_mundo/destinations/destinations_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Mundo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              
            },
          ),
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              _navigateToDestinations(context);
            },
          ),
          
        ],
      ),
      body: ListView(
        children: <Widget>[
          
        ],
      ),
    );
  }

  void _navigateToDestinations(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DestinationsPage()),
    );
  }
}


