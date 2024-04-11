import 'package:flutter/material.dart';
import 'package:meu_login/funcoes.dart';
import 'package:meu_login/model/lista_model.dart';
import 'package:meu_login/repositories/repositorio.dart';
import 'package:meu_login/views/itens_view.dart';

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  TextEditingController listaCompras = TextEditingController();
  var nomeListaFormKey = GlobalKey<FormState>();
  List<ListaModel> selected = [];
  List<int> indices = [];

  final r = Repositorio();
  List<ListaModel> lista = [];
  @override
  void initState() {
    lista = r.listas;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Lista de Compras'),
          backgroundColor: const Color.fromARGB(255, 253, 238, 99),
        ),
        body: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: selected.contains(lista[index])
                  ? Colors.amber[400]
                  : const Color.fromARGB(255, 255, 252, 219),
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
                              ItensView(l: lista[index], i: index)),
                    );
                  },
                  onLongPress: () {
                    setState(() {
                      (selected.contains(lista[index]))
                          ? selected.remove(lista[index])
                          : selected.add(lista[index]);
                      (indices.contains(index))
                          ? indices.remove(index)
                          : indices.add(index);
                    });
                    opcoes();
                  },
                  title: Text(lista[index].nomeLista),
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
                  return novaLista(false, 0);
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

  AlertDialog novaLista(bool editar, int i) {
    return AlertDialog(
      elevation: 0,
      actionsAlignment: MainAxisAlignment.spaceBetween,
      title: Text(
        editar ? 'Editar Lista' : 'Nova Lista',
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
              ListaModel a =
                  ListaModel(nomeLista: listaCompras.text, lista: []);
              if (editar) {
                r.editarlista(a, i);
                indices = [];
                selected = [];

              } else {
                r.addlista(a);
              }

              setState(() {});
              listaCompras.text = '';
              Navigator.pop(context);
            }
          },
          child: Text(editar ? 'Confirmar' : "Adicionar"),
        ),
      ],
    );
  }

  void opcoes() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              selected.length == 1
                  ? ListTile(
                      title: const Text('Editar Lista'),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 50),
                      trailing: const Icon(Icons.edit),
                      iconColor: Colors.amber,
                      onTap: () {
                        Navigator.of(context).pop();
                        showDialog(
                            context: context,
                            builder: (BuildContext bc) {
                              listaCompras.text = selected[0].nomeLista;
                              return novaLista(true, indices[0]);
                            });
                      },
                    )
                  : const Divider(
                      thickness: 0.1,
                      color: Colors.amber,
                    ),
              ListTile(
                title: const Text('Deletar'),
                contentPadding: const EdgeInsets.symmetric(horizontal: 50),
                trailing: const Icon(
                  Icons.delete_forever,
                ),
                iconColor: Colors.orange,
                onTap: () {
                  Navigator.of(context).pop();
                  showDialog(
                      context: context,
                      builder: (BuildContext bc) {
                        return AlertDialog(
                          elevation: 0,
                          title: const Text('Atenção',
                              textAlign: TextAlign.center),
                          actionsAlignment: MainAxisAlignment.spaceAround,
                          content: Text(
                            selected.length == 1
                                ? 'Deseja deletar essa lista ?'
                                : 'Deseja deletar essas listas ?',
                            textAlign: TextAlign.justify,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Cancelar",
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                for (int a = 0; a < selected.length; a++) {
                                  r.removelista(selected[a]);
                                }
                                selected = [];
                                indices = [];
                                setState(() {});
                                Navigator.pop(context);
                              },
                              child: const Text("Deletar"),
                            ),
                          ],
                        );
                      });
                },
              ),
            ],
          );
        });
  }
}
