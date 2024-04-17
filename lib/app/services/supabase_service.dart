import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService extends GetxService {
  Future<SupabaseService> init() async => this;
  static SupabaseService get to => Get.find();

  String SUPABASE_URL = 'https://qqqavcafwrzupasqznky.supabase.co';
  String SUPABASE_ANON_KEY =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFxcWF2Y2Fmd3J6dXBhc3F6bmt5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTMyNTQzMjgsImV4cCI6MjAyODgzMDMyOH0.2pXQwTJZm-gdyqcMf3hZi-7B-tZDjgAjfuJWJf3o_LI';

  static SupabaseClient supabaseClient = Supabase.instance.client;

  Session? get getSupabaseSession => supabaseClient.auth.currentSession;
  User? get getSupabaseUser => supabaseClient.auth.currentUser;

  @override
  void onInit() async {
    await Supabase.initialize(
      url: SUPABASE_URL,
      anonKey: SUPABASE_ANON_KEY,
    );

    super.onInit();
  }

  static Future<void> logoutSupabase() async {
    await supabaseClient.auth.signOut();
  }
}
