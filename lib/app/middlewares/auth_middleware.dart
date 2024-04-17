import 'package:chat_app/app/data/local/my_shared_pref.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  AuthMiddleware({
    required this.priority,
  });

  @override
  int? priority;

  @override
  RouteSettings? redirect(String? route) {
    // bool isLoggedIn = MySharedPref.getIsLogin;
    bool isLoggedIn = MySharedPref.getToken?.isNotEmpty ?? false;
    print(isLoggedIn);
    // bool isTokenExpired = SupabaseService.to.currentSession?.isExpired ?? true;
    // print(isTokenExpired);
    // print("isLoggedIn: $isLoggedIn");
    if (isLoggedIn == false) {
      return const RouteSettings(name: Routes.LOGIN);
    }
    return super.redirect(route);
  }
}
