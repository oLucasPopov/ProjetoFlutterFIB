import 'package:flutter/material.dart';
import 'package:super_app/api/api_service.dart';

class ListaHeroisPage extends StatefulWidget {
  const ListaHeroisPage({super.key});

  @override
  State<ListaHeroisPage> createState() => _ListaHeroisPageState();
}

class _ListaHeroisPageState extends State<ListaHeroisPage> {
  @override
  void initState() {
    ApiService().buscarHerois();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Listagem de Heróis"),
      ),
    );
  }
}
