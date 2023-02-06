import 'package:flutter/material.dart';
import 'package:scrumboard_client/scrumboard_client.dart';

import '../../../bloc/scrum_board_bloc.dart';
import '../../pages/sub_pages_helper.dart';

class ScrumBoardWorkItemCardWidget extends StatelessWidget {
  final ScrumBoardWorkItem workItem;
  final ScrumBoardBloc bloc;
  const ScrumBoardWorkItemCardWidget(
      {super.key, required this.workItem, required this.bloc});

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    //TODO Remove and get users from DB.
    const List<String> users = [
      'User1',
      'User2',
      'User3',
      'User4',
      'User5',
    ];
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
              child: Text("Index:${workItem.columnIndex}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Id:${workItem.id}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(workItem.description.toString()),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ButtonBar(
                  children: [
                    DropdownButton(
                      focusColor: const Color(0xFF000A1F),
                      value: users.first,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: users.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: const TextStyle(
                              color: Color(0xFF000A1F),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // ignore: todo
                        //TODO Change user.
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
                )
              ],
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
