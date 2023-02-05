/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class ScrumBoard extends _i1.TableRow {
  ScrumBoard({
    int? id,
    this.boardNickname,
    this.scrumBoardColumns,
  }) : super(id);

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

  static final t = ScrumBoardTable();

  String? boardNickname;

  List<_i2.ScrumBoardColumn>? scrumBoardColumns;

  @override
  String get tableName => 'scrum_board';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'boardNickname': boardNickname,
      'scrumBoardColumns': scrumBoardColumns,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'boardNickname': boardNickname,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'boardNickname': boardNickname,
      'scrumBoardColumns': scrumBoardColumns,
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
      case 'boardNickname':
        boardNickname = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<ScrumBoard>> find(
    _i1.Session session, {
    ScrumBoardExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ScrumBoard>(
      where: where != null ? where(ScrumBoard.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ScrumBoard?> findSingleRow(
    _i1.Session session, {
    ScrumBoardExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<ScrumBoard>(
      where: where != null ? where(ScrumBoard.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ScrumBoard?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<ScrumBoard>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ScrumBoardExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ScrumBoard>(
      where: where(ScrumBoard.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    ScrumBoard row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    ScrumBoard row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    ScrumBoard row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ScrumBoardExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ScrumBoard>(
      where: where != null ? where(ScrumBoard.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ScrumBoardExpressionBuilder = _i1.Expression Function(ScrumBoardTable);

class ScrumBoardTable extends _i1.Table {
  ScrumBoardTable() : super(tableName: 'scrum_board');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final boardNickname = _i1.ColumnString('boardNickname');

  @override
  List<_i1.Column> get columns => [
        id,
        boardNickname,
      ];
}

@Deprecated('Use ScrumBoardTable.t instead.')
ScrumBoardTable tScrumBoard = ScrumBoardTable();
