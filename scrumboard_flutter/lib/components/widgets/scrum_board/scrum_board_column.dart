import 'package:flutter/material.dart';
import 'package:scrumboard_client/scrumboard_client.dart';

import '../../../bloc/scrum_board_bloc.dart';
import '../../pages/sub_pages_helper.dart';
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
    return GestureDetector(
      onDoubleTap: () {
        _showColumnEditForm(context);
      },
      child: DragTarget<ScrumBoardWorkItem>(
        onAccept: (ScrumBoardWorkItem data) => {
          widget.bloc.eventSink.add(ScrumBoardMoveWorkItemEvent(
              data.id!, widget.scrumBoardColumn.id!, data.columnIndex)),
        },
        builder: (context, _, __) => Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
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
                          _showWorkItemEditForm(context);
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
                  itemCount: widget
                          .scrumBoardColumn.scrumboardColumnWorkItems?.length ??
                      0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        widget.bloc.eventSink.add(ScrumBoardDeleteColumnEvent(
                            widget.scrumBoardColumn.id!));
                      },
                      icon: const Icon(Icons.delete),
                      color: const Color(0xFF000A1F))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showWorkItemEditForm(BuildContext context) async {
    var returnedWorkItem =
        await SubPageHelper().awaitReturnFromWorkItemEditForm(context, null);
    if (returnedWorkItem == null) return;

    //UserId 0 represents unassigned.
    returnedWorkItem.responsibleUserId ??= 0;
    returnedWorkItem.scurmBoardColumnId = widget.scrumBoardColumn.id ?? 0;
    widget.bloc.eventSink.add(ScrumBoardAddWorkItemEvent(returnedWorkItem));
  }

  void _showColumnEditForm(BuildContext context) async {
    var returnedColumn = await SubPageHelper()
        .awaitReturnFromColumnEditForm(context, widget.scrumBoardColumn);
    if (returnedColumn == null) return;

    widget.bloc.eventSink.add(ScrumBoardEditColumnEvent(returnedColumn));
  }
}
