import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  Future<bool> login(String email, String senha) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: senha,
      );
      return response.session != null;
    } catch (e) {
      return false;
    }
  }

  Future<void> logout() async {
    await supabase.auth.signOut();
  }

  bool isLoggedIn() {
    return supabase.auth.currentSession != null;
  }
}