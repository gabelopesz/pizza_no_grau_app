import 'package:flutter/material.dart';
import 'package:pizza_no_grau_app/presentation/themes/my_colors.dart'; // A cor da paleta
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'order_history_screen.dart'; // Importando a tela de histórico de pedidos

class OrderHistoryScreen extends StatelessWidget {
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
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                                'lib/assets/images/Logo.png'), // Imagem do produto
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
    );
  }
}
