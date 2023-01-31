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
        // decoration: BoxDecoration(color: Colors.yellow),
        surfaceTintColor: Colors.blue,
        child: SizedBox(
          child: Text(
            id.toString(),
            textAlign: TextAlign.left,
            textScaleFactor: 2,
          ),
        ),
      ),
      childWhenDragging: null,
      child: Card(
        // decoration: BoxDecoration(color: Colors.yellow),
        surfaceTintColor: Colors.blue,
        child: SizedBox(
          height: 200,
          width: 200,
          child: Text(id.toString()),
        ),
      ),
    );
  }
}
