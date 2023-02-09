import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scrumboard_client/scrumboard_client.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:scrumboard_flutter/components/widgets/scrum_board/edit_forms/scrum_board_column_edit_form.dart';
import 'package:url_launcher/url_launcher.dart';

class EditScrumBoardColumnScreen extends StatelessWidget {
  final ScrumBoardColumn column;
  const EditScrumBoardColumnScreen({super.key, required this.column});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Dynamiclly set the heading of column page, depending on if the column has been saved in the db.
        title: Text((column.id == null) ? "New Column" : "Edit Column"),
      ),
      body: GestureDetector(
        onTap: () {
          print("ere");
          _sendSMS("");
        },
        child: ScrumBoardColumnEditFormWidget(
          column: column,
        ),
      ),
    );
  }

  _sendSMS(User) async {
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
