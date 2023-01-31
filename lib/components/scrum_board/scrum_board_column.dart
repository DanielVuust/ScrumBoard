import 'dart:math';

import 'package:flutter/material.dart';

import 'scrum_board_work_item.dart';

class ScrumBoardColumn extends StatefulWidget {
  final String header;
  const ScrumBoardColumn({super.key, required this.header});

  @override
  State<ScrumBoardColumn> createState() => _ScrumBoardColumnState();
}

class _ScrumBoardColumnState extends State<ScrumBoardColumn> {
  final List<ScrumBoardWorkItem> list = List.generate(
      2,
      (index) => ScrumBoardWorkItem(
            id: Random().nextInt(100),
          ));
  Color color = const Color.fromARGB(255, 213, 213, 213);

  @override
  Widget build(BuildContext context) {
    print("here2");
    return Container(
      padding: EdgeInsets.all(8),
      child: DragTarget<int>(
          onWillAccept: (data) {
            setState(() {
              color = Color.fromARGB(255, 182, 182, 182);
            });
            return true;
          },
          onAccept: (data) => {
                print("Dragged to ${widget.header}"),
                color = const Color.fromARGB(255, 213, 213, 213),
              },
          onLeave: (data) => setState(() {
                color = const Color.fromARGB(255, 213, 213, 213);
              }),
          builder: (context, _, __) => Container(
              padding: EdgeInsets.all(8),
              color: color,
              width: 200,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return list[index];
                },
              ))),
    );
  }
}
