import 'package:flutter/material.dart';

import '../model/modelo_contatos.dart';

class Contatos extends StatelessWidget {
  Contatos({Key? key}) : super(key: key);

  @override
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerTelefone = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criando contato"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Nome:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              maxLength: 15,
              controller: controllerName,
              decoration: InputDecoration(
                hintText: "George",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Telefone:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 9,
              controller: controllerTelefone,
              decoration: InputDecoration(
                hintText: "981635005",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () {
                if(controllerTelefone.text != null && controllerName != null) {
                  final String nome = controllerName.text;
                  final int telefone = int.parse(controllerTelefone.text);
                  final ModeloContato modeloContato = ModeloContato(Nome: nome, Telefone: telefone);
                  Navigator.pop(context, modeloContato);
                } else {
                  print("não foi possivel fazer o parse de controllerTelefone e controllerNome");
                }
              },
              child: const Text("Criar contato", style: TextStyle(fontSize: 18),),
            ),
          ],
        ),
      ),
    );
  }
}