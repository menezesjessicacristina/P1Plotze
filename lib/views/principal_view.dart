import 'package:flutter/material.dart';
import 'package:meu_login/funcoes.dart';
import 'package:meu_login/views/itens_view.dart';

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  TextEditingController listaCompras = TextEditingController();
  var nomeListaFormKey = GlobalKey<FormState>();
  List<String> lista = ['Material Escolar'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Lista de Compras'),
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 253, 238, 99),
        ),
        body: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: const Color.fromARGB(255, 255, 252, 219),
              shadowColor: Colors.amber,
              surfaceTintColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ItensView(nomeLista: lista[index])),
                    );
                  },
                  title: Text(lista[index]),
                ),
              ),
            );
          },
        ),
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return novaLista();
                });
          },
          label: const Text(
            'Nova Lista',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          icon: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: const Color.fromARGB(255, 253, 238, 99),
        ),
      ),
    );
  }

  AlertDialog novaLista() {
    return AlertDialog(
      elevation: 0,
      actionsAlignment: MainAxisAlignment.spaceBetween,
      title: const Text(
        'Nova Lista',
        textAlign: TextAlign.center,
      ),
      content: Form(
        key: nomeListaFormKey,
        child: Funcoes().campodeformulario(listaCompras, 'Nome da Lista', null),
      ),
      actions: [
        TextButton(
          onPressed: () {
            listaCompras.text = '';
            Navigator.pop(context);
          },
          child: const Text("Cancelar"),
        ),
        TextButton(
          onPressed: () {
            debugPrint(listaCompras.text);
            if (nomeListaFormKey.currentState!.validate()) {
              setState(() {
                lista.add(listaCompras.text);
              });
              listaCompras.text = '';
              Navigator.pop(context);
            }
          },
          child: const Text("Adicionar"),
        ),
      ],
    );
  }
}
