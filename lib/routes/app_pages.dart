import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/constants/app_colors.dart';
import '../core/services/auth_service.dart';
import '../core/services/secure_storage_service.dart';
import '../features/onboarding/views/onboarding_view.dart';
import 'app_routes.dart';
import 'middlewares/auth_guard.dart';
import 'middlewares/force_update_guard.dart';

class AppPages {
  AppPages._();

  static const String initial = AppRoutes.initial;

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const _AppInitialPlaceholderView(),
      middlewares: [
        ForceUpdateGuard(),
      ],
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const _PlaceholderScreen(title: 'Vendor Login'),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const _PlaceholderScreen(title: 'Vendor Dashboard'),
      middlewares: [AuthGuard()],
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.leads,
      page: () => const _PlaceholderScreen(title: 'Deals & Leads'),
      middlewares: [AuthGuard()],
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.demos,
      page: () => const _PlaceholderScreen(title: 'Demo Pipeline'),
      middlewares: [AuthGuard()],
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.orders,
      page: () => const _PlaceholderScreen(title: 'Order Tracking'),
      middlewares: [AuthGuard()],
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const _PlaceholderScreen(title: 'Vendor Profile'),
      middlewares: [AuthGuard()],
      transition: Transition.rightToLeft,
    ),
  ];
}

class _AppInitialPlaceholderView extends StatefulWidget {
  const _AppInitialPlaceholderView();

  @override
  State<_AppInitialPlaceholderView> createState() => _AppInitialPlaceholderViewState();
}

class _AppInitialPlaceholderViewState extends State<_AppInitialPlaceholderView> {
  @override
  void initState() {
    super.initState();
    _handleRouting();
  }

  Future<void> _handleRouting() async {
    await Future.delayed(const Duration(milliseconds: 1200));
    if (!mounted) return;

    final isFirst = SecureStorageService.to.isFirstLaunch();
    if (isFirst) {
      Get.offAllNamed(AppRoutes.onboarding);
    } else if (AuthService.to.isAuthenticated.value) {
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.storefront_outlined,
              size: 64,
              color: Colors.white,
            ),
            SizedBox(height: 16),
            Text(
              'Techjockey Partner App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2.5,
            ),
          ],
        ),
      ),
    );
  }
}

class _PlaceholderScreen extends StatelessWidget {
  final String title;

  const _PlaceholderScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          '$title Feature Module',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}

