import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class ScrumBoardWorkItem extends StatelessWidget {
  final int id;
  const ScrumBoardWorkItem({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return Draggable<int>(
      data: id,
      feedback: DecoratedBox(
        decoration: BoxDecoration(color: Colors.yellow),
        child: SizedBox(
          height: 200,
          width: 200,
          child: Text(id.toString()),
        ),
      ),
      childWhenDragging: null,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.red),
        child: SizedBox(
          height: 200,
          width: 200,
          child: Text(id.toString()),
        ),
      ),
    );
  }
}
