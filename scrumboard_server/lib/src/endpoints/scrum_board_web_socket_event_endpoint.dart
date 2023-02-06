import 'package:scrumboard_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ScrumBoardWebSocketEvent extends Endpoint {
  @override
  Future<void> streamOpened(StreamingSession session) async {
    print("Streamed Opened");
    session.messages.addListener("Scrumboard", (update) {
      sendStreamMessage(session, update);
    });
  }

  @override
  Future<void> handleStreamMessage(
      StreamingSession session, SerializableEntity object) async {
    print("Handling Stream Message");
    print("Object to handle: ${object.toString()}");

    session.messages
        .postMessage("Scrumboard", User(firstName: "test2", lastName: "test2"));
  }

  @override
  Future<void> streamClosed(StreamingSession session) async {
    super.streamClosed(session);
    print("Streamed Closed");
  }
}
