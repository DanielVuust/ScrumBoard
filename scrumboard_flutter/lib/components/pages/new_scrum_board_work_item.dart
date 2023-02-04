import 'package:flutter/material.dart';

import '../widgets/scrum_board/scrum_board_work_item_edit_form.dart';

class NewScrumBoardWorkItem extends StatelessWidget {
  const NewScrumBoardWorkItem({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Work Item"),
      ),
      body: const ScrumBoardWorkItemEditFormWidget(),
    );
  }
}
