import 'package:flutter/material.dart';
import 'package:scrumboard/models/scrum_board_work_item_dto.dart';
import 'package:scrumboard/components/widgets/scrum_board/scrum_board_work_item_card.dart';

import '../../../bloc/scrum_board_column_bloc.dart';

class ScrumBoardDragableWorkItem extends StatefulWidget {
  final ScrumBoardWorkItemDTO workItem;
  final ScrumboardColumnBloc bloc;
  const ScrumBoardDragableWorkItem(
      {super.key, required this.workItem, required this.bloc});
  

  @override
  State<ScrumBoardDragableWorkItem> createState() =>
      _ScrumBoardDragableWorkItemState();
}

class _ScrumBoardDragableWorkItemState
    extends State<ScrumBoardDragableWorkItem> {
      late double padding = 0;
  @override
  Widget build(BuildContext context) {
    return 
    // IntrinsicHeight(
    //   child: 
      Stack(
        children: [
          Container(
          margin: EdgeInsets.only(top: padding),
            // padding: EdgeInsets.only(top: widget.padding),
            child: Draggable<ScrumBoardWorkItemDTO>(
              onDragCompleted: () => {
                widget.bloc.eventSink
                    .add(ScrumBoardColumnRemoveEvent(widget.workItem))
              },
              data: widget.workItem,
              feedback: SizedBox(
                width: 200,
                child: ScrumBoardWorkItemCard(
                    workItem: widget.workItem, bloc: widget.bloc),
              ),
              //Is used to show where the workitems originally where by a box shoadow.
              childWhenDragging: Container(
                height: 100,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(142, 142, 142, 0.5), blurRadius: 5)
                  ],
                ),
              ),
              child: SizedBox(
                child: ScrumBoardWorkItemCard(
                  workItem: widget.workItem,
                  bloc: widget.bloc,
                ),
              ),
            ),
          ),
          DragTarget<ScrumBoardWorkItemDTO>(
              onAccept: (data) => {
                    //Adds the current widget to the column bloc.
                    widget.bloc.eventSink.add(ScrumBoardColumnReorderItemEvent(data, widget.workItem.index)),
      
                    setState(() {
                      padding = 0;
                    })
                  },
              onWillAccept: (data) {
                setState(() {
                  padding = 175;
                });
                return true;
              },
              onLeave: (data) {
                setState(() {
                  padding = 0;
                });
              },
              builder: (context, _, __) => const SizedBox(
                    width: 200,
                    height:100,
                  ),
                ),
        ],
      // ),
    );
  }
}
