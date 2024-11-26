import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock data
    final pizzasSalgadas = [
      {'name': 'Marguerita', 'image': 'lib/assets/images/pizza.jpg'},
      {'name': '4 Queijos', 'image': 'lib/assets/images/pizza.jpg'},
      {'name': 'Calabresa', 'image': 'lib/assets/images/pizza.jpg'},
    ];

    final bebidas = [
      {'name': 'Coca-Cola', 'image': '/assets/images/pizza.jpg'},
      {'name': 'Suco de Laranja', 'image': '/assets/images/pizza.jpg'},
      {'name': 'Água', 'image': '/assets/images/pizza.jpg'},
    ];

    final pizzasDoces = [
      {'name': 'Chocolate', 'image': '/assets/images/pizza.jpg'},
      {'name': 'Brigadeiro', 'image': '/assets/images/pizza.jpg'},
      {'name': 'Banana', 'image': '/assets/images/pizza.jpg'},
    ];

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner: Pizzas Salgadas
            _buildCategoryBanner(
                'assets/images/pizzas_salgadas.png', 'PIZZAS SALGADAS'),
            _buildCarousel(pizzasSalgadas),

            // Banner: Bebidas
            _buildCategoryBanner('assets/images/bebidas.png', 'BEBIDAS'),
            _buildCarousel(bebidas),

            // Banner: Pizzas Doces
            _buildCategoryBanner(
                'assets/images/pizzas_doces.png', 'PIZZAS DOCES'),
            _buildCarousel(pizzasDoces),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFE9524D),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Carrinho'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Configurações'),
        ],
      ),
    );
  }

  // Banner Widget
  Widget _buildCategoryBanner(String imagePath, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 10,
                  color: Colors.black,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Carousel Widget
  Widget _buildCarousel(List<Map<String, String>> items) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180,
        enableInfiniteScroll: false,
        viewportFraction: 0.6,
        enlargeCenterPage: true,
      ),
      items: items.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Column(
              children: [
                // Imagem do Produto
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    item['image']!,
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                // Nome do Produto
                Text(
                  item['name']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
