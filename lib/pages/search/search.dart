import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  
  
  final List<String> searchResults = [
    'Destino 1',
    'Destino 2',
    'Pacote de Viagem A',
    'Pacote de Viagem B',
    
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; 
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); 
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    
    return ListView(
      children: searchResults
          .where((element) => element.toLowerCase().contains(query.toLowerCase()))
          .map((result) => ListTile(
                title: Text(result),
                onTap: () {
                  
                  
                  close(context, result);
                },
              ))
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final suggestion = searchResults[index];
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
