import 'package:flutter/foundation.dart';

class ApiEndpoints {
  ApiEndpoints._();

  // Environment Base URLs (Overridable via --dart-define)
  static const String devBaseUrl = 'https://beta-api.techjockey.com/vendor/';
  static const String stagingBaseUrl = 'https://staging-api.techjockey.com/vendor/';
  static const String prodBaseUrl = 'https://esellerhub.techjockey.com/api/';

  static const String devBaseUrlWww = 'https://beta.techjockey.com/';
  static const String prodBaseUrlWww = 'https://esellerhub.techjockey.com/';

  static String get baseUrl {
    const String envUrl = String.fromEnvironment('BASE_URL');
    if (envUrl.isNotEmpty) return envUrl;
    return kReleaseMode ? prodBaseUrl : devBaseUrl;
  }

  static String get baseUrlWww {
    const String envUrl = String.fromEnvironment('BASE_URL_WWW');
    if (envUrl.isNotEmpty) return envUrl;
    return kReleaseMode ? prodBaseUrlWww : devBaseUrlWww;
  }

  // Auth & System Endpoints
  static const String login = 'login';
  static const String forgotPassword = 'forgot_password';
  static const String logout = 'logout';
  static const String changePassword = 'change_password';
  static const String checkVersion = 'check_version';
  static const String forceUpdate = 'force_update';
  static const String linkedinLogin = 'linkedin_login';
  static const String linkedinUpdatePhone = 'linkedin_update_phone';

  // Dashboard & Analytics
  static const String dashboard = 'dashboard';
  static const String oemPlansInfo = 'oem_plans_info';
  static const String oemProductPlansInfo = 'oem_product_plans_info';
  static const String oemAnalytics = 'oem_analytics';
  static const String getHealthScore = 'get_health_score';
  static const String widgetData = 'widget';

  // Leads CRM
  static const String leadList = 'lead_list';
  static const String leadDetails = 'lead_details';
  static const String getLeadHistory = 'get_lead_history';
  static const String saveRemark = 'save_remark';
  static const String addRemarkReminder = 'add_remark_reminder';
  static const String newLeadsAction = 'new_leads_action';
  static const String updateActions = 'update_actions';
  static const String callList = 'call_list';
  static const String callback = 'callback';
  static const String showContactInfo = 'show_contact_info';
  static const String getAllLeadStatus = 'get_all_lead_status';
  static const String pendingLeadsNotify = 'pending_leads_notify';
  static const String pendingLeadsInfo = 'pending_leads_info';

  // Demo Pipeline
  static const String demoList = 'demo_list';
  static const String demoDetails = 'demo_details';
  static const String scheduleDemo = 'schedule_demo';
  static const String acceptDemo = 'accept_demo';
  static const String rescheduleDemo = 'reschedule_demo';
  static const String demoRescheduleReason = 'demo_reschedule_reason';
  static const String shareDemoLink = 'share_demo_link';

  // Orders & Fulfillment
  static const String orders = 'orders';
  static const String uploadLicence = 'upload_licence';
  static const String removeLicence = 'remove_licence';

  // Products & Pricing
  static const String getProductList = 'get_product_list';
  static const String getCategory = 'get_product_category';
  static const String productPricing = 'pricing/product_pricing';
  static const String calculatePrice = 'pricing/calculate_price';
  static const String addToCart = 'pricing/add_to_cart';
  static const String applyCoupon = 'pricing/apply_coupon';
  static const String createCoupon = 'pricing/create_coupon';
  static const String placeOrder = 'pricing/place_order';
  static const String couponPercent = 'coupon_percent';
  static const String sharePaymentLink = 'share_payment_link';

  // Vendor & Brand Profile
  static const String getProfile = 'get_profile';
  static const String updateProfile = 'update_profile';
  static const String updateImage = 'update_image';
  static const String profileCompletion = 'profile_completion';
  static const String getBrandList = 'get_brand_list';
  static const String addUpdateBrand = 'add_update_brand';
  static const String getBrandContact = 'get_brand_contact';
  static const String getReviewList = 'get_review_list';
}

