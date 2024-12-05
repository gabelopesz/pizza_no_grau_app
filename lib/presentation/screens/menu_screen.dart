import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../data/models/product_model.dart';
import '../../data/repositories/product_repository.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/menu_carousel.dart';
import 'product_detail_screen.dart';
import '../widgets/base_scaffold.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  MenuScreenState createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  late final ProductRepository _productRepository;
  late Future<List<Product>> pizzasSalgadas;
  late Future<List<Product>> bebidas;
  late Future<List<Product>> pizzasDoces;
  int _selectedIndex = 0; // Define o índice inicial para Home

  @override
  void initState() {
    super.initState();
    _productRepository = ProductRepository();
    pizzasSalgadas = _fetchProductsByCategory('pizzasSalgadas');
    bebidas = _fetchProductsByCategory('bebidas');
    pizzasDoces = _fetchProductsByCategory('pizzasDoces');
  }

  Future<List<Product>> _fetchProductsByCategory(String category) async {
    try {
      final products = await _productRepository.fetchProducts();
      return products.where((product) => product.category == category).toList();
    } catch (e) {
      log('Error fetching products for category $category: $e');
      return [];
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.pushNamed(context, '/cart');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/order-history');
    }
  }

  Widget _buildCategoryBanner(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.2,
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'banner': 'lib/assets/images/pizzas_salgadas.png',
        'futureItems': pizzasSalgadas,
        'icon': FontAwesomeIcons.pizzaSlice,
      },
      {
        'banner': 'lib/assets/images/bebidas.png',
        'futureItems': bebidas,
        'icon': FontAwesomeIcons.bottleWater,
      },
      {
        'banner': 'lib/assets/images/pizzas_doces.png',
        'futureItems': pizzasDoces,
        'icon': FontAwesomeIcons.pizzaSlice,
      },
    ];

    return BaseScaffold(
      title: 'Menu',
      selectedIndex: _selectedIndex, // Passando o selectedIndex
      onItemTapped: _onItemTapped, // Passando a função de navegação
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategoryBanner(category['banner']),
              MenuCarousel(
                futureItems: category['futureItems'] as Future<List<Product>>,
                icon: category['icon'],
                onProductTap: (product) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailScreen(product: product),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
