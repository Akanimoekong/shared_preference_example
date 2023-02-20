import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
 static SharedPreferences? _preferences;

 static const _keyUsername = 'username';
 static const _keyEmail = 'email';
 static const _keyPhone = 'phone';

 static Future init() async => _preferences = await SharedPreferences.getInstance();

 static Future setUsername(String username) async =>
     await _preferences!.setString(_keyUsername, username);
 static String? getUsername() => _preferences!.getString(_keyUsername);



}

