import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForceUpdateGuard extends GetMiddleware {
  static final RxBool isForceUpdateRequired = false.obs;

  @override
  int? get priority => 0;

  @override
  RouteSettings? redirect(String? route) {
    if (isForceUpdateRequired.value) {
      // Can redirect to force update modal or screen if needed
      return null;
    }
    return null;
  }
}

