import 'package:flutter/material.dart';
import 'package:explore_mundo/destinations/destinations_page.dart';
import 'package:explore_mundo/contact/contact_page.dart';
import 'package:explore_mundo/about/about_page.dart';
import 'package:explore_mundo/travel_packages/travel_packages_page.dart';

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
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        IconButton(
          icon: const Icon(Icons.language),
          onPressed: () => Navigator.pushNamed(context, '/destinations'),
        ),
        IconButton(
          icon: const Icon(Icons.card_travel),
          onPressed: () => Navigator.pushNamed(context, '/travel_packages'),
        ),
        IconButton(
          icon: const Icon(Icons.contact_mail),
          onPressed: () => Navigator.pushNamed(context, '/contact'),
        ),
        IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () => Navigator.pushNamed(context, '/about'),
        ),

        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              
              
            },
            child: Image.asset(
              'assets/images/banner.jpg', 
              width: MediaQuery.of(context).size.width,
              height: 240,
              fit: BoxFit.cover,
            ),
          ),
          
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<String> destinations = [
    'Paris', 'New York', 'Sydney', 'Tokyo', 'Londres', 'Rio de Janeiro',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        ),
    ];
  }

    @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> results = destinations
      .where((destination) => destination.toLowerCase().contains(query.toLowerCase()))
      .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestions = query.isEmpty
      ? destinations
      : destinations.where((destination) => destination.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final String suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}
