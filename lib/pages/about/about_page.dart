// lib/pages/about/about_page.dart

import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre Nós'),
        backgroundColor: Colors.deepPurple, 
      ),
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/about_us.png',
                fit: BoxFit.cover,
              ),
              
              const Text(
                'Sobre o Explore Mundo',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.deepPurple, 
                ),
              ),
              
              const SizedBox(height: 16),
              const Text(
                'A Explore Mundo é uma agência de viagens líder no mercado, '
                'oferecendo os melhores destinos e experiências para os nossos clientes. '
                'Nossa missão é garantir que cada viagem seja memorável e única.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              
              const SizedBox(height: 20),
              const Text(
                'Compromisso com a Qualidade',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Trabalhamos com os melhores parceiros de viagem para assegurar a qualidade '
                'e a satisfação em todas as etapas de sua jornada.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
