import 'package:flutter/material.dart';
import 'package:scrumboard/bloc/scrum_board_column_bloc.dart';
import 'package:scrumboard/components/pages/new_scrum_board_work_item.dart';
import 'package:scrumboard/models/scrum_board_column_dto.dart';

import '../../../models/scrum_board_work_item_dto.dart';
import 'scrum_board_draggable_work_item.dart';

class ScrumBoardColumn extends StatefulWidget {
  final ScrumBoardColumnDTO scrumBoardColumn;
  const ScrumBoardColumn({super.key, required this.scrumBoardColumn});

  @override
  State<ScrumBoardColumn> createState() =>
      _ScrumBoardColumnState(scrumBoardColumn);
}

class _ScrumBoardColumnState extends State<ScrumBoardColumn> {
  //Used to change background when hovering item over drag target.
  Color backgroundColor = const Color.fromARGB(255, 213, 213, 213);

  final ScrumBoardColumnDTO scrumBoardColumnDTO;
  _ScrumBoardColumnState(this.scrumBoardColumnDTO) {
    bloc = ScrumboardColumnBloc(scrumBoardColumnDTO);
  }
  late ScrumboardColumnBloc bloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: DragTarget<ScrumBoardWorkItemDTO>(
        onWillAccept: (data) {
          //Sets backgorund color a bit darker on hover.
          backgroundColor = const Color.fromARGB(255, 182, 182, 182);
          //Returns true to show drag target is valid.
          return true;
        },
        onAccept: (data) => {
          //Adds the current widget to the column bloc.
          bloc.eventSink.add(ScrumBoardColumnAddEvent(data)),
          //Resets the color to default.
          backgroundColor = const Color.fromARGB(255, 213, 213, 213),
        },
        onLeave: (data) =>
            //Resets the color to default.
            backgroundColor = const Color.fromARGB(255, 213, 213, 213),
        builder: (context, _, __) => Container(
          padding: const EdgeInsets.all(8),
          color: backgroundColor,
          width: 200,
          height: 1100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Text(
                      widget.scrumBoardColumn.heading,
                      textAlign: TextAlign.start,
                      textScaleFactor: 2,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                        alignment: Alignment.centerRight,
                        onPressed: () {
                          // bloc.eventSink.add(ScrumBoardColumnRemoveEvent(null));
                          _awaitReturnFromWorkItemEditForm(context);
                        },
                        icon: const Icon(Icons.add),
                        color: const Color(0xFF000A1F)),
                  )
                ],
              ),
              Expanded(
                child: StreamBuilder<ScrumBoardColumnDTO>(
                  stream: bloc.items,
                  builder: (BuildContext context,
                      AsyncSnapshot<ScrumBoardColumnDTO> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                        height: 200,
                        width: 100,
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return const Text('done');
                    } else if (snapshot.hasError) {
                      return const Text('Error!');
                    } else {
                      return ReorderableListView.builder(
                        key: Key(snapshot.data!.id.toString()),
                        itemBuilder: (context, index) {
                          return ScrumBoardDragableWorkItem(
                              key: Key(snapshot.data!.workItems[index].id
                                  .toString()),
                              workItem: snapshot.data!.workItems[index],
                              bloc: bloc);
                        },
                        itemCount: snapshot.data!.workItems.length,
                        onReorder: (int oldIndex, int newIndex) {},
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

  void _awaitReturnFromWorkItemEditForm(BuildContext context) async {
    final ScrumBoardWorkItemDTO result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NewScrumBoardWorkItem(),
      ),
    );
    bloc.eventSink.add(ScrumBoardColumnAddEvent(result));
  }
}
