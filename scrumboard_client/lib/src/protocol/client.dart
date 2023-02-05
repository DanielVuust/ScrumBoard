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
import 'dart:io' as _i6;
import 'protocol.dart' as _i7;

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
}

class _EndpointScrumBoard extends _i1.EndpointRef {
  _EndpointScrumBoard(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'scrumBoard';

  _i2.Future<List<_i3.ScrumBoardColumn>> get(int scrumBoardId) =>
      caller.callServerEndpoint<List<_i3.ScrumBoardColumn>>(
        'scrumBoard',
        'get',
        {'scrumBoardId': scrumBoardId},
      );

  _i2.Future<List<_i3.ScrumBoardColumn>> addMockData() =>
      caller.callServerEndpoint<List<_i3.ScrumBoardColumn>>(
        'scrumBoard',
        'addMockData',
        {},
      );

  _i2.Future<_i4.ScrumBoard?> find(int scrumBoadId) =>
      caller.callServerEndpoint<_i4.ScrumBoard?>(
        'scrumBoard',
        'find',
        {'scrumBoadId': scrumBoadId},
      );
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

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i6.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i7.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    scrumBoardColumn = _EndpointScrumBoardColumn(this);
    scrumBoard = _EndpointScrumBoard(this);
    scrumBoardWorkItem = _EndpointScrumBoardWorkItem(this);
  }

  late final _EndpointScrumBoardColumn scrumBoardColumn;

  late final _EndpointScrumBoard scrumBoard;

  late final _EndpointScrumBoardWorkItem scrumBoardWorkItem;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'scrumBoardColumn': scrumBoardColumn,
        'scrumBoard': scrumBoard,
        'scrumBoardWorkItem': scrumBoardWorkItem,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
