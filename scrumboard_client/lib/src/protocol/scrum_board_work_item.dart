/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class ScrumBoardWorkItem extends _i1.SerializableEntity {
  ScrumBoardWorkItem({
    this.id,
    required this.name,
    required this.scurmBoardColumnId,
    required this.description,
    this.responsibleUserId,
    required this.columnIndex,
  });

  factory ScrumBoardWorkItem.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ScrumBoardWorkItem(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      scurmBoardColumnId: serializationManager
          .deserialize<int>(jsonSerialization['scurmBoardColumnId']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      responsibleUserId: serializationManager
          .deserialize<int?>(jsonSerialization['responsibleUserId']),
      columnIndex: serializationManager
          .deserialize<int>(jsonSerialization['columnIndex']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  int scurmBoardColumnId;

  String description;

  int? responsibleUserId;

  int columnIndex;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'scurmBoardColumnId': scurmBoardColumnId,
      'description': description,
      'responsibleUserId': responsibleUserId,
      'columnIndex': columnIndex,
    };
  }
}
