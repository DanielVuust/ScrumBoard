import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scrumboard/bloc/scrumboard_column_bloc.dart';

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

  // final List<int> test2 = [2, 3, 4];
  var bloc = ScrumboardColumnBloc([2, 3, 4]);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: DragTarget<int>(
        onWillAccept: (data) {
          setState(() {
            color = const Color.fromARGB(255, 182, 182, 182);
          });
          return true;
        },
        onAccept: (data) => {
          bloc.eventSink.add(ScrumboardColumnAddEvent()),
          print("Dragged to ${widget.header}"),
          color = const Color.fromARGB(255, 213, 213, 213),
        },
        onLeave: (data) => setState(() {
          color = const Color.fromARGB(255, 213, 213, 213);
        }),
        builder: (context, _, __) => Container(
          padding: const EdgeInsets.all(8),
          color: color,
          width: 200,
          child:
              // StreamBuilder<List<int>>(
              //   stream: bloc.color,
              //   builder:
              //       (BuildContext context, AsyncSnapshot<List<int>> snapshot) {

              // print(snapshot);
              // if (snapshot.hasData) {
              //   dynamic e = snapshot.data!.first.toString();
              //   print(e);
              //   print(e);
              //   print("here " + e);

              //   return Text(snapshot.data!.toString());
              //   // return ScrumBoardWorkItem(
              //   //   id: snapshot.data!.first,
              //   // );
              // }
              // print("here32323");
              // return const ScrumBoardWorkItem(
              //   id: 0,
              // );
              // },

              ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return list[index];
            },
          ),
        ),
      ),
    );
  }
}
