import 'package:get_storage/get_storage.dart';

class MySharedPref {
  static const String _tokenKey = 'token';

  static GetStorage _storage = GetStorage();

  static initStorage() async {
    await GetStorage.init();
    _storage = GetStorage();
  }

  static setToken(token) => _storage.write(_tokenKey, token);

  static String? get getToken => _storage.read(_tokenKey);

  static void removeToken() => _storage.remove(_tokenKey);
}
