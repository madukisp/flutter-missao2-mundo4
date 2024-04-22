import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre Nós'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              'Sobre o Explore Mundo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'A Explore Mundo é uma agência de viagens líder no mercado, '
              'oferecendo os melhores destinos e experiências para os nossos clientes. '
              'Nossa missão é garantir que cada viagem seja memorável e única.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
