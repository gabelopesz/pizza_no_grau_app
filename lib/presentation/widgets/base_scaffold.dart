import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BaseScaffold({
    Key? key,
    required this.body,
    required this.title,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}
