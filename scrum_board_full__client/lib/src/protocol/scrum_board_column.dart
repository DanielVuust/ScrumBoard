/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class ScrumBoardColumn extends _i1.SerializableEntity {
  ScrumBoardColumn({
    this.id,
    required this.workItems,
    required this.heading,
    required this.boardIndex,
  });

  factory ScrumBoardColumn.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ScrumBoardColumn(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      workItems: serializationManager.deserialize<List<_i2.ScrumBoardWorkItem>>(
          jsonSerialization['workItems']),
      heading: serializationManager
          .deserialize<String>(jsonSerialization['heading']),
      boardIndex: serializationManager
          .deserialize<int>(jsonSerialization['boardIndex']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  List<_i2.ScrumBoardWorkItem> workItems;

  String heading;

  int boardIndex;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'workItems': workItems,
      'heading': heading,
      'boardIndex': boardIndex,
    };
  }
}
