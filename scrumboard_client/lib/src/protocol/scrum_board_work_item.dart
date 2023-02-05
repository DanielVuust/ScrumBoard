/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class ScrumBoardWorkItem extends _i1.SerializableEntity {
  ScrumBoardWorkItem({
    this.id,
    required this.name,
    this.scurmBoardColumnId,
    required this.description,
    this.responsibleUser,
    this.columnIndex,
  });

  factory ScrumBoardWorkItem.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ScrumBoardWorkItem(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      scurmBoardColumnId: serializationManager
          .deserialize<int?>(jsonSerialization['scurmBoardColumnId']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      responsibleUser: serializationManager
          .deserialize<_i2.User?>(jsonSerialization['responsibleUser']),
      columnIndex: serializationManager
          .deserialize<int?>(jsonSerialization['columnIndex']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  int? scurmBoardColumnId;

  String description;

  _i2.User? responsibleUser;

  int? columnIndex;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'scurmBoardColumnId': scurmBoardColumnId,
      'description': description,
      'responsibleUser': responsibleUser,
      'columnIndex': columnIndex,
    };
  }
}