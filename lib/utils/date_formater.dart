import 'package:intl/intl.dart';

String formatTime(DateTime timestamp) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = DateTime(now.year, now.month, now.day - 1);

  if (timestamp.year == now.year &&
      timestamp.month == now.month &&
      timestamp.day == now.day) {
    return DateFormat('hh:mm a').format(timestamp);
  } else if (timestamp.year == yesterday.year &&
      timestamp.month == yesterday.month &&
      timestamp.day == yesterday.day) {
    return 'Yesterday';
  } else if (now.difference(timestamp).inDays < 7) {
    return DateFormat('EEEE').format(timestamp);
  } else {
    return DateFormat('dd/MM/yyyy').format(timestamp);
  }
}
