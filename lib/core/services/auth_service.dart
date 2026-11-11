import 'package:get/get.dart';
import 'secure_storage_service.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find<AuthService>();

  final SecureStorageService _storage = SecureStorageService.to;

  final RxBool isAuthenticated = false.obs;
  final RxnString currentVendorId = RxnString();
  final RxnString cachedUserData = RxnString();

  Future<AuthService> init() async {
    final token = await _storage.getAuthToken();
    final storedVendorId = await _storage.getVendorId();
    final storedUserData = await _storage.getUserData();

    if (token != null && token.isNotEmpty) {
      isAuthenticated.value = true;
      currentVendorId.value = storedVendorId;
      cachedUserData.value = storedUserData;
    } else {
      isAuthenticated.value = false;
    }
    return this;
  }

  Future<void> onLoginSuccess({
    required String token,
    required String vendorId,
    String? userData,
  }) async {
    await _storage.saveAuthToken(token);
    await _storage.saveVendorId(vendorId);
    if (userData != null) {
      await _storage.saveUserData(userData);
      cachedUserData.value = userData;
    }

    currentVendorId.value = vendorId;
    isAuthenticated.value = true;
  }

  Future<void> logout() async {
    await _storage.clearSession();
    isAuthenticated.value = false;
    currentVendorId.value = null;
    cachedUserData.value = null;
  }
}

