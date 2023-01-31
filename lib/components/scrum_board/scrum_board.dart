import 'package:flutter/material.dart';
import 'package:scrumboard/components/scrum_board/scrum_board_column.dart';
import 'package:flutter/material.dart';

class ScrumBoard extends StatelessWidget {
  const ScrumBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
