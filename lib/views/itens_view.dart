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
  TextEditingController fill = TextEditingController();
  var itemFormKey = GlobalKey<FormState>();
  List<ItemModel> selecionados = [];
  List<ItemModel> filtrados = [];
  final r = Repositorio();
  late ListaModel lista;
  bool pesquisar = false;

  @override
  void initState() {
    lista = widget.l;
    super.initState();
  }

  void filtro(String pesquisa) {
    setState(() {
      filtrados = lista.lista
          .where((obj) =>
              obj.nomeItem.toLowerCase().contains(pesquisa.toLowerCase()))
          .toList();
    });
  }

  AppBar barra() {
    if (pesquisar) {
      return AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              setState(() {
                pesquisar = !pesquisar;
                fill.text = '';
                filtrados = [];
                selecionados = [];
              });
            }),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 10),
          child: TextField(
            controller: fill,
            onEditingComplete: () {},
            onChanged: (value) {
              fill.text.isEmpty
                  ? setState(() {
                      filtrados = [];
                    })
                  : filtro(value);
            },
            style: const TextStyle(color: Colors.black),
            cursorColor: Colors.amber,
            autofocus: true,
            decoration: const InputDecoration(
              focusColor: Colors.amber,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
            ),
          ),
        ),
      );
    }
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {
              pesquisar = !pesquisar;
              setState(() {});
            },
            icon: const Icon(Icons.search))
      ],
      centerTitle: true,
      title: Text(lista.nomeLista),
      backgroundColor: const Color.fromARGB(255, 253, 238, 99),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: barra(),

        body: pesquisar
            ? ListView.builder(
                itemCount: filtrados.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: selecionados.contains(filtrados[index])
                        ? Colors.amber[400]
                        : const Color.fromARGB(255, 255, 252, 219),
                    shadowColor: Colors.amber,
                    surfaceTintColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: InkWell(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        filtrados[index].qtd,
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        filtrados[index].nomeItem,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                onLongPress: () {
                                  setState(() {
                                    (selecionados.contains(filtrados[index]))
                                        ? selecionados.remove(filtrados[index])
                                        : selecionados.add(filtrados[index]);
                                  });
                                },
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return observacao(filtrados[index]);
                                      });
                                }),
                          ),
                          Expanded(
                            child: IconButton(
                                onPressed: () {
                                  item.text = filtrados[index].nomeItem;
                                  qtd.text = filtrados[index].qtd;
                                  obs.text = filtrados[index].obs;

                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return novoItem(true, filtrados[index]);
                                      });
                                },
                                icon: const Icon(Icons.edit)),
                          )
                        ],
                      ),
                    ),
                  );
                })
            : lista.lista.isNotEmpty
                ? Column(children: [
                    const Expanded(
                        child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          'Qtd',
                          textAlign: TextAlign.center,
                        )),
                        Expanded(
                            flex: 3,
                            child: Text(
                              'Item',
                              textAlign: TextAlign.center,
                            )),
                        SizedBox(
                          width: 40,
                        ),
                        Expanded(
                            child: Text(
                          'Obs',
                          textAlign: TextAlign.center,
                        ))
                      ],
                    )),
                    const Divider(),
                    Expanded(
                        flex: 20,
                        child: ListView.builder(
                            itemCount: lista.lista.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                color: selecionados.contains(lista.lista[index])
                                    ? Colors.amber[400]
                                    : const Color.fromARGB(255, 255, 252, 219),
                                shadowColor: Colors.amber,
                                surfaceTintColor: Colors.white,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: InkWell(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    textAlign: TextAlign.center,
                                                    lista.lista[index].qtd,
                                                    style: const TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    lista.lista[index].nomeItem,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onLongPress: () {
                                              setState(() {
                                                (selecionados.contains(
                                                        lista.lista[index]))
                                                    ? selecionados.remove(
                                                        lista.lista[index])
                                                    : selecionados.add(
                                                        lista.lista[index]);
                                              });
                                            },
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return observacao(
                                                        lista.lista[index]);
                                                  });
                                            }),
                                      ),
                                      Expanded(
                                        child: Checkbox(
                                            checkColor: Colors.black87,
                                            activeColor: Colors.amber[500],
                                            value: lista.lista[index].check,
                                            onChanged: (bool? novoValor) {
                                              setState(() {
                                                lista.lista[index].check =
                                                    !lista.lista[index].check;
                                              });
                                            }),
                                      ),
                                      Expanded(
                                        child: IconButton(
                                            onPressed: () {
                                              item.text =
                                                  lista.lista[index].nomeItem;
                                              qtd.text = lista.lista[index].qtd;
                                              obs.text = lista.lista[index].obs;

                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return novoItem(true,
                                                        lista.lista[index]);
                                                  });
                                            },
                                            icon: const Icon(Icons.edit)),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })),
                  ])
                : Container(),
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: selecionados.isNotEmpty
            ? FloatingActionButton.extended(
                onPressed: () {
                  for (int a = 0; a < selecionados.length; a++) {
                    lista.lista.remove(selecionados[a]);
                    //filtro.remove(selecionados[a]);
                    r.removeitem(selecionados[a], widget.i);
                  }

                  setState(() {
                    selecionados = [];
                  });
                },
                label: const Text('Excluir'),
                backgroundColor: Colors.amber[400],
                icon: const Icon(Icons.delete),
              )
            : FloatingActionButton.extended(
                onPressed: () {
                  ItemModel teste =
                      ItemModel(nomeItem: '', qtd: '', obs: '', id: '');
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return novoItem(false, teste);
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

  AlertDialog novoItem(bool edit, ItemModel it) {
    return AlertDialog(
      backgroundColor: Colors.white,
      elevation: 0,
      actionsAlignment: MainAxisAlignment.spaceBetween,
      title: Text(
        edit ? 'Editar Item' : 'Novo Item',
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: Form(
          key: itemFormKey,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Funcoes().campodeformulario(item, 'Nome do Item', null),
            const SizedBox(height: 15),
            Funcoes().campodeformulario(qtd, 'Quantidade', 4),
            const SizedBox(height: 15),
            Funcoes().campodeformulario(obs, 'Observação', 4),
          ]),
        ),
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
              ItemModel b = ItemModel(
                  nomeItem: item.text,
                  qtd: qtd.text,
                  obs: obs.text,
                  id: edit ? it.id : DateTime.now().toString());

              if (edit) {
                for (int i = 0; i < lista.lista.length; i++) {
                  if (lista.lista[i].id == b.id) {
                    lista.lista[i] = b;
                  }
                }

                r.editarItem(it);
              } else {
                lista.lista.add(b);
                r.additem(b, widget.i);
              }

              item.text = '';
              qtd.text = '';
              obs.text = '';
              setState(() {});
              Navigator.pop(context);
            }
          },
          child: const Text("Adicionar"),
        ),
      ],
    );
  }

  AlertDialog observacao(ItemModel ob) {
    return AlertDialog(
      backgroundColor: Colors.white,
      elevation: 0,
      actionsAlignment: MainAxisAlignment.spaceBetween,
      title: Text(
        ob.nomeItem,
        textAlign: TextAlign.center,
      ),
      content: Text(ob.obs.isNotEmpty ? ob.obs : ''),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}
