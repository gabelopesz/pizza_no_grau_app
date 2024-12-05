import '../datasources/address_api.dart';
import '../../data/models/address_model.dart';

class AddressRepository {
  final AddressApi _api;

  AddressRepository() : _api = AddressApi();

  Future<List<Address>> getAddresses() => _api.fetchAddresses();

  Future<Address> addAddress(Address address) => _api.addAddress(address);

  Future<void> removeAddress(String id) => _api.removeAddress(id);
}
