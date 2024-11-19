import 'package:flutter/material.dart';
import 'dart:math';

class FraseMotivacionalApp extends StatefulWidget {
  @override
  _FraseMotivacionalAppState createState() => _FraseMotivacionalAppState();
}

class _FraseMotivacionalAppState extends State<FraseMotivacionalApp> {
  List<String> frases = [];
  String fraseSorteada = '';

  void adicionarFrase(String novaFrase) {
    setState(() {
      frases.add(novaFrase);
    });
  }

  String sortearFrase() {
    if (frases.isEmpty) {
      return 'Adicione uma frase para sortear!';
    }
    final random = Random();
    final Aleatorio = random.nextInt(frases.length);
    return frases[Aleatorio];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        title: Text('Frase Motivacional de Hoje'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  String novaFrase = '';
                  return AlertDialog(
                    title: Text('Adicione uma nova frase'),
                    content: TextField(
                      onChanged: (value) {
                        novaFrase = value;
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          adicionarFrase(novaFrase);
                        },
                        child: Text('Adicionar'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ver frase do dia'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  fraseSorteada = sortearFrase();
                });
              },
              child: Text('Sortear'),
            ),
            Text(fraseSorteada),

          ],
        ),
      ),
    );
  }
}