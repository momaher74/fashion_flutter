import 'package:fashion_flutter/features/addresses/data/model/address_model.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressActionLoading extends AddressState {}

class AddressLoaded extends AddressState {
  final List<AddressModel> addresses;
  AddressLoaded(this.addresses);
}

class AddressSingleLoaded extends AddressState {
  final AddressModel address;
  AddressSingleLoaded(this.address);
}

class AddressActionSuccess extends AddressState {
  final String message;
  AddressActionSuccess(this.message);
}

class AddressError extends AddressState {
  final String message;
  AddressError(this.message);
}
