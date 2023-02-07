/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class ScrumBoardWorkItem extends _i1.TableRow {
  ScrumBoardWorkItem({
    int? id,
    required this.name,
    required this.scurmBoardColumnId,
    required this.description,
    this.responsibleUserId,
    required this.columnIndex,
  }) : super(id);

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

  static final t = ScrumBoardWorkItemTable();

  String name;

  int scurmBoardColumnId;

  String description;

  int? responsibleUserId;

  int columnIndex;

  @override
  String get tableName => 'scrum_board_work_items';
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

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'name': name,
      'scurmBoardColumnId': scurmBoardColumnId,
      'description': description,
      'responsibleUserId': responsibleUserId,
      'columnIndex': columnIndex,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'name': name,
      'scurmBoardColumnId': scurmBoardColumnId,
      'description': description,
      'responsibleUserId': responsibleUserId,
      'columnIndex': columnIndex,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'name':
        name = value;
        return;
      case 'scurmBoardColumnId':
        scurmBoardColumnId = value;
        return;
      case 'description':
        description = value;
        return;
      case 'responsibleUserId':
        responsibleUserId = value;
        return;
      case 'columnIndex':
        columnIndex = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<ScrumBoardWorkItem>> find(
    _i1.Session session, {
    ScrumBoardWorkItemExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ScrumBoardWorkItem>(
      where: where != null ? where(ScrumBoardWorkItem.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ScrumBoardWorkItem?> findSingleRow(
    _i1.Session session, {
    ScrumBoardWorkItemExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<ScrumBoardWorkItem>(
      where: where != null ? where(ScrumBoardWorkItem.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ScrumBoardWorkItem?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<ScrumBoardWorkItem>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ScrumBoardWorkItemExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ScrumBoardWorkItem>(
      where: where(ScrumBoardWorkItem.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    ScrumBoardWorkItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    ScrumBoardWorkItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    ScrumBoardWorkItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ScrumBoardWorkItemExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ScrumBoardWorkItem>(
      where: where != null ? where(ScrumBoardWorkItem.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ScrumBoardWorkItemExpressionBuilder = _i1.Expression Function(
    ScrumBoardWorkItemTable);

class ScrumBoardWorkItemTable extends _i1.Table {
  ScrumBoardWorkItemTable() : super(tableName: 'scrum_board_work_items');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final name = _i1.ColumnString('name');

  final scurmBoardColumnId = _i1.ColumnInt('scurmBoardColumnId');

  final description = _i1.ColumnString('description');

  final responsibleUserId = _i1.ColumnInt('responsibleUserId');

  final columnIndex = _i1.ColumnInt('columnIndex');

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        scurmBoardColumnId,
        description,
        responsibleUserId,
        columnIndex,
      ];
}

@Deprecated('Use ScrumBoardWorkItemTable.t instead.')
ScrumBoardWorkItemTable tScrumBoardWorkItem = ScrumBoardWorkItemTable();
