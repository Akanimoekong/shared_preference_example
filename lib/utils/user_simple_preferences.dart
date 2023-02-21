import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
 static SharedPreferences? _preferences;

 static const _keyUsername = 'username';
 static const _keyEmail = 'email';
 static const _keyPhone = 'phone';
 static const _keyAddress = 'address';
 static const _keyPassword = 'password';

 static Future init() async => _preferences = await SharedPreferences.getInstance();

 static Future setUsername(String username) async =>
     await _preferences!.setString(_keyUsername, username);
 static String? getUsername() => _preferences!.getString(_keyUsername);


 static Future setEmail(String email) async =>
     await _preferences!.setString(_keyEmail, email);
 static String? getEmail() => _preferences!.getString(_keyEmail);

 static Future setPhone(String phone) async =>
     await _preferences!.setString(_keyPhone, phone);
 static String? getPhone() => _preferences!.getString(_keyPhone);

 static Future setAddress(String address) async =>
     await _preferences!.setString(_keyAddress, address);
 static String? getAddress() => _preferences!.getString(_keyAddress);

 static Future setPassword(String password) async =>
     await _preferences!.setString(_keyPassword, password);
 static String? getPassword() => _preferences!.getString(_keyPassword);



}

