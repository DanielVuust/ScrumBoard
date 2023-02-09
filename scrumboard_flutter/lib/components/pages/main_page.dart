import 'package:flutter/material.dart';
import 'package:scrumboard_client/scrumboard_client.dart';
import 'package:scrumboard_flutter/components/pages/scrum_board.dart';
import 'package:scrumboard_flutter/components/widgets/generics/link_widget/link.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var client = Client('http://10.0.2.2:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Scrum Board"),
        ),
        body: Center(
          child: FutureBuilder<List<ScrumBoard>>(
            future: client.scrumBoard.getAll(),
            builder: (BuildContext context,
                AsyncSnapshot<List<ScrumBoard>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(
                  height: 200,
                  width: 200,
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Text('Error!');
              } else if (snapshot.data == null) {
                return const Text('no Data');
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: LinkWidget(
                          onClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScrumBoardPage(
                                    scrumBoardId: snapshot.data![index].id!),
                              ),
                            );
                          },
                          linkText: snapshot.data![index].boardNickname),
                    );
                  },
                );
              }
            },
          ),
        ));
  }
}
