import 'package:flutter/material.dart';
import 'package:scrumboard_client/scrumboard_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import '../../models/scrum_board_column_dto.dart';
import '../../models/scrum_board_work_item_dto.dart';
import '../widgets/scrum_board/scrum_board_column.dart';

class ScrumBoard extends StatefulWidget {
  const ScrumBoard({super.key});

  @override
  State<ScrumBoard> createState() => _ScrumBoardState();
}

class _ScrumBoardState extends State<ScrumBoard> {
  var client = Client('http://localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();

  List<ScrumBoardColumnDTO> l = [
    ScrumBoardColumnDTO(
        1, [ScrumBoardWorkItemDTO(1, "test1", "desc1", null, 5)], "test1"),
    ScrumBoardColumnDTO(
        3,
        [
          ScrumBoardWorkItemDTO(4, "test3", "desc3", null, 1),
          ScrumBoardWorkItemDTO(5, "test5", "desc5", null, 3),
          ScrumBoardWorkItemDTO(7, "test7", "desc7", null, 4),
          ScrumBoardWorkItemDTO(6, "test6", "desc6", null, 4),
          ScrumBoardWorkItemDTO(8, "test8", "desc8", null, 6),
          ScrumBoardWorkItemDTO(9, "test9", "desc9", null, 7)
        ],
        "test3"),
    ScrumBoardColumnDTO(
        2, [ScrumBoardWorkItemDTO(2, "test2", "desc2", null, 5)], "test2"),
    ScrumBoardColumnDTO(
        4, [ScrumBoardWorkItemDTO(4, "test4", "desc4", null, 5)], "test4")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scrum Board"),
      ),
      body: ReorderableListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        itemBuilder: (BuildContext context, int index) {
          return ScrumBoardColumnWidget(
            scrumBoardColumn: l[index],
            key: Key(l[index].id.toString()),
          );
        },
        itemCount: l.length,
        onReorder: (int oldIndex, int newIndex) {},
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
