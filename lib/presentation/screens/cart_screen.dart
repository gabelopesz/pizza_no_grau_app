import 'package:flutter/material.dart';
import 'package:pizza_no_grau_app/presentation/themes/my_colors.dart';
import 'order_history_screen.dart'; // Importando a tela de histórico
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController addressController = TextEditingController();

  final List<Map<String, dynamic>> cartItems = [
    {"product": "Pizza Marguerita - Tamanho G", "quantity": 1, "price": 68.00}
  ];

  double deliveryFee = 5.00;
  double discount = 0.00;
  double totalAmount = 0.0;

  @override
  void initState() {
    super.initState();
    calculateTotal();
  }

  void calculateTotal() {
    totalAmount = cartItems.fold(0.0, (double sum, Map<String, dynamic> item) {
          double price = item['price'] ?? 0.0;
          int quantity = item['quantity'] ?? 0;
          return sum + (price * quantity);
        }) +
        deliveryFee -
        discount;
  }

  void addProductToCart() {
    setState(() {
      cartItems.add({
        "product": "Pizza Calabresa - Tamanho G",
        "quantity": 1,
        "price": 70.00,
      });
      calculateTotal();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        title: Text('Carrinho', style: TextStyle(color: MyColors.grayText)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: [
              // Enviar para - Endereço
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Enviar para',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  hintText: 'Digite seu endereço...',
                ),
              ),
              SizedBox(height: 20),

              // Seção de pedidos
              Text(
                'Seus pedidos',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: MyColors.grayText),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  var item = cartItems[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                                'lib/assets/images/Pizza_marguerita.png'), // Imagem do produto
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['product'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Text('Quantidade: ${item['quantity']}'),
                            ],
                          ),
                          Spacer(),
                          Text('R\$ ${item['price']}',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),

              // Adicionar cupom
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.grayAddProduct,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: Text(
                  'ADICIONAR CUPOM - QR CODE',
                  style: TextStyle(color: MyColors.background),
                ),
              ),
              SizedBox(height: 20),

              // Total e Botão de Finalização
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Taxa de entrega',
                      style: TextStyle(color: MyColors.grayText)),
                  Text('R\$${deliveryFee.toStringAsFixed(2)}',
                      style: TextStyle(color: MyColors.redPrimary)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('R\$${totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: MyColors.redPrimary)),
                ],
              ),
              SizedBox(height: 20),

              // Finalizar pedido
              ElevatedButton(
                onPressed: () {
                  // Lógica de finalização de pedido
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.redPrimary,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'FINALIZAR PEDIDO - R\$${totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(color: MyColors.background),
                ),
              ),
              SizedBox(height: 20),

              // Botão flutuante de adicionar produto
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: addProductToCart,
                  backgroundColor: MyColors.redPrimary,
                  child: Icon(Icons.add, color: MyColors.background),
                ),
              ),

              // Botão para redirecionar para o histórico de pedidos
              SizedBox(height: 20), // Espaçamento
              ElevatedButton(
                onPressed: () {
                  // Redireciona para a tela de histórico de pedidos
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderHistoryScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.redPrimary,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'VIR PARA HISTÓRICO DE PEDIDOS',
                  style: TextStyle(color: MyColors.background),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
