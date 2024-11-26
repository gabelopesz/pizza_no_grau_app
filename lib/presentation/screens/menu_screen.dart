import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../themes/my_colors.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock data
    final pizzasSalgadas = [
      {'name': 'Marguerita'},
      {'name': '4 Queijos'},
      {'name': 'Calabresa'},
    ];

    final bebidas = [
      {'name': 'Coca-Cola'},
      {'name': 'Suco de Laranja'},
      {'name': 'Água'},
    ];

    final pizzasDoces = [
      {'name': 'Chocolate'},
      {'name': 'Brigadeiro'},
      {'name': 'Banana'},
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
            _buildCategoryBanner('lib/assets/images/pizzas_salgadas.png'),
            _buildCarousel(
                pizzasSalgadas, FontAwesomeIcons.pizzaSlice), // Pizza Icon

            // Banner: Bebidas
            _buildCategoryBanner('lib/assets/images/bebidas.png'),
            _buildCarousel(
                bebidas, FontAwesomeIcons.bottleWater), // Garrafa de água icone

            // Banner: Pizzas Doces
            _buildCategoryBanner('lib/assets/images/pizzas_doces.png'),
            _buildCarousel(pizzasDoces,
                FontAwesomeIcons.pizzaSlice), // Doce Icon (como exemplo)
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

  // Banner Widget - Ajustado para garantir que a imagem não seja cortada
  Widget _buildCategoryBanner(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      child: Container(
        width: double.infinity,
        height: 142, // Ajustado para o tamanho do banner
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit
                .contain, // Garante que a imagem seja exibida completamente sem corte
          ),
        ),
      ),
    );
  }

  // Carousel Widget - Ajustando as imagens para 136x140 e exibindo mais de uma imagem por página
  Widget _buildCarousel(List<Map<String, String>> items, IconData icon) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 170, // Ajustando a altura do carrossel
        enableInfiniteScroll: false, // Desabilitando o scroll infinito
        viewportFraction:
            0.3, // Ajuste para caber mais imagens na tela (espaçamento entre as imagens)
        enlargeCenterPage: true, // Ampliando o item central
        autoPlay: false, // Desabilitando o auto-play
      ),
      items: items.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 4.0), // Reduzindo o espaçamento entre as imagens
              child: Column(
                children: [
                  // Ícone redondo representando o produto
                  CircleAvatar(
                    radius: 50, // Ajuste o tamanho do ícone
                    backgroundColor: MyColors.redPrimary,
                    child: Icon(
                      icon, // Usando o ícone de pizza ou bebida
                      size: 50, // Ajustando o tamanho do ícone
                      color: Colors.white,
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
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
