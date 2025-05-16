import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class CofreService {
  final _storage = FlutterSecureStorage();
  final _chave = encrypt.Key.fromLength(32);
  final _iv = encrypt.IV.fromLength(16);

  Future<void> salvarRecado(String texto) async {
    final encrypter = encrypt.Encrypter(encrypt.AES(_chave));
    final recadoCriptografado = encrypter.encrypt(texto, iv: _iv).base64;
    await _storage.write(key: 'recado', value: recadoCriptografado);
  }

  Future<String?> lerRecado() async {
    final dado = await _storage.read(key: 'recado');
    if (dado == null) return null;
    final encrypter = encrypt.Encrypter(encrypt.AES(_chave));
    final texto = encrypter.decrypt(encrypt.Encrypted.from64(dado), iv: _iv);
    return texto;
  }

  Future<void> apagarRecado() async {
    await _storage.delete(key: 'recado');
  }
}
