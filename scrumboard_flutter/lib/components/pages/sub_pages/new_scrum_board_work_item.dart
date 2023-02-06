import 'package:flutter/material.dart';
import 'package:scrumboard_client/scrumboard_client.dart';

import '../../widgets/scrum_board/scrum_board_work_item_edit_form.dart';

class NewScrumBoardWorkItem extends StatelessWidget {
  final ScrumBoardWorkItem workItem;
  const NewScrumBoardWorkItem({super.key, required this.workItem});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Work Item"),
      ),
      body: ScrumBoardWorkItemEditFormWidget(workItem: workItem,),
    );
  }
}
