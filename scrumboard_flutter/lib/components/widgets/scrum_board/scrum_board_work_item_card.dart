import 'package:flutter/material.dart';
import 'package:scrumboard_client/scrumboard_client.dart';

import '../../../bloc/scrum_board_bloc.dart';
import '../../pages/sub_pages_helper.dart';
import '../generics/user_widget/user_dropdown.dart';

class ScrumBoardWorkItemCardWidget extends StatelessWidget {
  final ScrumBoardWorkItem workItem;
  final ScrumBoardBloc bloc;
  const ScrumBoardWorkItemCardWidget(
      {super.key, required this.workItem, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        _showColumnEditForm(context);
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
              child: Text(
                workItem.name.toString(),
                textScaleFactor: 1.5,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Divider(
                color: Color.fromARGB(255, 100, 100, 100),
                height: 0,
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(workItem.description.toString()),
            ),
            
            UserDropDown(
              currentUserId: workItem.responsibleUserId,
              users: bloc.state.assignableUsers,
              onChanged: (p0) {
                bloc.eventSink.add(
                    ScrumBoardWorkItemChangeResposibleUser(
                        workItem, p0.id!));
              },
            ),
            IconButton(
              onPressed: () {
                bloc.eventSink
                    .add(ScrumBoardDeleteWorkItemEvent(workItem.id!));
              },
              icon: const Icon(Icons.delete),
              color: const Color(0xFF000A1F),
            ),
              
              
          ],
        ),
      ),
    );
  }

  void _showColumnEditForm(BuildContext context) async {
    var returnedWorkItem = await SubPageHelper()
        .awaitReturnFromWorkItemEditForm(context, workItem);
    if (returnedWorkItem == null) return;

    bloc.eventSink.add(ScrumBoardEditWorkItemEvent(returnedWorkItem));
  }
}
