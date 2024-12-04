import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../data/models/product_model.dart'; // Certifique-se de que o caminho está correto

class MenuCarousel extends StatelessWidget {
  final Future<List<Product>> futureItems;
  final IconData icon;
  final void Function(Product) onProductTap;

  const MenuCarousel({
    Key? key,
    required this.futureItems,
    required this.icon,
    required this.onProductTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
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
              height: 200,
              enableInfiniteScroll: false,
              viewportFraction: 0.35,
              enlargeCenterPage: true,
              autoPlay: false,
            ),
            items: items.map((product) {
              return GestureDetector(
                onTap: () => onProductTap(product),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: product.imageUrl != null &&
                                product.imageUrl!.isNotEmpty
                            ? NetworkImage(product.imageUrl!)
                            : null,
                        backgroundColor: Colors.grey,
                        child: product.imageUrl == null ||
                                product.imageUrl!.isEmpty
                            ? Icon(
                                icon,
                                size: 50,
                                color: Colors.white,
                              )
                            : null,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}
