import '../../data/repositories/address_repository.dart';
import '../../data/models/address_model.dart';

class ManageAddress {
  final AddressRepository repository;

  ManageAddress(this.repository);

  Future<List<Address>> getAddresses() async {
    return await repository.getAddresses();
  }

  Future<void> addAddress(Address address) async {
    await repository.addAddress(address);
  }

  Future<void> removeAddress(String addressId) async {
    await repository.removeAddress(addressId);
  }
}
