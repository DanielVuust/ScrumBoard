/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:scrumboard_client/src/protocol/scrum_board_column.dart' as _i3;
import 'package:scrumboard_client/src/protocol/scrum_board.dart' as _i4;
import 'package:scrumboard_client/src/protocol/scrum_board_work_item.dart'
    as _i5;
import 'package:scrumboard_client/src/protocol/user.dart' as _i6;
import 'dart:io' as _i7;
import 'protocol.dart' as _i8;

class _EndpointScrumBoardColumn extends _i1.EndpointRef {
  _EndpointScrumBoardColumn(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'scrumBoardColumn';

  _i2.Future<List<_i3.ScrumBoardColumn>> getScrumBoardColumns(
          int scrumBoardId) =>
      caller.callServerEndpoint<List<_i3.ScrumBoardColumn>>(
        'scrumBoardColumn',
        'getScrumBoardColumns',
        {'scrumBoardId': scrumBoardId},
      );

  _i2.Future<void> insert(_i3.ScrumBoardColumn column) =>
      caller.callServerEndpoint<void>(
        'scrumBoardColumn',
        'insert',
        {'column': column},
      );

  _i2.Future<void> update(_i3.ScrumBoardColumn column) =>
      caller.callServerEndpoint<void>(
        'scrumBoardColumn',
        'update',
        {'column': column},
      );

  _i2.Future<void> delete(int id) => caller.callServerEndpoint<void>(
        'scrumBoardColumn',
        'delete',
        {'id': id},
      );
}

class _EndpointScrumBoard extends _i1.EndpointRef {
  _EndpointScrumBoard(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'scrumBoard';

  _i2.Future<_i4.ScrumBoard?> find(int scrumBoadId) =>
      caller.callServerEndpoint<_i4.ScrumBoard?>(
        'scrumBoard',
        'find',
        {'scrumBoadId': scrumBoadId},
      );

  _i2.Future<List<_i4.ScrumBoard>> getAll() =>
      caller.callServerEndpoint<List<_i4.ScrumBoard>>(
        'scrumBoard',
        'getAll',
        {},
      );
}

class _EndpointScrumBoardWebSocketEvent extends _i1.EndpointRef {
  _EndpointScrumBoardWebSocketEvent(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'scrumBoardWebSocketEvent';
}

class _EndpointScrumBoardWorkItem extends _i1.EndpointRef {
  _EndpointScrumBoardWorkItem(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'scrumBoardWorkItem';

  _i2.Future<void> delete(int id) => caller.callServerEndpoint<void>(
        'scrumBoardWorkItem',
        'delete',
        {'id': id},
      );

  _i2.Future<void> insert(_i5.ScrumBoardWorkItem workItem) =>
      caller.callServerEndpoint<void>(
        'scrumBoardWorkItem',
        'insert',
        {'workItem': workItem},
      );

  _i2.Future<void> update(_i5.ScrumBoardWorkItem workItem) =>
      caller.callServerEndpoint<void>(
        'scrumBoardWorkItem',
        'update',
        {'workItem': workItem},
      );

  _i2.Future<void> updateColumnWorkItems(
    int workItemId,
    int movedToColumnId,
    int movedToColumnIndex,
  ) =>
      caller.callServerEndpoint<void>(
        'scrumBoardWorkItem',
        'updateColumnWorkItems',
        {
          'workItemId': workItemId,
          'movedToColumnId': movedToColumnId,
          'movedToColumnIndex': movedToColumnIndex,
        },
      );
}

class _EndpointUser extends _i1.EndpointRef {
  _EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<List<_i6.User>> getAllUsers() =>
      caller.callServerEndpoint<List<_i6.User>>(
        'user',
        'getAllUsers',
        {},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i7.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i8.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    scrumBoardColumn = _EndpointScrumBoardColumn(this);
    scrumBoard = _EndpointScrumBoard(this);
    scrumBoardWebSocketEvent = _EndpointScrumBoardWebSocketEvent(this);
    scrumBoardWorkItem = _EndpointScrumBoardWorkItem(this);
    user = _EndpointUser(this);
  }

  late final _EndpointScrumBoardColumn scrumBoardColumn;

  late final _EndpointScrumBoard scrumBoard;

  late final _EndpointScrumBoardWebSocketEvent scrumBoardWebSocketEvent;

  late final _EndpointScrumBoardWorkItem scrumBoardWorkItem;

  late final _EndpointUser user;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'scrumBoardColumn': scrumBoardColumn,
        'scrumBoard': scrumBoard,
        'scrumBoardWebSocketEvent': scrumBoardWebSocketEvent,
        'scrumBoardWorkItem': scrumBoardWorkItem,
        'user': user,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
