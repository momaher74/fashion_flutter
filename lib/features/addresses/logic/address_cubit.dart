import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fashion_flutter/features/addresses/data/model/address_model.dart';
import 'package:fashion_flutter/features/addresses/data/repo/address_repo.dart';
import 'package:fashion_flutter/features/addresses/logic/address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddressRepo repo;

  AddressCubit(this.repo) : super(AddressInitial());

  List<AddressModel> addresses = [];

  // Get all addresses
  Future<void> getAddresses() async {
   
    emit(AddressLoading());
     print("Fetching addresses in AddressCubit");
    final result = await repo.getAddresses();

    result.fold(
      (error) {
        emit(AddressError(error.message));
      },
      (response) {
        try {
          final data = response['data'] as List;
          addresses = data.map((e) => AddressModel.fromJson(e)).toList();
          emit(AddressLoaded(addresses));
        } catch (e) {
          emit(AddressError('Failed to parse addresses: $e'));
        }
      },
    );
  }

  // Get single address
  Future<void> getAddressById(String id) async {
    if (isClosed) return;
    emit(AddressLoading());

    final result = await repo.getAddressById(id: id);

    result.fold(
      (error) {
        if (!isClosed) emit(AddressError(error.message));
      },
      (response) {
        try {
          final addressData = response['data'];
          final address = AddressModel.fromJson(addressData);
          if (!isClosed) emit(AddressSingleLoaded(address));
        } catch (e) {
          if (!isClosed) emit(AddressError('Failed to parse address: $e'));
        }
      },
    );
  }

  // Create address
  Future<void> createAddress(AddressModel address) async {
    if (isClosed) return;
    emit(AddressActionLoading());

    final result = await repo.createAddress(data: address.toJson());

    result.fold(
      (error) {
        if (!isClosed) emit(AddressError(error.message));
      },
      (response) {
        try {
          final addressData = response['data'];
          final newAddress = AddressModel.fromJson(addressData);
          addresses.add(newAddress);
          if (!isClosed)
            emit(AddressActionSuccess('Address added successfully'));
        } catch (e) {
          if (!isClosed) emit(AddressError('Failed to create address: $e'));
        }
      },
    );
  }

  // Update address
  Future<void> updateAddress(String id, AddressModel address) async {
    if (isClosed) return;
    emit(AddressActionLoading());

    final result = await repo.updateAddress(id: id, data: address.toJson());

    result.fold(
      (error) {
        if (!isClosed) emit(AddressError(error.message));
      },
      (response) {
        try {
          final addressData = response['data'];
          final updatedAddress = AddressModel.fromJson(addressData);

          // Update in local list
          final index = addresses.indexWhere((a) => a.id == id);
          if (index != -1) {
            addresses[index] = updatedAddress;
          }

          if (!isClosed)
            emit(AddressActionSuccess('Address updated successfully'));
        } catch (e) {
          if (!isClosed) emit(AddressError('Failed to update address: $e'));
        }
      },
    );
  }

  // Delete address
  Future<void> deleteAddress(String id) async {
    if (isClosed) return;
    emit(AddressActionLoading());

    final result = await repo.deleteAddress(id: id);

    result.fold(
      (error) {
        if (!isClosed) emit(AddressError(error.message));
      },
      (response) {
        addresses.removeWhere((a) => a.id == id);
        if (!isClosed)
          emit(AddressActionSuccess('Address deleted successfully'));
      },
    );
  }
}
