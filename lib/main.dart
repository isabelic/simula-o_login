
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://nyqzzjztnaiiwxvjezmv.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im55cXp6anp0bmFpaXd4dmplem12Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDczNTQ5MjEsImV4cCI6MjA2MjkzMDkyMX0.imG_lipIwP69c8fMRpx4wt-SKYONDnqtylePPoM3TH4',
  );
   runApp(MaterialApp(home: LoginPage()));
}

// tela de login 
class LoginPage extends StatelessWidget {
  
  // variaveis 
  final _formKey = GlobalKey<FormState>();// verifica se há algo no campo
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _storage = FlutterSecureStorage();// token


//funcao que cria o login 
  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (_password.text == '123456') {
        await _storage.write(key: 'token', value: 'abc123');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login realizado com sucesso!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Senha incorreta.')),
        );
      }
    }
  }
// construido a tela 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _email,
                decoration: InputDecoration(labelText: 'E-mail'),

                //validação dos campos 
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe o e-mail' : null,
              ),
              TextFormField(
                controller: _password,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) =>
                //  verifica e o campo esta preenchido, retornando uma mensagem se for preenchido 
                    value == null || value.isEmpty ? 'Informe a senha' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _login(context),
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
