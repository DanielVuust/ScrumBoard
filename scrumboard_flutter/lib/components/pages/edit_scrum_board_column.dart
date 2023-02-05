import 'package:flutter/material.dart';
import 'package:scrumboard_client/scrumboard_client.dart';
import 'package:scrumboard_flutter/components/widgets/scrum_board/scrum_board_column_edit_form.dart';

class EditScrumBoardColumnScreen extends StatelessWidget {
  final ScrumBoardColumn column;
  const EditScrumBoardColumnScreen({super.key, required this.column});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Column"),
      ),
      body: ScrumBoardColumnEditFormWidget(
        column: column,
      ),
    );
  }
}
