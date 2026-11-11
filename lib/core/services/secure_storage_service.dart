import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorageService extends GetxService {
  static SecureStorageService get to => Get.find<SecureStorageService>();

  late final FlutterSecureStorage _secureStorage;
  late final SharedPreferences _sharedPreferences;

  // Storage Keys
  static const String _keyAuthToken = 'auth_token';
  static const String _keyVendorId = 'vendor_id';
  static const String _keyUserData = 'user_data';
  static const String _keyFirstLaunch = 'is_first_launch';

  Future<SecureStorageService> init() async {
    _secureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        resetOnError: true,
      ),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock_this_device,
      ),
    );
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  // Token Operations (Hardware Encrypted)
  Future<void> saveAuthToken(String token) async {
    await _secureStorage.write(key: _keyAuthToken, value: token);
  }

  Future<String?> getAuthToken() async {
    return await _secureStorage.read(key: _keyAuthToken);
  }

  Future<void> deleteAuthToken() async {
    await _secureStorage.delete(key: _keyAuthToken);
  }

  // Vendor ID
  Future<void> saveVendorId(String vendorId) async {
    await _secureStorage.write(key: _keyVendorId, value: vendorId);
  }

  Future<String?> getVendorId() async {
    return await _secureStorage.read(key: _keyVendorId);
  }

  // Cached User JSON
  Future<void> saveUserData(String userDataJson) async {
    await _secureStorage.write(key: _keyUserData, value: userDataJson);
  }

  Future<String?> getUserData() async {
    return await _secureStorage.read(key: _keyUserData);
  }

  // Non-sensitive Preferences (SharedPreferences)
  bool isFirstLaunch() {
    return _sharedPreferences.getBool(_keyFirstLaunch) ?? true;
  }

  Future<void> setFirstLaunchComplete() async {
    await _sharedPreferences.setBool(_keyFirstLaunch, false);
  }

  // Clear Session Data
  Future<void> clearSession() async {
    await _secureStorage.delete(key: _keyAuthToken);
    await _secureStorage.delete(key: _keyVendorId);
    await _secureStorage.delete(key: _keyUserData);
  }

  Future<void> clearAll() async {
    await _secureStorage.deleteAll();
    await _sharedPreferences.clear();
  }
}
