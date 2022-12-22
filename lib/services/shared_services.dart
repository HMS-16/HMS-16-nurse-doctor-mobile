import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  final keyToken = "token";
  final keyEmail = "email";
  final keyIdUser = "idUser";
  final keyfirstTime = "firstTime";
  final keyUser = "user";

  Future<String?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyUser);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyToken);
  }

  Future<String?> getIduser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyIdUser);
  }

  Future<bool?> getFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyfirstTime);
  }

  Future<bool> saveUser(String user) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(keyUser, user);
  }

  Future<bool> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(keyToken, token);
  }

  Future<bool> saveIdUser(String idUser) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(keyIdUser, idUser);
  }

  Future<bool> saveFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(keyfirstTime, true);
  }

  Future<bool> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(keyToken);
  }

  Future<bool> deleteIdUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(keyIdUser);
  }

  Future<bool> deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(keyUser);
  }
}
