// lib/pages/destinations/destinations_page.dart

import 'package:flutter/material.dart';
import 'package:explore_mundo/models/travel_package.dart';  

class DestinationsPage extends StatelessWidget {
  DestinationsPage({Key? key}) : super(key: key);  

  final List<TravelPackage> packages = [
    TravelPackage(
      title: "Paris",
      description: "Desfrute da bela Paris com passeios inesquecíveis.",
      imageUrl: "assets/images/paris.jpg",
      detailPageRoute: '/parisDetail',
    ),
    TravelPackage(
      title: "New York",
      description: "Explore a vibrante Nova York e seus famosos pontos turísticos.",
      imageUrl: "assets/images/new_york.jpg",
      detailPageRoute: '/newYorkDetail',
    ),
    TravelPackage(
      title: "Sydney",
      description: "Aventuras maravilhosas aguardam você em Sydney.",
      imageUrl: "assets/images/sydney.jpg",
      detailPageRoute: '/sydneyDetail',
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinos'),
      ),
      body: ListView.builder(
        itemCount: packages.length,
        itemBuilder: (context, index) {
          var package = packages[index];
          return Card(
            child: ListTile(
              leading: Image.asset(package.imageUrl, width: 100, height: 100, fit: BoxFit.cover),
              title: Text(package.title),
              subtitle: Text(package.description),
              onTap: () {
                Navigator.of(context).pushNamed(package.detailPageRoute);
              },
            ),
          );
        },
      ),
    );
  }
}
