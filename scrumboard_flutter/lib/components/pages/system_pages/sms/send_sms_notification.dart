import 'dart:io';

import 'package:scrumboard_client/scrumboard_client.dart';
import 'package:url_launcher/url_launcher.dart';

class SendSmsNotificaion {
  final User resipent;
  SendSmsNotificaion(this.resipent);
  send(user, String body) async {
    if (Platform.isAndroid) {
      const uriString = 'sms:${resipent.phoneNumber}?body=hello%20there';
      final Uri uri = Uri.parse(uriString);
      await launchUrl(uri);
    } else if (Platform.isIOS) {
      const uriString = 'sms:0039-222-060-888&';
      Uri uri = Uri.parse(uriString);
      await launchUrl(uri);
    }
  }
}
