/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/scrum_board_column_endpoint.dart' as _i2;
import '../endpoints/scrum_board_endpoint.dart' as _i3;
import '../endpoints/scrum_board_web_socket_event_endpoint.dart' as _i4;
import '../endpoints/scrum_board_work_item_endpoint.dart' as _i5;
import '../endpoints/user_endpoint.dart' as _i6;
import 'package:scrumboard_server/src/generated/scrum_board_column.dart' as _i7;
import 'package:scrumboard_server/src/generated/scrum_board_work_item.dart'
    as _i8;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'scrumBoardColumn': _i2.ScrumBoardColumnEndpoint()
        ..initialize(
          server,
          'scrumBoardColumn',
          null,
        ),
      'scrumBoard': _i3.ScrumBoardEndpoint()
        ..initialize(
          server,
          'scrumBoard',
          null,
        ),
      'scrumBoardWebSocketEvent': _i4.ScrumBoardWebSocketEvent()
        ..initialize(
          server,
          'scrumBoardWebSocketEvent',
          null,
        ),
      'scrumBoardWorkItem': _i5.ScrumBoardWorkItemEndpoint()
        ..initialize(
          server,
          'scrumBoardWorkItem',
          null,
        ),
      'user': _i6.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
    };
    connectors['scrumBoardColumn'] = _i1.EndpointConnector(
      name: 'scrumBoardColumn',
      endpoint: endpoints['scrumBoardColumn']!,
      methodConnectors: {
        'getScrumBoardColumns': _i1.MethodConnector(
          name: 'getScrumBoardColumns',
          params: {
            'scrumBoardId': _i1.ParameterDescription(
              name: 'scrumBoardId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrumBoardColumn'] as _i2.ScrumBoardColumnEndpoint)
                  .getScrumBoardColumns(
            session,
            params['scrumBoardId'],
          ),
        ),
        'insert': _i1.MethodConnector(
          name: 'insert',
          params: {
            'column': _i1.ParameterDescription(
              name: 'column',
              type: _i1.getType<_i7.ScrumBoardColumn>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrumBoardColumn'] as _i2.ScrumBoardColumnEndpoint)
                  .insert(
            session,
            params['column'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'column': _i1.ParameterDescription(
              name: 'column',
              type: _i1.getType<_i7.ScrumBoardColumn>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrumBoardColumn'] as _i2.ScrumBoardColumnEndpoint)
                  .update(
            session,
            params['column'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrumBoardColumn'] as _i2.ScrumBoardColumnEndpoint)
                  .delete(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['scrumBoard'] = _i1.EndpointConnector(
      name: 'scrumBoard',
      endpoint: endpoints['scrumBoard']!,
      methodConnectors: {
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'scrumBoadId': _i1.ParameterDescription(
              name: 'scrumBoadId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrumBoard'] as _i3.ScrumBoardEndpoint).find(
            session,
            params['scrumBoadId'],
          ),
        ),
        'getAll': _i1.MethodConnector(
          name: 'getAll',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrumBoard'] as _i3.ScrumBoardEndpoint)
                  .getAll(session),
        ),
      },
    );
    connectors['scrumBoardWebSocketEvent'] = _i1.EndpointConnector(
      name: 'scrumBoardWebSocketEvent',
      endpoint: endpoints['scrumBoardWebSocketEvent']!,
      methodConnectors: {},
    );
    connectors['scrumBoardWorkItem'] = _i1.EndpointConnector(
      name: 'scrumBoardWorkItem',
      endpoint: endpoints['scrumBoardWorkItem']!,
      methodConnectors: {
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrumBoardWorkItem']
                      as _i5.ScrumBoardWorkItemEndpoint)
                  .delete(
            session,
            params['id'],
          ),
        ),
        'insert': _i1.MethodConnector(
          name: 'insert',
          params: {
            'workItem': _i1.ParameterDescription(
              name: 'workItem',
              type: _i1.getType<_i8.ScrumBoardWorkItem>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrumBoardWorkItem']
                      as _i5.ScrumBoardWorkItemEndpoint)
                  .insert(
            session,
            params['workItem'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'workItem': _i1.ParameterDescription(
              name: 'workItem',
              type: _i1.getType<_i8.ScrumBoardWorkItem>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrumBoardWorkItem']
                      as _i5.ScrumBoardWorkItemEndpoint)
                  .update(
            session,
            params['workItem'],
          ),
        ),
        'updateColumnWorkItems': _i1.MethodConnector(
          name: 'updateColumnWorkItems',
          params: {
            'workItemId': _i1.ParameterDescription(
              name: 'workItemId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'movedToColumnId': _i1.ParameterDescription(
              name: 'movedToColumnId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'movedToColumnIndex': _i1.ParameterDescription(
              name: 'movedToColumnIndex',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['scrumBoardWorkItem']
                      as _i5.ScrumBoardWorkItemEndpoint)
                  .updateColumnWorkItems(
            session,
            params['workItemId'],
            params['movedToColumnId'],
            params['movedToColumnIndex'],
          ),
        ),
      },
    );
    connectors['user'] = _i1.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'getAllUsers': _i1.MethodConnector(
          name: 'getAllUsers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i6.UserEndpoint).getAllUsers(session),
        )
      },
    );
  }
}
