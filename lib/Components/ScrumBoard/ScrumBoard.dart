import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:scrumboard/Components/ScrumBoard/ScrumBoardColumn.dart';

class ScrumBoard extends StatelessWidget {
  const ScrumBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        children: [
          const ScrumBoardColumn(
            header: 'test',
          ),
          const ScrumBoardColumn(
            header: 'test',
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
