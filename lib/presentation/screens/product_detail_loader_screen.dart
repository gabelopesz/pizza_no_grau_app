import 'package:flutter/material.dart';
import '../../data/models/product.dart';
import '../../data/repositories/product_repository.dart';
import 'product_detail_screen.dart';

class ProductDetailLoaderScreen extends StatelessWidget {
  final int productId;
  final ProductRepository repository;

  const ProductDetailLoaderScreen({
    Key? key,
    required this.productId,
    required this.repository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carregando Produto')),
      body: FutureBuilder<Product>(
        future: repository.fetchProductById(productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ProductDetailScreen(product: snapshot.data!);
          } else {
            return const Center(child: Text('Produto não encontrado.'));
          }
        },
      ),
    );
  }
}
