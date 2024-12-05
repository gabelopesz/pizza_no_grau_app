import 'package:flutter/material.dart';
import '../../data/models/address_model.dart';
import '../../domain/usecases/manage_address.dart';
import '../../data/repositories/address_repository.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late ManageAddress _manageAddress;
  late Future<List<Address>> _addressesFuture;

  @override
  void initState() {
    super.initState();
    _manageAddress = ManageAddress(AddressRepository());
    _addressesFuture = _manageAddress.getAddresses();
  }

  // Função para exibir os endereços
  void _loadAddresses() async {
    setState(() {
      _addressesFuture = _manageAddress.getAddresses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Endereços'),
      ),
      body: FutureBuilder<List<Address>>(
        future: _addressesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum endereço cadastrado.'));
          } else {
            final addresses = snapshot.data!;
            return ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                final address = addresses[index];
                return ListTile(
                  title: Text('${address.street}, ${address.city}'),
                  subtitle: Text('${address.postalCode}, ${address.country}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      await _manageAddress.removeAddress(address.id);
                      _loadAddresses(); // Atualiza a lista após remoção
                    },
                  ),
                  onTap: () {
                    // Lógica para marcar o endereço como selecionado
                    // para o fechamento do pedido
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navega para uma tela de adicionar novo endereço
          Navigator.pushNamed(context, '/add-address');
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xFFE9524D),
      ),
    );
  }
}
