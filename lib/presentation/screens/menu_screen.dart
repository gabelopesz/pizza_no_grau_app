import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../data/repositories/product_repository.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/menu_carousel.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  MenuScreenState createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  late final ProductRepository _productRepository;

  late Future<List<Map<String, String>>> pizzasSalgadas;
  late Future<List<Map<String, String>>> bebidas;
  late Future<List<Map<String, String>>> pizzasDoces;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _productRepository = ProductRepository();

    pizzasSalgadas = _fetchProductsByCategory('pizzasSalgadas');
    bebidas = _fetchProductsByCategory('bebidas');
    pizzasDoces = _fetchProductsByCategory('pizzasDoces');
  }

  Future<List<Map<String, String>>> _fetchProductsByCategory(
      String category) async {
    try {
      final products = await _productRepository.fetchProducts();
      return products
          .where((product) => product.category == category)
          .map((product) => {
                'name': product.name,
                'price': product.price,
                'imageUrl': product.imageUrl ?? '',
              })
          .toList();
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

  // Ajustado para diminuir o espaçamento entre os banners e o carrossel de produtos
  Widget _buildCategoryBanner(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8.0, horizontal: 8.0), // Reduzido o padding vertical
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height *
            0.2, // Menor altura para o banner
        child: Image.asset(
          imagePath,
          fit: BoxFit
              .contain, // Garante que a imagem será visível sem ser cortada
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: const Color(0xFFFDF1E9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          // Banner: Pizzas Salgadas
          _buildCategoryBanner('lib/assets/images/pizzas_salgadas.png'),
          MenuCarousel(
              futureItems: pizzasSalgadas, icon: FontAwesomeIcons.pizzaSlice),

          // Banner: Bebidas
          _buildCategoryBanner('lib/assets/images/bebidas.png'),
          MenuCarousel(
              futureItems: bebidas, icon: FontAwesomeIcons.bottleWater),

          // Banner: Pizzas Doces
          _buildCategoryBanner('lib/assets/images/pizzas_doces.png'),
          MenuCarousel(
              futureItems: pizzasDoces, icon: FontAwesomeIcons.pizzaSlice),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
