import 'package:longtime/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys {
  id,
  loggedIn,
  email,
  username,
  birthdate,
  phone,
  imageUri,
  gender,
  token
}
class SharedPrefController {
  SharedPrefController._();

  late SharedPreferences _preferences;
  static SharedPrefController? _instance;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> save(User user) async {
    await _preferences.setInt(PrefKeys.id.name, user.id ?? 0);
    await _preferences.setBool(PrefKeys.loggedIn.name, true);
    await _preferences.setString(PrefKeys.username.name, user.name.toString());
    await _preferences.setString(PrefKeys.email.name, user.email.toString());
    await _preferences.setString(PrefKeys.gender.name, user.gender.toString());
    await _preferences.setString(PrefKeys.token.name, "Bearer ${user.token}");
  }

  bool get loggedIn => _preferences.getBool(PrefKeys.loggedIn.name) ?? false;


  T? getValueFor<T>(String key) {
    if (_preferences.containsKey(key)) {
      return _preferences.get(key) as T;
    }
    return null;
  }

  Future<bool> deleteValueFor(String key) async {

    return _preferences.containsKey(key) ? await _preferences.remove(key) : false;
  }

  Future<bool> clear() {

    return _preferences.clear();
  }
}
