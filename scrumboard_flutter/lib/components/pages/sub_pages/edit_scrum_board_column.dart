import 'package:flutter/material.dart';
import 'package:scrumboard_client/scrumboard_client.dart';
import 'package:scrumboard_flutter/components/widgets/scrum_board/scrum_board_column_edit_form.dart';

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
      body: ScrumBoardColumnEditFormWidget(
        column: column,
      ),
    );
  }
}
