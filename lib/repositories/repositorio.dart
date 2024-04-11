import 'package:meu_login/model/iem_model.dart';
import 'package:meu_login/model/lista_model.dart';

class Repositorio {
  List<ListaModel> _listas = [];
  List<ListaModel> get listas => _listas;

  Repositorio() {
    iniciarepositorio();
  }

  iniciarepositorio() async {
    if (_listas.isEmpty) {
      _listas = [
        ListaModel(nomeLista: 'Mercado', lista: [
          ItemModel(nomeItem: 'Arroz', qtd: '2', obs: 'Tio João', id: '1'),
          ItemModel(nomeItem: 'Feijão', qtd: '3', obs: 'Carunchão', id: '2'),
          ItemModel(nomeItem: 'Macarrão', qtd: '5', obs: 'Parafuso', id: '3')
        ])
      ];
    }
  }

  addlista(ListaModel l) async {
    _listas.add(l);
  }

  removelista(ListaModel l) async {
    _listas.remove(l);
  }

  editarlista(ListaModel l, int index) async {
    _listas[index] = l;
  }

  additem(ItemModel item, int index) async {
    _listas[index].lista.add(item);
  }

  removeitem(ItemModel item, int index) async {
    _listas[index].lista.remove(item);
  }

  editarItem(ItemModel item) async {
    for (int i = 0; i < _listas.length; i++) {
      for (int j = 0; j < _listas[i].lista.length; j++) {
        if (_listas[i].lista[j].id == item.id) {
          _listas[i].lista[j] = item;
        }
      }
    }
  }
}
