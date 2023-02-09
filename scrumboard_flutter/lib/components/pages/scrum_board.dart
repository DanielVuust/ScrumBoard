import 'package:flutter/material.dart';
import 'package:scrumboard_client/scrumboard_client.dart';
import 'package:scrumboard_flutter/components/pages/sub_pages_helper.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import '../../bloc/scrum_board_bloc.dart';
import '../../logging.dart';
import '../widgets/scrum_board/scrum_board_column.dart';

class ScrumBoardPage extends StatefulWidget {
  final int scrumBoardId;
  const ScrumBoardPage({super.key, required this.scrumBoardId});

  @override
  State<ScrumBoardPage> createState() => _ScrumBoardPageState();
}

class _ScrumBoardPageState extends State<ScrumBoardPage> {
  var client = Client('http://10.0.2.2:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();

  var scrumBoardBloc = ScrumBoardBloc();
  @override
  void initState() {
    super.initState();
    try {
      scrumBoardBloc.eventSink
          .add(ScrumBoardGetInitialValueEvent(widget.scrumBoardId));
    } catch (e) {
      print(e);
    }
  }

  final log = logger(ScrumBoardPage);
  @override
  Widget build(BuildContext context) {
    log.d("Building Scrum Board");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scrum Board"),
      ),
      body: StreamBuilder<ScrumBoardState>(
        stream: scrumBoardBloc.scrumBoard,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              height: 200,
              width: 100,
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return const Text('done');
          } else if (snapshot.hasError) {
            return const Text('Error!');
          } else if (snapshot.data == null) {
            return const Text('no Data');
          } else if (snapshot.data?.scrumBoard.scrumBoardColumns == null) {
            return const Text('no scrumBoardColumns');
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              key: Key(snapshot.data!.scrumBoard.id.toString()),
              itemBuilder: (context, index) {
                return ScrumBoardColumnWidget(
                  scrumBoardColumn:
                      snapshot.data!.scrumBoard.scrumBoardColumns![index],
                  bloc: scrumBoardBloc,
                );
              },
              itemCount: snapshot.data!.scrumBoard.scrumBoardColumns!.length,
            );
          }
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () async {
              _showColumnEditForm(context);
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  void _showColumnEditForm(BuildContext context) async {
    var returnedColumn =
        await SubPageHelper().awaitReturnFromColumnEditForm(context, null);
    if (returnedColumn == null) return;

    returnedColumn.scrumBoardId = scrumBoardBloc.state.scrumBoard.id;
    scrumBoardBloc.eventSink.add(ScrumBoardAddColumnEvent(returnedColumn));
  }
}
