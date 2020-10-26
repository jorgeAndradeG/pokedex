class PokeEvolutionSpecies {
  Color color;
  EvolutionChain evolutionChain;
  Color evolvesFromSpecies;
  int id;
  String name;

  PokeEvolutionSpecies(
      {this.color,
      this.evolutionChain,
      this.evolvesFromSpecies,
      this.id,
      this.name});

  PokeEvolutionSpecies.fromJson(Map<String, dynamic> json) {
    color = json['color'] != null ? new Color.fromJson(json['color']) : null;
    evolutionChain = json['evolution_chain'] != null
        ? new EvolutionChain.fromJson(json['evolution_chain'])
        : null;
    evolvesFromSpecies = json['evolves_from_species'] != null
        ? new Color.fromJson(json['evolves_from_species'])
        : null;
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.color != null) {
      data['color'] = this.color.toJson();
    }
    if (this.evolutionChain != null) {
      data['evolution_chain'] = this.evolutionChain.toJson();
    }
    if (this.evolvesFromSpecies != null) {
      data['evolves_from_species'] = this.evolvesFromSpecies.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Color {
  String name;
  String url;

  Color({this.name, this.url});

  Color.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class EvolutionChain {
  String url;

  EvolutionChain({this.url});

  EvolutionChain.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
