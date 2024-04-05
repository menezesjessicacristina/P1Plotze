class ItemModel {
  String nomeItem;
  String qtd;
  String obs;
  String id;
  bool check;

  ItemModel({
    required this.nomeItem,
    required this.qtd,
    required this.obs,
    required this.id,
    this.check = false,
  });
}
