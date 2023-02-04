import 'package:flutter/material.dart';

import '../../../models/scrum_board_work_item_dto.dart';

//This widget is statefull as it need to keep track of the current work item.
class ScrumBoardWorkItemEditFormWidget extends StatefulWidget {
  const ScrumBoardWorkItemEditFormWidget({super.key});

  @override
  State<ScrumBoardWorkItemEditFormWidget> createState() =>
      _ScrumBoardWorkItemEditFormWidgetState();
}

class _ScrumBoardWorkItemEditFormWidgetState
    extends State<ScrumBoardWorkItemEditFormWidget> {
  ScrumBoardWorkItemDTO workItemDTO = ScrumBoardWorkItemDTO(0, "", "");
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  initialValue: workItemDTO.id.toString(),
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Id for new work item',
                    labelText: 'Id *',
                  ),
                  validator: (String? value) {
                    int? i = int.tryParse(value ?? "0");
                    if (i != null) {
                      return null;
                    }

                    return "Not valid id, id should be a int";
                  },
                ),
                TextFormField(
                  initialValue: workItemDTO.name,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Name for new work item',
                    labelText: 'Name *',
                  ),
                  validator: (String? value) {
                    workItemDTO.name = value ?? "";
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: workItemDTO.description,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Description for new work item',
                    labelText: 'Description *',
                  ),
                  validator: (String? value) {
                    workItemDTO.description = value ?? "";
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: (() {
                      if (_formKey.currentState?.validate() ?? false) {
                        Navigator.pop(context, workItemDTO);
                      }
                    }),
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(color: Colors.amber),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
