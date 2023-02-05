import 'package:flutter/material.dart';
import 'package:scrumboard_client/scrumboard_client.dart';

import '../../../bloc/scrum_board_bloc.dart';
import '../../pages/new_scrum_board_work_item.dart';
import 'scrum_board_draggable_work_item.dart';

class ScrumBoardColumnWidget extends StatefulWidget {
  final ScrumBoardColumn scrumBoardColumn;
  final ScrumBoardBloc bloc;
  const ScrumBoardColumnWidget(
      {super.key, required this.scrumBoardColumn, required this.bloc});

  @override
  State<ScrumBoardColumnWidget> createState() => _ScrumBoardColumnWidgetState();
}

class _ScrumBoardColumnWidgetState extends State<ScrumBoardColumnWidget> {
  //Used to change background when hovering item over drag target.
  Color backgroundColor = const Color.fromARGB(255, 213, 213, 213);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Container(
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
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ScrumBoardDragableWorkItemWidget(
                      workItem: widget
                          .scrumBoardColumn.scrumboardColumnWorkItems![index],
                      bloc: widget.bloc);
                },
                itemCount:
                    widget.scrumBoardColumn.scrumboardColumnWorkItems?.length ??
                        0,
              ),
              // child: StreamBuilder<ScrumBoard>(
              //   stream: widget.bloc.state-,
              //   builder:
              //       (BuildContext context, AsyncSnapshot<ScrumBoard> snapshot) {
              //     scrumBoardColumn.scrumboardColumnWorkItems;
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return const SizedBox(
              //         height: 200,
              //         width: 100,
              //         child: CircularProgressIndicator(),
              //       );
              //     } else if (snapshot.connectionState == ConnectionState.done) {
              //       return const Text('done');
              //     } else if (snapshot.hasError) {
              //       return const Text('Error!');
              //     } else {
              //       return ListView.builder(
              //         key: Key(snapshot.data!.id.toString()),
              //         itemBuilder: (context, index) {
              //           return ScrumBoardDragableWorkItemWidget(
              //               key: Key(snapshot
              //                   .data!.scrumboardColumnWorkItems![index].id
              //                   .toString()),
              //               workItem: snapshot
              //                   .data!.scrumboardColumnWorkItems![index],
              //               bloc: bloc);
              //         },
              //         itemCount:
              //             snapshot.data!.scrumboardColumnWorkItems!.length,
              //       );
              //     }
              //   },
              // ),
            ),
          ],
        ),
      ),
    );
  }

  void _awaitReturnFromWorkItemEditForm(BuildContext context) async {
    final ScrumBoardWorkItem workItem = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NewScrumBoardWorkItem(),
      ),
    );
    workItem.scurmBoardColumnId = widget.scrumBoardColumn.id;
    widget.bloc.eventSink.add(ScrumBoardAddWorkItemEvent(workItem));
  }
}
