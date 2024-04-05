import 'package:flutter/material.dart';
import 'package:meu_login/funcoes.dart';
import 'package:meu_login/model/iem_model.dart';
import 'package:meu_login/model/lista_model.dart';
import 'package:meu_login/repositories/repositorio.dart';

class ItensView extends StatefulWidget {
  final ListaModel l;
  final int i;

  const ItensView({super.key, required this.l, required this.i});

  @override
  State<ItensView> createState() => _ItensViewState();
}

class _ItensViewState extends State<ItensView> {
  TextEditingController item = TextEditingController();
  TextEditingController qtd = TextEditingController();
  TextEditingController obs = TextEditingController();
  var itemFormKey = GlobalKey<FormState>();

  final r = Repositorio();
  late ListaModel lista;
  @override
  void initState() {
    lista = widget.l;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(lista.nomeLista),
          backgroundColor: const Color.fromARGB(255, 253, 238, 99),
        ),

        body: lista.lista.isNotEmpty
            ? ListView.builder(
                itemCount: lista.lista.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: const Color.fromARGB(255, 255, 252, 219),
                    shadowColor: Colors.amber,
                    surfaceTintColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text(lista.lista[index].nomeItem),
                        leading: Text(
                          lista.lista[index].qtd,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                        onTap: () {
                          item.text = lista.lista[index].nomeItem;
                          qtd.text = lista.lista[index].qtd;
                          obs.text = lista.lista[index].obs;

                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return novoItem(true, lista.lista[index]);
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
                  return novoItem(false, null);
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

  AlertDialog novoItem(bool edit, ItemModel? it) {
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
              int ct = 0;
              ItemModel b = ItemModel(
                  nomeItem: item.text,
                  qtd: qtd.text,
                  obs: obs.text,
                  id: DateTime.now().toString());

              if (edit) {
                for (int i = 0; i < lista.lista.length; i++) {
                  if (lista.lista[i].id == it!.id) {
                    lista.lista[i] = it;
                    ct = i;
                  }
                }
                r.editaritem(it!, ct);
              } else {
                lista.lista.add(b);
                r.additem(b, widget.i);
              }
              setState(() {});
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
