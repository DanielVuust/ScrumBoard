import 'package:flutter/material.dart';
import 'package:scrumboard/bloc/scrumboard_column_bloc.dart';
import 'package:scrumboard/models/scrum_board_column_dao.dart';

import '../../models/scrum_board_work_item_dao.dart';
import 'scrum_board_draggable_work_item.dart';

class ScrumBoardColumn extends StatefulWidget {
  final ScrumBoardColumnDAO scrumBoardColumn;
  const ScrumBoardColumn({super.key, required this.scrumBoardColumn});

  @override
  State<ScrumBoardColumn> createState() => _ScrumBoardColumnState();
}

class _ScrumBoardColumnState extends State<ScrumBoardColumn> {
  //Used to change background when hovering item over drag target.
  Color backgroundColor = const Color.fromARGB(255, 213, 213, 213);

  @override
  Widget build(BuildContext context) {
    var bloc = ScrumboardColumnBloc(widget.scrumBoardColumn.workItems);
    return Container(
      padding: const EdgeInsets.all(4),
      child: DragTarget<ScrumBoardWorkItemDAO>(
        onWillAccept: (data) {
          //Sets backgorund color a bit darker on hover.
          backgroundColor = const Color.fromARGB(255, 182, 182, 182);
          //Returns true to show drag target is valid.
          return true;
        },
        onAccept: (data) => {
          //Adds the current widget to the column bloc.
          bloc.eventSink.add(ScrumboardColumnAddEvent(data)),
          //Resets the color to default.
          backgroundColor = const Color.fromARGB(255, 213, 213, 213),
        },
        onLeave: (data) =>
            //Resets the color to default.
            backgroundColor = const Color.fromARGB(255, 213, 213, 213),
        builder: (context, _, __) => 
            Container(
              padding: const EdgeInsets.all(8),
              color: backgroundColor,
              width: 200,
              height: 1100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.scrumBoardColumn.heading, textAlign: TextAlign.start, textScaleFactor: 2,),
                   Expanded(
                    child: StreamBuilder<List<ScrumBoardWorkItemDAO>>(
                      stream: bloc.items,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<ScrumBoardWorkItemDAO>> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.connectionState == ConnectionState.done) {
                          return const Text('done');
                        } else if (snapshot.hasError) {
                          return const Text('Error!');
                        } else {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return ScrumBoardDragableWorkItem(
                                  workItem: snapshot.data![index], bloc: bloc);
                            },
                            itemCount: snapshot.data!.length,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
