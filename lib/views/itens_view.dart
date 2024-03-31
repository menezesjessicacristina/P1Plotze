import 'package:flutter/material.dart';
import 'package:meu_login/funcoes.dart';

class ItensView extends StatefulWidget {
  String nomeLista;

  ItensView({super.key, required this.nomeLista});

  @override
  State<ItensView> createState() => _ItensViewState();
}

class _ItensViewState extends State<ItensView> {
  TextEditingController item = TextEditingController();
  TextEditingController qtd = TextEditingController();
  TextEditingController obs = TextEditingController();
  var itemFormKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> itens = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.nomeLista),
          backgroundColor: const Color.fromARGB(255, 253, 238, 99),
        ),

        body: itens.isNotEmpty
            ? ListView.builder(
                itemCount: itens.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: const Color.fromARGB(255, 255, 252, 219),
                    shadowColor: Colors.amber,
                    surfaceTintColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text('${itens[index]['Nome:']}'),
                        leading: Text(
                          '${itens[index]['Quantidade:']}',
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                        onTap: () {
                          item.text = itens[index]['Nome:'];
                          qtd.text = itens[index]['Quantidade:'];
                          obs.text = itens[index]['Obs:'];

                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return novoItem(true, index);
                              });
                        },
                      ),
                    ),
                  );
                },
              )
            : Container(),
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return novoItem(false, 0);
                });
          },
          label: const Text(
            'Add Item',
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

  AlertDialog novoItem(bool edit, int index) {
    return AlertDialog(
      backgroundColor: Colors.white,
      elevation: 0,
      actionsAlignment: MainAxisAlignment.spaceBetween,
      title: Text(
        edit ? 'Editar Item' : 'Novo Item',
        textAlign: TextAlign.center,
      ),
      content: Form(
        key: itemFormKey,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Funcoes().campodeformulario(item, 'Nome do Item', null),
          const SizedBox(height: 15),
          Funcoes().campodeformulario(qtd, 'Quantidade', 4),
          const SizedBox(height: 15),
          Funcoes().campodeformulario(obs, 'Observação', 4),
        ]),
      ),
      actions: [
        TextButton(
          onPressed: () {
            item.text = '';
            qtd.text = '';
            obs.text = '';

            Navigator.pop(context);
          },
          child: const Text("Cancelar"),
        ),
        TextButton(
          onPressed: () {
            if (itemFormKey.currentState!.validate()) {
              setState(() {
                edit
                    ? itens[index] = {
                        'Nome:': item.text,
                        'Quantidade:': qtd.text,
                        'Obs:': obs.text,
                      }
                    : itens.add({
                        'Nome:': item.text,
                        'Quantidade:': qtd.text,
                        'Obs:': obs.text,
                      });
              });
              item.text = '';
              qtd.text = '';
              obs.text = '';

              Navigator.pop(context);
            }
          },
          child: const Text("Adicionar"),
        ),
      ],
    );
  }
}
