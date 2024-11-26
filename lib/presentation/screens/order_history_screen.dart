import 'package:flutter/material.dart';
import 'package:pizza_no_grau_app/presentation/themes/my_colors.dart'; // A cor da paleta
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_no_grau_app/presentation/screens/menu_screen.dart'; // Importando a tela de menu
import '../widgets/bottom_navigation_bar.dart';

class OrderHistoryScreen extends StatefulWidget {
  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  int _selectedIndex = 2; // Define o índice inicial como Histórico de Pedidos

  final List<Map<String, dynamic>> orders = [
    {
      "id": "#04",
      "date": "Ago 25, 2024 - 19:35",
      "status": "Em preparação",
      "total": 85.50
    },
    {
      "id": "#03",
      "date": "Jun 20, 2024 - 20:30",
      "status": "Entregue",
      "total": 85.50
    },
    {
      "id": "#02",
      "date": "Fev 18, 2024 - 11:05",
      "status": "Entregue",
      "total": 70.50
    },
    {
      "id": "#01",
      "date": "Nov 11, 2023 - 21:46",
      "status": "Entregue",
      "total": 40.42
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navegação entre as telas
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/menu_screen');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/cart');
    } else if (index == 2) {
      // Ficar na mesma tela (Histórico de Pedidos)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        title: Text('Histórico de Pedidos',
            style: TextStyle(color: MyColors.grayText)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              var order = orders[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // Ícone de pizza
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: MyColors.redPrimary,
                            child: Icon(
                              FontAwesomeIcons.pizzaSlice, // Ícone de pizza
                              size: 30, // Tamanho do ícone
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('PEDIDO ${order["id"]}',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Text(order['date']),
                              SizedBox(height: 5),
                              Text(order['status'],
                                  style: TextStyle(
                                      color: order['status'] == "Em preparação"
                                          ? Colors.orange
                                          : Colors.green)),
                            ],
                          ),
                          Spacer(),
                          Text('R\$ ${order['total'].toStringAsFixed(2)}',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          // Botão Acompanhar Pedido
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                // Ação de acompanhar pedido
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColors.redPrimary,
                                padding: EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text(
                                'ACOMPANHAR PEDIDO',
                                style: TextStyle(
                                    color: MyColors.background,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          // Botão Repetir Pedido
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                // Ação de repetir pedido
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColors.redPrimary,
                                padding: EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text(
                                'REPETIR PEDIDO',
                                style: TextStyle(
                                    color: MyColors.background,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        // Adicionando o BottomNavigationBar
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
