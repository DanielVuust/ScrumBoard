/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class ScrumBoardColumn extends _i1.TableRow {
  ScrumBoardColumn({
    int? id,
    required this.heading,
    this.boardIndex,
    this.scrumBoardId,
    this.scrumboardColumnWorkItems,
  }) : super(id);

  factory ScrumBoardColumn.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ScrumBoardColumn(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      heading: serializationManager
          .deserialize<String>(jsonSerialization['heading']),
      boardIndex: serializationManager
          .deserialize<int?>(jsonSerialization['boardIndex']),
      scrumBoardId: serializationManager
          .deserialize<int?>(jsonSerialization['scrumBoardId']),
      scrumboardColumnWorkItems:
          serializationManager.deserialize<List<_i2.ScrumBoardWorkItem>?>(
              jsonSerialization['scrumboardColumnWorkItems']),
    );
  }

  static final t = ScrumBoardColumnTable();

  String heading;

  int? boardIndex;

  int? scrumBoardId;

  List<_i2.ScrumBoardWorkItem>? scrumboardColumnWorkItems;

  @override
  String get tableName => 'scrum_board_column';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'heading': heading,
      'boardIndex': boardIndex,
      'scrumBoardId': scrumBoardId,
      'scrumboardColumnWorkItems': scrumboardColumnWorkItems,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'heading': heading,
      'boardIndex': boardIndex,
      'scrumBoardId': scrumBoardId,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'heading': heading,
      'boardIndex': boardIndex,
      'scrumBoardId': scrumBoardId,
      'scrumboardColumnWorkItems': scrumboardColumnWorkItems,
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
      case 'heading':
        heading = value;
        return;
      case 'boardIndex':
        boardIndex = value;
        return;
      case 'scrumBoardId':
        scrumBoardId = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<ScrumBoardColumn>> find(
    _i1.Session session, {
    ScrumBoardColumnExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ScrumBoardColumn>(
      where: where != null ? where(ScrumBoardColumn.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ScrumBoardColumn?> findSingleRow(
    _i1.Session session, {
    ScrumBoardColumnExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<ScrumBoardColumn>(
      where: where != null ? where(ScrumBoardColumn.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ScrumBoardColumn?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<ScrumBoardColumn>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ScrumBoardColumnExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ScrumBoardColumn>(
      where: where(ScrumBoardColumn.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    ScrumBoardColumn row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    ScrumBoardColumn row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    ScrumBoardColumn row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ScrumBoardColumnExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ScrumBoardColumn>(
      where: where != null ? where(ScrumBoardColumn.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ScrumBoardColumnExpressionBuilder = _i1.Expression Function(
    ScrumBoardColumnTable);

class ScrumBoardColumnTable extends _i1.Table {
  ScrumBoardColumnTable() : super(tableName: 'scrum_board_column');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final heading = _i1.ColumnString('heading');

  final boardIndex = _i1.ColumnInt('boardIndex');

  final scrumBoardId = _i1.ColumnInt('scrumBoardId');

  @override
  List<_i1.Column> get columns => [
        id,
        heading,
        boardIndex,
        scrumBoardId,
      ];
}

@Deprecated('Use ScrumBoardColumnTable.t instead.')
ScrumBoardColumnTable tScrumBoardColumn = ScrumBoardColumnTable();
