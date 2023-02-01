import 'package:flutter/material.dart';
import 'package:scrumboard/widgets/scrum_board/scrum_board_column.dart';

class ScrumBoard extends StatelessWidget {
  const ScrumBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scrum Board"),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        children: const [
          ScrumBoardColumn(
            header: 'To Do',
          ),
          ScrumBoardColumn(
            header: 'In Progress',
          ),
          ScrumBoardColumn(
            header: 'Resolved',
          ),
          ScrumBoardColumn(
            header: 'Done',
          ),
        ],
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
