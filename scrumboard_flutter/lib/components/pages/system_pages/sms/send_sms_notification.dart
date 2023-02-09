import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class SendSmsNotificaion {
  send(String body) async {
    if (Platform.isAndroid) {
      const uriString = 'sms:+4520280287?body=hello%20there';
      final Uri uri = Uri.parse(uriString);
      await launchUrl(uri);
    } else if (Platform.isIOS) {
      const uriString = 'sms:0039-222-060-888&';
      Uri uri = Uri.parse(uriString);
      await launchUrl(uri);
    }
  }
}
