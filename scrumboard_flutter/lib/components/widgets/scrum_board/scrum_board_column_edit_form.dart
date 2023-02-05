import 'package:flutter/material.dart';
import 'package:scrumboard_client/scrumboard_client.dart';

class ScrumBoardColumnEditFormWidget extends StatefulWidget {
  final ScrumBoardColumn column;
  const ScrumBoardColumnEditFormWidget({super.key, required this.column});

  @override
  State<ScrumBoardColumnEditFormWidget> createState() =>
      _ScrumBoardColumnEditFormWidgetState();
}

class _ScrumBoardColumnEditFormWidgetState
    extends State<ScrumBoardColumnEditFormWidget> {
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
                  initialValue: widget.column.heading,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Column header',
                    labelText: 'Heading *',
                  ),
                  validator: (String? value) {
                    widget.column.heading = value ?? "";
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: (() {
                      if (_formKey.currentState?.validate() ?? false) {
                        Navigator.pop(context, widget.column);
                      }
                    }),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text("Create"),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
