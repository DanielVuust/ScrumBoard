import 'package:flutter/material.dart';
import 'package:scrumboard_client/scrumboard_client.dart';

//This widget is statefull as it need to keep track of the current work item.
class ScrumBoardWorkItemEditFormWidget extends StatefulWidget {
  final ScrumBoardWorkItem workItem;
  const ScrumBoardWorkItemEditFormWidget({super.key, required this.workItem});

  @override
  State<ScrumBoardWorkItemEditFormWidget> createState() =>
      _ScrumBoardWorkItemEditFormWidgetState();
}

class _ScrumBoardWorkItemEditFormWidgetState
    extends State<ScrumBoardWorkItemEditFormWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 400,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 219, 219, 219),
          boxShadow: [
            BoxShadow(color: Color.fromRGBO(142, 142, 142, 0.5), blurRadius: 5)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: widget.workItem.name,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Name for new work item',
                    labelText: 'Name *',
                  ),
                  validator: (String? value) {
                    widget.workItem.name = value ?? "";
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: widget.workItem.description,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Description for new work item',
                    labelText: 'Description *',
                  ),
                  validator: (String? value) {
                    widget.workItem.description = value ?? "";
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: (() {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.pop(context, widget.workItem);
                    }
                  }),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text("Ok"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
