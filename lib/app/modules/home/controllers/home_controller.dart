import 'package:chat_app/app/services/supabase_service.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  User? user;

  List<Conversation> conversations = [
    Conversation(
      name: "Raheel Baig",
      messageType: MessageType.text,
      lastMessage: "flutter_launcher_icons flutter_native_splash",
      lastMessageAt: DateTime(2024, 4, 17, 16, 7),
    ),
    Conversation(
      name: "Fahad Ayub",
      messageType: MessageType.text,
      lastMessage: "Hi",
      lastMessageAt: DateTime(2024, 4, 16, 10, 15),
    ),
    Conversation(
      name: "Waqar Kayani",
      messageType: MessageType.text,
      lastMessage:
          "W/Salam Sir I totally understand You can take your time no problem",
      lastMessageAt: DateTime(2024, 4, 16, 12, 55),
    ),
    Conversation(
      name: "Khubaib Rasheed",
      messageType: MessageType.text,
      lastMessage: "OK",
      lastMessageAt: DateTime(2024, 4, 16, 12, 30),
    ),
    Conversation(
      name: "Zulqarnain NLS",
      messageType: MessageType.text,
      lastMessage: "https://www.npmjs.com/package/jwt-decode",
      lastMessageAt: DateTime(2024, 3, 28, 12, 30),
    ),
    Conversation(
      name: "Saad Shahid",
      messageType: MessageType.photo,
      lastMessageAt: DateTime(2024, 3, 20, 2, 28),
    ),
  ];

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    await .1.delay();
    user = SupabaseService.to.getSupabaseUser;
    print(user?.phone);
    update();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

enum MessageType {
  text,
  audio,
  photo,
  video,
}

class Conversation {
  String? profile;
  String name;
  MessageType messageType;
  DateTime lastMessageAt;
  String? lastMessage;

  Conversation({
    this.profile,
    required this.name,
    required this.messageType,
    required this.lastMessageAt,
    this.lastMessage,
  });
}
