import 'package:flutter/material.dart';
import 'package:super_app/grid_item.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Menu'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          4,
          (index) {
            return GridItem(index: index);
          },
        ),
      ),
    );
  }
}
