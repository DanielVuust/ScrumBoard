import 'package:flutter/material.dart';
import 'package:scrumboard/models/scrum_board_column_dao.dart';
import 'package:scrumboard/models/scrum_board_work_item_dao.dart';
import 'package:scrumboard/widgets/scrum_board/scrum_board_column.dart';

class ScrumBoard extends StatefulWidget {
  const ScrumBoard({super.key});

  @override
  State<ScrumBoard> createState() => _ScrumBoardState();
}

class _ScrumBoardState extends State<ScrumBoard> {

  // ignore: todo
  //TODO Get values from db, This is placeholder values.
  final ScrumBoardColumnDAO dao = ScrumBoardColumnDAO(
      1, [ScrumBoardWorkItemDAO(1, "test1", "desc1")], "test1");
  final ScrumBoardColumnDAO dao2 = ScrumBoardColumnDAO(
      2, [ScrumBoardWorkItemDAO(2, "test2", "desc2")], "test2");
      final ScrumBoardColumnDAO dao3 = ScrumBoardColumnDAO(
      3, [ScrumBoardWorkItemDAO(3, "test3", "desc3"),ScrumBoardWorkItemDAO(3, "test3", "desc3"),ScrumBoardWorkItemDAO(3, "test3", "desc3"),ScrumBoardWorkItemDAO(3, "test3", "desc3"),ScrumBoardWorkItemDAO(3, "test3", "desc3"),ScrumBoardWorkItemDAO(3, "test3", "desc3")], "test3");
      final ScrumBoardColumnDAO dao4 = ScrumBoardColumnDAO(
      4, [ScrumBoardWorkItemDAO(4, "test4", "desc4")], "test4");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scrum Board"),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        children: [
          ScrumBoardColumn(
            scrumBoardColumn: dao,
          ),
          ScrumBoardColumn(
            scrumBoardColumn: dao2,
          ),
          ScrumBoardColumn(
            scrumBoardColumn: dao3,
          ),
          ScrumBoardColumn(
            scrumBoardColumn: dao4,
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
