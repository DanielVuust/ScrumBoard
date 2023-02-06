import 'package:scrumboard_server/src/endpoints/scrum_board_endpoint.dart';
import 'package:scrumboard_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ScrumBoardWebSocketEvent extends Endpoint {
  @override
  Future<void> streamOpened(StreamingSession session) async {
    session.log("streamOpened");
    session.messages.addListener("Scrumboard", (update) {
      sendStreamMessage(session, update);
    });
  }

  @override
  Future<void> handleStreamMessage(
      StreamingSession session, SerializableEntity object) async {
    session.log("Handling Stream Message");
    session.log("Object to handle: ${object.toString()}");

    session.messages.postMessage("Scrumboard",
        (await ScrumBoardEndpoint().find(session, 1) as SerializableEntity));
  }

  @override
  Future<void> streamClosed(StreamingSession session) async {
    super.streamClosed(session);
    session.log("Stream Closed");
  }
}
