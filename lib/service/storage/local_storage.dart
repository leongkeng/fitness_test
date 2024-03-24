import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  factory LocalStorage() {
    return _instance;
  }

  LocalStorage._internal();

  FlutterSecureStorage get storage => _storage;

  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    final jsonString = await _storage.read(key: key);
    if (jsonString != null) {
      return jsonString;
    }
    return null;
  }

  Future<Map<String, String>> readAll() async {
    final Map<String, String> allValues = await _storage.readAll();
    return allValues;
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

}