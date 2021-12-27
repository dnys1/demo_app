import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  const StorageService();

  static const _secureStorage = FlutterSecureStorage();

  Future<String?> get(StorageKey key) {
    return _secureStorage.read(key: key.name);
  }

  Future<void> put(StorageKey key, String value) {
    return _secureStorage.write(key: key.name, value: value);
  }

  Future<void> delete(StorageKey key) {
    return _secureStorage.delete(key: key.name);
  }
}

enum StorageKey {
  token,
}
