
import 'package:flutter/material.dart';

class DestinationsPage extends StatelessWidget {
  const DestinationsPage({Key? key}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinos'), 
      ),
      body: const Center(
        child: Text('Bem-vindo à página de destinos!'), 
      ),
    );
  }
}

