// ignore_for_file: unnecessary_new

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'ScrumBoardWorkItem.dart';

class ScrumBoardColumn extends StatefulWidget {
  const ScrumBoardColumn({super.key, required String header});

  @override
  State<ScrumBoardColumn> createState() => _ScrumBoardColumnState();
}

class _ScrumBoardColumnState extends State<ScrumBoardColumn> {
  List<ScrumBoardWorkItem> list = List.generate(
      2,(index) => ScrumBoardWorkItem(id: Random().nextInt(100),));
  //TODO Add callback function that removes a item from a the list..
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: DragTarget<int>(
          onAccept: (data) => {
            if(!list.any((x) => x.id == data)){
              setState(() {
                list.add(ScrumBoardWorkItem(
                    id: data, ));
              })
            }
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
