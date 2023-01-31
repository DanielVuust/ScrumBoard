// ignore_for_file: unnecessary_new

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: DragTarget<int>(
          onAccept: (data) => {
                print("Dragged to ${widget.header}"),
              },
          builder: (context, _, __) => Container(
              padding: EdgeInsets.all(8),
              color: Colors.blue,
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
