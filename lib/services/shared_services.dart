import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  final keyToken = "token";
  final keyEmail = "email";
  final keyIdUser = "idUser";
  final keyfirstTime = "firstTime";

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyToken);
    // prefs.getString(keyEmail);
    // prefs.getInt(keyRole);
  }

  Future<String?> getIduser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyIdUser);
  }

  // Future<int?> getRole() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getInt(keyRole);
  //   // prefs.getString(keyEmail);
  //   // prefs.getInt(keyRole);
  // }

  Future<bool?> getFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyfirstTime);
  }

  Future<bool> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(keyToken, token);
    // prefs.setString(keyEmail, email);
    // prefs.setInt(keyRole, role);
  }

  Future<bool> saveIdUser(String idUser) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(keyIdUser, idUser);
  }

  // Future<bool> saveRole(int role) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.setInt(keyRole, role);
  //   // prefs.setString(keyEmail, email);
  //   // prefs.setInt(keyRole, role);
  // }

  Future<bool> saveFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(keyfirstTime, true);
  }

  Future<bool> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(keyToken);
    // prefs.remove(keyEmail);
    // prefs.remove(keyRole);
  }

  Future<bool> deleteIdUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(keyIdUser);
    // prefs.remove(keyEmail);
    // prefs.remove(keyRole);
  }

  // Future<bool> deleteRole() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.remove(keyRole);
  //   // prefs.remove(keyEmail);
  //   // prefs.remove(keyRole);
  // }
}
