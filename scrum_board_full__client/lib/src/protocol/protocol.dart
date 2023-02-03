/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'scrum_board_column.dart' as _i2;
import 'scrum_board_work_item.dart' as _i3;
import 'user.dart' as _i4;
import 'protocol.dart' as _i5;
export 'scrum_board_column.dart';
export 'scrum_board_work_item.dart';
export 'user.dart';
export 'client.dart'; // ignore_for_file: equal_keys_in_map

class Protocol extends _i1.SerializationManager {
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
    if (t == _i2.ScrumBoardColumn) {
      return _i2.ScrumBoardColumn.fromJson(data, this) as T;
    }
    if (t == _i3.ScrumBoardWorkItem) {
      return _i3.ScrumBoardWorkItem.fromJson(data, this) as T;
    }
    if (t == _i4.User) {
      return _i4.User.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.ScrumBoardColumn?>()) {
      return (data != null ? _i2.ScrumBoardColumn.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i3.ScrumBoardWorkItem?>()) {
      return (data != null ? _i3.ScrumBoardWorkItem.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i4.User?>()) {
      return (data != null ? _i4.User.fromJson(data, this) : null) as T;
    }
    if (t == List<_i5.ScrumBoardWorkItem>) {
      return (data as List)
          .map((e) => deserialize<_i5.ScrumBoardWorkItem>(e))
          .toList() as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.ScrumBoardColumn) {
      return 'ScrumBoardColumn';
    }
    if (data is _i3.ScrumBoardWorkItem) {
      return 'ScrumBoardWorkItem';
    }
    if (data is _i4.User) {
      return 'User';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'ScrumBoardColumn') {
      return deserialize<_i2.ScrumBoardColumn>(data['data']);
    }
    if (data['className'] == 'ScrumBoardWorkItem') {
      return deserialize<_i3.ScrumBoardWorkItem>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i4.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
