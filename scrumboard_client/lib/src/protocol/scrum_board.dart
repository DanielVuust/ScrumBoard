/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class ScrumBoard extends _i1.SerializableEntity {
  ScrumBoard({
    this.id,
    this.boardNickname,
    this.scrumBoardColumns,
  });

  factory ScrumBoard.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ScrumBoard(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      boardNickname: serializationManager
          .deserialize<String?>(jsonSerialization['boardNickname']),
      scrumBoardColumns:
          serializationManager.deserialize<List<_i2.ScrumBoardColumn>?>(
              jsonSerialization['scrumBoardColumns']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String? boardNickname;

  List<_i2.ScrumBoardColumn>? scrumBoardColumns;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'boardNickname': boardNickname,
      'scrumBoardColumns': scrumBoardColumns,
    };
  }
}
