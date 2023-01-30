import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:scrumboard/Components/ScrumBoard/ScrumBoardColumn.dart';

class ScrumBoard extends StatelessWidget {
  const ScrumBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const ScrumBoardColumn(
            header: 'test',
          )
        ],
      ),
    );
  }
}
