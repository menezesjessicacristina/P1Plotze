import 'package:meu_login/model/iem_model.dart';
import 'package:meu_login/model/lista_model.dart';

class Repositorio {
  List<ListaModel> _listas = [];
  List<ListaModel> get listas => _listas;

  Repositorio() {
    iniciarepositorio();
  }

  iniciarepositorio() {
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

  editaritem(ItemModel item, int index) async {
    for (int i = 0; i < _listas[index].lista.length; i++) {
      if (_listas[index].lista[i].id == item.id) {
        _listas[index].lista[i] = item;
      }
    }
  }
}
