/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/work_item_endpoint.dart' as _i2;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'workItem': _i2.WorkItemEndpoint()
        ..initialize(
          server,
          'workItem',
          null,
        )
    };
    connectors['workItem'] = _i1.EndpointConnector(
      name: 'workItem',
      endpoint: endpoints['workItem']!,
      methodConnectors: {
        'getWorkItems': _i1.MethodConnector(
          name: 'getWorkItems',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['workItem'] as _i2.WorkItemEndpoint)
                  .getWorkItems(session),
        )
      },
    );
  }
}
