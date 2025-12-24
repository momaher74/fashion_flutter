import 'package:dartz/dartz.dart';
import 'package:fashion_flutter/core/enums/request_enum.dart';
import 'package:fashion_flutter/core/services/api_services.dart';

import '../../../../core/services/endpoints.dart';

abstract class CheckoutInfoRepo {
  Future<Either> fetchCheckoutInfo() ;
}

class CheckoutInfoRepoImpl implements CheckoutInfoRepo {

  final ApiServices api ;

  CheckoutInfoRepoImpl({required this.api});

  @override
  Future<Either> fetchCheckoutInfo() async {
    return await api.request(type: RequestType.get, path: checkoutInfoEP) ;
  }




}
