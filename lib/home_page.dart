import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'cofre_service.dart';
import 'auth_service.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cofre = CofreService();
  final _auth = AuthService();
  final _recadoController = TextEditingController();
  String? recadoSalvo;

  @override
  void initState() {
    super.initState();
    carregarRecado();
  }

  void carregarRecado() async {
    final texto = await _cofre.lerRecado();
    setState(() {
      recadoSalvo = texto;
    });
  }

  void logout() async {
    final storage = FlutterSecureStorage();
    await _auth.logout();
    await storage.deleteAll();
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cofrinho Secreto'),
        actions: [
          IconButton(onPressed: logout, icon: Icon(Icons.logout)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _recadoController,
              decoration: InputDecoration(labelText: 'Novo recado'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _cofre.salvarRecado(_recadoController.text);
                carregarRecado();
              },
              child: Text('Salvar Recado'),
            ),
            SizedBox(height: 20),
            if (recadoSalvo != null) ...[
              Text('Recado salvo:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(recadoSalvo!),
              ElevatedButton(
                onPressed: () async {
                  await _cofre.apagarRecado();
                  carregarRecado();
                },
                child: Text('Apagar Recado'),
              )
            ]
          ],
        ),
      ),
    );
  }
}