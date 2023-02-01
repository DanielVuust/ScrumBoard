import 'dart:math';

import 'package:flutter/material.dart';

class ScrumBoardWorkItem extends StatelessWidget {
  final int id;
  const ScrumBoardWorkItem({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    //TODO Remove description.
    String description = "Description for workitem ${id}";

    return Draggable<int>(
      onDragCompleted: () => {print("Dragged item $id")},
      data: id,
      feedback: Card(
        child: SizedBox(
          height: 100,
          width: 200,
          child: Text(
            id.toString(),
            textAlign: TextAlign.left,
            textScaleFactor: 2,
          ),
        ),
      ),
      childWhenDragging: null,
      child: Card(
        child: SizedBox(
          height: 100,
          width: 200,
          child: Text(id.toString()),
        ),
      ),
    );
  }
}
