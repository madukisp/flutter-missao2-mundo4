// lib/pages/contact/contact_page.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 

class ContactPage extends StatelessWidget {
  ContactPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contato'),
        backgroundColor: Colors.deepPurple, 
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Entre em Contato',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
              const SizedBox(height: 16),
              const Text(
                'Se você tiver alguma dúvida ou precisar entrar em contato conosco, '
                'não hesite em enviar uma mensagem ou nos ligar!',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 20),
              _buildTextFormField('Seu nome', 'Digite seu nome', _nameController),
              const SizedBox(height: 10),
              _buildTextFormField('Seu e-mail', 'Digite seu e-mail', _emailController, isEmail: true),
              const SizedBox(height: 10),
              _buildTextFormField('Assunto', 'Qual é o assunto?', _subjectController),
              const SizedBox(height: 10),
              _buildTextFormField('Mensagem', 'Digite sua mensagem', _messageController, maxLines: 3),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                onPressed: () => _sendEmail(
                  _subjectController.text,
                  "Nome: ${_nameController.text}\nEmail: ${_emailController.text}\nMensagem: ${_messageController.text}"
                ),
                child: const Text('Enviar Mensagem'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _sendEmail(String subject, String body) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'madukisp@gmail.com',  
      queryParameters: {
        'subject': subject,
        'body': body
      }
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  Widget _buildTextFormField(String label, String hintText, TextEditingController controller, {bool isEmail = false, int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      maxLines: maxLines,
    );
  }
}
