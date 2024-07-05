import 'package:flutter/material.dart';
import 'package:super_app/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Roboto'),
      home: const MyHomePage(title: '😄'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _passVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _userKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _passKey = GlobalKey<FormFieldState>();

  void _login() {
    if (_formKey.currentState!.validate()) {
      final String usuario = _userKey.currentState!.value;
      final String senha = _passKey.currentState!.value;

      if ((usuario == 'Lucas') && (senha == '123')) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MenuPage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
            dismissDirection: DismissDirection.up,
            content: const Text("Usuário ou senha inválidos!"),
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height - 120,
                left: 10,
                right: 10)
            // dismissDirection: DismissDirection.up,
            ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    key: _userKey,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Usuário',
                        prefixIcon: Icon(Icons.person)),
                    validator: (value) {
                      if ((value == null) || (value.isEmpty)) {
                        return 'O campo "Usuário" é obrigatório!';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    key: _passKey,
                    obscureText: !_passVisible,
                    validator: (value) {
                      if ((value == null) || (value.isEmpty)) {
                        return 'O campo "Senha" é obrigatório!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Senha',
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: GestureDetector(
                          onTapDown: (e) {
                            setState(() {
                              _passVisible = true;
                            });
                          },
                          onTapUp: (e) {
                            setState(() {
                              _passVisible = false;
                            });
                          },
                          child: Icon(
                            _passVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 15,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _login,
                      style: const ButtonStyle(),
                      child: const Text('Login'),
                    ),
                  )
                ],
              ),
            )));
  }
}
