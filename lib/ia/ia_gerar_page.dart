import 'package:flutter/material.dart';

class IaGerarPage extends StatefulWidget {
  const IaGerarPage({super.key});

  @override
  State<IaGerarPage> createState() => _IaGerarPageState();
}

class _IaGerarPageState extends State<IaGerarPage> {
  final TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Gerar Imagem"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 300,
              ),
              TextField(
                controller: _editingController,
                maxLines: 5,
                maxLength: 300,
                decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    labelText: "Gerar Imagem",
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        print(_editingController.text);
                      },
                      style: const ButtonStyle(),
                      child: const Text('Gerar'),
                    ),
                  ))
            ],
          ),
        ));
  }
}
