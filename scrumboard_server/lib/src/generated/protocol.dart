/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'scrum_board.dart' as _i2;
import 'scrum_board_column.dart' as _i3;
import 'scrum_board_work_item.dart' as _i4;
import 'user.dart' as _i5;
import 'protocol.dart' as _i6;
import 'package:scrumboard_server/src/generated/scrum_board_column.dart' as _i7;
import 'package:scrumboard_server/src/generated/user.dart' as _i8;
import 'package:serverpod/protocol.dart' as _i9;
export 'scrum_board.dart';
export 'scrum_board_column.dart';
export 'scrum_board_work_item.dart';
export 'user.dart'; // ignore_for_file: equal_keys_in_map

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.ScrumBoard) {
      return _i2.ScrumBoard.fromJson(data, this) as T;
    }
    if (t == _i3.ScrumBoardColumn) {
      return _i3.ScrumBoardColumn.fromJson(data, this) as T;
    }
    if (t == _i4.ScrumBoardWorkItem) {
      return _i4.ScrumBoardWorkItem.fromJson(data, this) as T;
    }
    if (t == _i5.User) {
      return _i5.User.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.ScrumBoard?>()) {
      return (data != null ? _i2.ScrumBoard.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.ScrumBoardColumn?>()) {
      return (data != null ? _i3.ScrumBoardColumn.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i4.ScrumBoardWorkItem?>()) {
      return (data != null ? _i4.ScrumBoardWorkItem.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i5.User?>()) {
      return (data != null ? _i5.User.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<List<_i6.ScrumBoardColumn>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i6.ScrumBoardColumn>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i6.ScrumBoardWorkItem>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i6.ScrumBoardWorkItem>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i7.ScrumBoardColumn>) {
      return (data as List)
          .map((e) => deserialize<_i7.ScrumBoardColumn>(e))
          .toList() as dynamic;
    }
    if (t == List<_i8.User>) {
      return (data as List).map((e) => deserialize<_i8.User>(e)).toList()
          as dynamic;
    }
    try {
      return _i9.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.ScrumBoard) {
      return 'ScrumBoard';
    }
    if (data is _i3.ScrumBoardColumn) {
      return 'ScrumBoardColumn';
    }
    if (data is _i4.ScrumBoardWorkItem) {
      return 'ScrumBoardWorkItem';
    }
    if (data is _i5.User) {
      return 'User';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'ScrumBoard') {
      return deserialize<_i2.ScrumBoard>(data['data']);
    }
    if (data['className'] == 'ScrumBoardColumn') {
      return deserialize<_i3.ScrumBoardColumn>(data['data']);
    }
    if (data['className'] == 'ScrumBoardWorkItem') {
      return deserialize<_i4.ScrumBoardWorkItem>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i5.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i9.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i2.ScrumBoard:
        return _i2.ScrumBoard.t;
      case _i3.ScrumBoardColumn:
        return _i3.ScrumBoardColumn.t;
      case _i4.ScrumBoardWorkItem:
        return _i4.ScrumBoardWorkItem.t;
      case _i5.User:
        return _i5.User.t;
    }
    return null;
  }
}
