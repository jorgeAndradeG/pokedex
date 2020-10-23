class PokemonListResponse {
  List<PokemonListModel> items = new List();
  PokemonListResponse();
  PokemonListResponse.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var i = 0; i < jsonList.length; i++) {
      final pokemon = PokemonListModel.fromJson(jsonList[i]);
      items.add(pokemon);
    }
  }
}

class PokemonListModel {
  String sId;
  int orderID;
  int nDex;
  String name;
  String type1;
  String type2;
  String ability1;
  String ability2;
  String hiddenability;
  int hp;
  int atk;
  int def;
  int spatk;
  int spdef;
  int spe;
  String note;
  String tier;
  String image;

  PokemonListModel(
      {this.sId,
      this.orderID,
      this.nDex,
      this.name,
      this.type1,
      this.type2,
      this.ability1,
      this.ability2,
      this.hiddenability,
      this.hp,
      this.atk,
      this.def,
      this.spatk,
      this.spdef,
      this.spe,
      this.note,
      this.tier,
      this.image});

  PokemonListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    orderID = json['orderID'];
    nDex = json['nDex'];
    name = json['name'];
    type1 = json['type1'];
    type2 = json['type2'];
    ability1 = json['ability1'];
    ability2 = json['ability2'];
    hiddenability = json['hiddenability'];
    hp = json['hp'];
    atk = json['atk'];
    def = json['def'];
    spatk = json['spatk'];
    spdef = json['spdef'];
    spe = json['spe'];
    note = json['note'];
    tier = json['tier'];
    image = json['image'];
  }
}
