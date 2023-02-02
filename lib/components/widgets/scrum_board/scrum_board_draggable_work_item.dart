import 'package:flutter/material.dart';
import 'package:scrumboard/models/scrum_board_work_item_dto.dart';
import 'package:scrumboard/components/widgets/scrum_board/scrum_board_work_item_card.dart';

import '../../../bloc/scrum_board_column_bloc.dart';

class ScrumBoardDragableWorkItem extends StatelessWidget {
  final ScrumBoardWorkItemDTO workItem;
  final ScrumboardColumnBloc bloc;
  const ScrumBoardDragableWorkItem(
      {super.key, required this.workItem, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Draggable<ScrumBoardWorkItemDTO>(
      onDragCompleted: () =>
          {bloc.eventSink.add(ScrumBoardColumnRemoveEvent(workItem))},
      data: workItem,
      feedback: SizedBox(
        width: 200,
        child: ScrumBoardWorkItemCard(workItem: workItem, bloc: bloc),
      ),
      //Is used to show where the workitems originally where by a box shoadow.
      childWhenDragging: Container(
        height: 100,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Color.fromRGBO(142, 142, 142, 0.5), blurRadius: 5)
          ],
        ),
      ),
      child: SizedBox(
        child: ScrumBoardWorkItemCard(
          workItem: workItem,
          bloc: bloc,
        ),
      ),
    );
  }
}
