import 'package:flutter/material.dart';

class TravelPackagesPage extends StatelessWidget {
  const TravelPackagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pacotes de Viagem'),
      ),
      body: ListView.builder(
        itemCount: 10, 
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.card_travel),
            title: Text('Pacote de Viagem $index'),
            subtitle: const Text('Descrição do pacote de viagem.'),
            onTap: () {
              
            },
          );
        },
      ),
    );
  }
}
