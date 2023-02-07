import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class UserEndpoing extends Endpoint {
  Future<List<User>> getAllUsers(Session session) async {
    return await User.find(session);
  }
}
