import 'package:chat_app/app/data/local/my_shared_pref.dart';
import 'package:chat_app/app/services/supabase_service.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MySharedPref.initStorage();
  Get.putAsync(() => SupabaseService().init());

  runApp(
    GetMaterialApp(
      title: "Chat App",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: FlexThemeData.light(
        scheme: FlexScheme.deepPurple,
        scaffoldBackground: const Color(0xFFF0F0F0),
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.deepPurple,
      ),
      themeMode: ThemeMode.system,
    ),
  );
}
