// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Supabase.initialize(
//     url: 'https://nyqzzjztnaiiwxvjezmv.supabase.co',
//     anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im55cXp6anp0bmFpaXd4dmplem12Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDczNTQ5MjEsImV4cCI6MjA2MjkzMDkyMX0.imG_lipIwP69c8fMRpx4wt-SKYONDnqtylePPoM3TH4',
//   );

//   runApp(MaterialApp(home: LoginPage()));
// }

// class LoginPage extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();
//   final _email = TextEditingController();
//   final _password = TextEditingController();
//   final _storage = FlutterSecureStorage();

//   // 🔐 Função de login real com Supabase
//   Future<void> _login(BuildContext context) async {
//     if (_formKey.currentState!.validate()) {
//       //try {
//         final response = await Supabase.instance.client.auth.signInWithPassword(
//           email: _email.text.trim(),
//           password: _password.text.trim(),
//         );
        
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _email,
//                 decoration: InputDecoration(labelText: 'E-mail'),
//                 validator: (value) =>
//                     value == null || value.isEmpty ? 'Informe o e-mail' : null,
//               ),
//               TextFormField(
//                 controller: _password,
//                 decoration: InputDecoration(labelText: 'Senha'),
//                 obscureText: true,
//                 validator: (value) =>
//                     value == null || value.isEmpty ? 'Informe a senha' : null,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () => _login(context),
//                 child: Text('Entrar'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Página pós-login (simples para parecer básica)
// class HomePage extends StatelessWidget {
//   final _storage = FlutterSecureStorage();

//   Future<void> _logout(BuildContext context) async {
//     await Supabase.instance.client.auth.signOut();
//     await _storage.delete(key: 'token');

//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (_) => LoginPage()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cofrinho Secreto'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () => _logout(context),
//           )
//         ],
//       ),
//       body: Center(
//         child: Text('Você está logado! 🪙'),
//       ),
//     );
//   }
// }
