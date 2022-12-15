import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  final keyToken = "token";
  final keyEmail = "email";
  final keyRole = "role";

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyToken);
    // prefs.getString(keyEmail);
    // prefs.getInt(keyRole);
  }

  Future<int?> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(keyRole);
    // prefs.getString(keyEmail);
    // prefs.getInt(keyRole);
  }

  Future<bool> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(keyToken, token);
    // prefs.setString(keyEmail, email);
    // prefs.setInt(keyRole, role);
  }

  Future<bool> saveRole(int role) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setInt(keyRole, role);
    // prefs.setString(keyEmail, email);
    // prefs.setInt(keyRole, role);
  }

  Future<bool> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(keyToken);
    // prefs.remove(keyEmail);
    // prefs.remove(keyRole);
  }

  Future<bool> deleteRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(keyRole);
    // prefs.remove(keyEmail);
    // prefs.remove(keyRole);
  }
}
