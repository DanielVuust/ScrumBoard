import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ScrumBoardColumn extends StatelessWidget {
  const ScrumBoardColumn({super.key, required String header});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 200,
      height: 200,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.red),
      ),
    );
  }
}
