import 'package:dartz/dartz.dart';
import 'package:fashion_flutter/core/enums/request_enum.dart';
import 'package:fashion_flutter/core/services/api_services.dart';
import 'package:fashion_flutter/core/services/endpoints.dart';

abstract class AddressRepo {
  Future<Either> getAddresses();
  Future<Either> getAddressById({required String id});
  Future<Either> createAddress({required Map<String, dynamic> data});
  Future<Either> updateAddress({
    required String id,
    required Map<String, dynamic> data,
  });
  Future<Either> deleteAddress({required String id});
}

class AddressRepoImp extends AddressRepo {
  final ApiServices api;

  AddressRepoImp(this.api);

  @override
  Future<Either> getAddresses() {
    return api.request(
      type: RequestType.get,
      path: addressesEP,
      withAuth: true,
    );
  }

  @override
  Future<Either> getAddressById({required String id}) {
    return api.request(
      type: RequestType.get,
      path: '$addressesEP/$id',
      withAuth: true,
    );
  }

  @override
  Future<Either> createAddress({required Map<String, dynamic> data}) {
    return api.request(
      type: RequestType.post,
      path: addressesEP,
      data: data,
      withAuth: true,
    );
  }

  @override
  Future<Either> updateAddress({
    required String id,
    required Map<String, dynamic> data,
  }) {
    return api.request(
      type: RequestType.patch,
      path: '$addressesEP/$id',
      data: data,
      withAuth: true,
    );
  }

  @override
  Future<Either> deleteAddress({required String id}) {
    return api.request(
      type: RequestType.delete,
      path: '$addressesEP/$id',
      withAuth: true,
    );
  }
}
