import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../themes/my_colors.dart'; // Certifique-se de ter uma paleta de cores definida

class MenuCarousel extends StatelessWidget {
  final Future<List<Map<String, String>>> futureItems;
  final IconData icon;

  const MenuCarousel({
    Key? key,
    required this.futureItems,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, String>>>(
      future: futureItems,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No items available'));
        } else {
          final items = snapshot.data!;
          return CarouselSlider(
            options: CarouselOptions(
              height: 200, // Ajuste de altura para o carrossel
              enableInfiniteScroll: false,
              viewportFraction:
                  0.35, // Ajuste para ter mais espaçamento entre os itens
              enlargeCenterPage: true,
              autoPlay: false,
            ),
            items: items.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: MyColors.redPrimary,
                          child: Icon(
                            icon,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['name']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: MyColors.textColor,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          );
        }
      },
    );
  }
}
