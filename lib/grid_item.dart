import 'package:flutter/material.dart';
import 'package:super_app/herois/lista_herois_page.dart';
import 'package:super_app/ia/ia_gerar_page.dart';

class GridItem extends StatelessWidget {
  final int index;
  const GridItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final List<IconData> listaDeIcones = [
      Icons.flash_on,
      Icons.computer_rounded,
      Icons.museum,
      Icons.camera
    ];

    final List<String> tituloDaLista = [
      "Listagem de Heróis",
      "Inteligencia Artificial",
      "Atrações Turísticas",
      "Criar Atração"
    ];

    final List<Color> cores = [
      Colors.red,
      Colors.amber,
      Colors.blue,
      Colors.pinkAccent,
    ];

    void abrirCard() {
      switch (index) {
        case 0:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ListaHeroisPage()));
          break;
        case 1:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const IaGerarPage()));
          break;
        default:
          print('Inválido');
          break;
      }
    }

    return GestureDetector(
      onTap: abrirCard,
      child: Card(
        color: cores[index],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              listaDeIcones[index],
              size: 40,
            ),
            Text(tituloDaLista[index])
          ],
        ),
      ),
    );
  }
}
