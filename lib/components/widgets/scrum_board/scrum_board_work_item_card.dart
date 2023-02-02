import 'package:flutter/material.dart';
import 'package:scrumboard/models/scrum_board_work_item_dto.dart';

import '../../../bloc/scrum_board_column_bloc.dart';

class ScrumBoardWorkItemCard extends StatelessWidget {
  final ScrumBoardWorkItemDTO workItem;
  final ScrumboardColumnBloc bloc;
  const ScrumBoardWorkItemCard(
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
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
            child: Text(
              workItem.name,
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
            child: Text(workItem.description),
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
                            .add(ScrumBoardColumnRemoveEvent(workItem));
                      },
                      icon: const Icon(Icons.delete),
                      color: const Color(0xFF000A1F))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
