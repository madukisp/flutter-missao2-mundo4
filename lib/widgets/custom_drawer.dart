// lib/widgets/custom_drawer.dart

import 'package:flutter/material.dart';
import 'package:explore_mundo/pages/destinations/destinations_page.dart';
import 'package:explore_mundo/pages/contact/contact_page.dart';
import 'package:explore_mundo/pages/about/about_page.dart';
import 'package:explore_mundo/pages/travel_packages/travel_packages_page.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.0)),
                ),
                context: context,
                builder: (BuildContext bc) {
                  return Wrap(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: Text('Camera'),
                        leading: Icon(Icons.camera),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: Text('Galeria'),
                        leading: Icon(Icons.image),
                      ),
                    ],
                  );
                },
              );
            },
            child: UserAccountsDrawerHeader(
              accountName: Text('Amanda Duque'),
              accountEmail: Text('madukisp@gmail.com'),
              decoration: BoxDecoration(
                color: theme.primaryColor,
              ),
              currentAccountPicture: Container(
                width: 72.0,
                height: 72.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/profile_image.jpg'),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
              ),
            ),
          ),
          _createDrawerItem(
            icon: Icons.map,
            text: 'Explore Destinos',
            onTap: () => _navigateTo(context, DestinationsPage()),
          ),
          _createDrawerItem(
            icon: Icons.card_travel,
            text: 'Pacotes de Viagem',
            onTap: () => _navigateTo(context, TravelPackagesPage()),
          ),
          _createDrawerItem(
            icon: Icons.mail_outline,
            text: 'Entre em Contato',
            onTap: () => _navigateTo(context, ContactPage()),
          ),
          _createDrawerItem(
            icon: Icons.info_outline,
            text: 'Sobre Nós',
            onTap: () => _navigateTo(context, AboutPage()),
          ),
          _createDrawerItem(
            icon: Icons.privacy_tip,
            text: 'Termos de uso e privacidade',
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext bc) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Column(
                      children: [
                        Text(
                          'Termos de uso e privacidade',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                            'A Agência de Viagens Mundo Explorer está comprometida em proteger a privacidade dos dados dos nossos clientes. Utilizamos suas informações pessoais apenas para fornecer os serviços solicitados, garantindo segurança e confidencialidade. Não compartilhamos seus dados com terceiros sem consentimento, e empregamos medidas de segurança rigorosas para protegê-los. Ao utilizar nosso aplicativo, você concorda com nossos Termos de Uso, que podem ser atualizados ocasionalmente. Estamos aqui para tornar sua experiência de viagem segura, personalizada e memorável.'),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          _createDrawerItem(
            icon: Icons.exit_to_app,
            text: 'Sair',
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      title: Text('Sair'),
                      content: Text('Deseja realmente sair do aplicativo?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Text('Sair'),
                        ),
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}
