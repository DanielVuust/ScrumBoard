/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'dart:io' as _i3;
import 'protocol.dart' as _i4;

class _EndpointWorkItem extends _i1.EndpointRef {
  _EndpointWorkItem(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'workItem';

  _i2.Future<String> getWorkItems() => caller.callServerEndpoint<String>(
        'workItem',
        'getWorkItems',
        {},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i3.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i4.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    workItem = _EndpointWorkItem(this);
  }

  late final _EndpointWorkItem workItem;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {'workItem': workItem};
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
