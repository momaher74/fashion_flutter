import 'package:dartz/dartz.dart';
import 'package:fashion_flutter/core/enums/request_enum.dart';
import 'package:fashion_flutter/core/services/api_services.dart';

import '../../../../core/services/endpoints.dart';

abstract class DiscoverRepo {
  Future<Either> discover({required Map<String, dynamic> q});
}

class DiscoverRepoImpl implements DiscoverRepo {
  final ApiServices api;

  DiscoverRepoImpl({required this.api});

  @override
  Future<Either> discover({required Map<String, dynamic> q}) {
    return api.request(type: RequestType.get, path: productsEP, query: q);
  }
}
