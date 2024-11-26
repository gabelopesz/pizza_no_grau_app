import 'package:flutter/material.dart';
import '../../data/models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String selectedSize = "Grande (Tamanho G)";
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedido'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem do Produto
            Container(
              padding: const EdgeInsets.all(16.0),
              color: const Color(0xFFFDF1E9), // Fundo claro similar à imagem
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: product.imageUrl != null
                    ? Image.network(
                        product.imageUrl!,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        height: 250,
                        width: double.infinity,
                        color: Colors.grey[200],
                        child: const Icon(Icons.image, size: 50),
                      ),
              ),
            ),
            const SizedBox(height: 16),

            // Detalhes do Produto
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nome do Produto
                  Text(
                    'Produto',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Ingredientes
                  const Text(
                    'Ingredientes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 16),

                  // Tamanho
                  const Text(
                    'Tamanho',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  DropdownButton<String>(
                    value: selectedSize,
                    onChanged: (value) {
                      setState(() {
                        selectedSize = value!;
                      });
                    },
                    items: [
                      'Pequeno (Tamanho P)',
                      'Médio (Tamanho M)',
                      'Grande (Tamanho G)'
                    ]
                        .map((size) => DropdownMenuItem<String>(
                              value: size,
                              child: Text(size),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 16),

                  // Quantidade e Preço
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Controle de Quantidade
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) quantity--;
                              });
                            },
                          ),
                          Text(
                            '$quantity',
                            style: const TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                          ),
                        ],
                      ),
                      // Preço
                      Text(
                        'R\$ ${(product.price * quantity).toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFE9524D), // Vermelho da paleta
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Botão Adicionar ao Carrinho
                  ElevatedButton.icon(
                    onPressed: () {
                      // Lógica para adicionar ao carrinho
                    },
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text('Adicionar ao Carrinho'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFFE9524D), // Vermelho da paleta
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
