import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../core/services/auth_service.dart';
import '../app_routes.dart';

class AuthGuard extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (!AuthService.to.isAuthenticated.value) {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}

