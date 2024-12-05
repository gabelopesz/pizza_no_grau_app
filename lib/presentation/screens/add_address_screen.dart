import 'package:flutter/material.dart';
import '../../data/models/address_model.dart';
import '../../domain/usecases/manage_address.dart';
import '../../data/repositories/address_repository.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _countryController = TextEditingController();

  late ManageAddress _manageAddress;

  @override
  void initState() {
    super.initState();
    _manageAddress = ManageAddress(AddressRepository());
  }

  void _saveAddress() async {
    if (_formKey.currentState!.validate()) {
      final newAddress = Address(
        id: DateTime.now().toString(), // Gerar ID único, pode ser alterado
        street: _streetController.text,
        city: _cityController.text,
        postalCode: _postalCodeController.text,
        country: _countryController.text,
      );
      await _manageAddress.addAddress(newAddress);
      Navigator.pop(context); // Volta para a tela de endereços
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Endereço'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _streetController,
                decoration: const InputDecoration(labelText: 'Rua'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe a rua';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'Cidade'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe a cidade';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _postalCodeController,
                decoration: const InputDecoration(labelText: 'CEP'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o CEP';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _countryController,
                decoration: const InputDecoration(labelText: 'País'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o país';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: _saveAddress,
                  child: const Text('Salvar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE9524D),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
