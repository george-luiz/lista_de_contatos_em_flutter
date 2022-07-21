import 'package:flutter/material.dart';
import '../model/modelo_contatos.dart';
import 'contatos.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<ModeloContato> transferencia = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de contatos"),
      ),
      body: ListView.builder(
          itemCount: transferencia.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  leading: const Icon(Icons.account_circle_rounded),
                  title: Text(transferencia[index].Nome),
                  subtitle: Text("${transferencia[index].Telefone}"),
                  trailing: IconButton(onPressed: () {
                    setState((){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Alerta"),
                            content: const Text("Deseja excluir este contato?"),
                            actions: <Widget>[
                              ElevatedButton(
                                child: const Text("Não"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              ElevatedButton(onPressed: (){
                                setState((){
                                  transferencia.remove(transferencia[index]);
                                  Navigator.of(context).pop();
                                });
                              }, child: const Text("Sim"))
                            ],
                          );
                        },
                      );
                    });
                  }, icon: const Icon(Icons.cancel),)
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future = Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return Contatos();
          }));
          future.then((transferenciaRecebida) {
            debugPrint("chegou no then do future: ${transferenciaRecebida}");
            setState((){
              transferencia.add(transferenciaRecebida);
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}