import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Notification {

static Future<void> sendPushNotification({required String notificationID}) async {
  final url = Uri.parse('https://api.onesignal.com/notifications');

  final headers = {
    'Content-Type': 'application/json',
    'Authorization': dotenv.get('authorization_notification')
  };

  final body = jsonEncode({
    "target_channel": "push",
    "include_aliases": {
      "external_id": [notificationID], // Replace with your actual user ID
    },
    "app_id": "f70fb62c-7729-4955-b50e-e6575a77ac8c", // Replace with your actual App ID
    "contents": {
      "en": "You're order on the way",
    },
  });

  try {
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print("Notification sent successfully: ${response.body}");
    } else {
      print("Failed to send notification: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  } catch (e) {
    print("Error sending notification: $e");
  }
}

}