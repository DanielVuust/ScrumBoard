import 'package:flutter/material.dart';
import 'package:scrumboard/models/scrum_board_column_dto.dart';
import 'package:scrumboard/models/scrum_board_work_item_dto.dart';
import 'package:scrumboard/components/widgets/scrum_board/scrum_board_column.dart';

class ScrumBoard extends StatefulWidget {
  const ScrumBoard({super.key});

  @override
  State<ScrumBoard> createState() => _ScrumBoardState();
}

class _ScrumBoardState extends State<ScrumBoard> {
  // ignore: todo
  //TODO Get values from db, This is placeholder values.
  final ScrumBoardColumnDTO dao = ScrumBoardColumnDTO(
      1, [ScrumBoardWorkItemDTO(1, "test1", "desc1")], "test1");
  final ScrumBoardColumnDTO dao2 = ScrumBoardColumnDTO(
      2, [ScrumBoardWorkItemDTO(2, "test2", "desc2")], "test2");
  final ScrumBoardColumnDTO dao3 = ScrumBoardColumnDTO(
      3,
      [
        ScrumBoardWorkItemDTO(3, "test3", "desc3"),
        ScrumBoardWorkItemDTO(5, "test5", "desc5"),
        ScrumBoardWorkItemDTO(6, "test6", "desc6"),
        ScrumBoardWorkItemDTO(7, "test7", "desc7"),
        ScrumBoardWorkItemDTO(8, "test8", "desc8"),
        ScrumBoardWorkItemDTO(9, "test9", "desc9")
      ],
      "test3");
  final ScrumBoardColumnDTO dao4 = ScrumBoardColumnDTO(
      4, [ScrumBoardWorkItemDTO(4, "test4", "desc4")], "test4");

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
    );
  }
}
