class PokeAboutSpecies {
  List<EggGroups> eggGroups;
  List<FlavorTextEntries> flavorTextEntries;

  PokeAboutSpecies({this.eggGroups, this.flavorTextEntries});

  PokeAboutSpecies.fromJson(Map<String, dynamic> json) {
    if (json['egg_groups'] != null) {
      eggGroups = new List<EggGroups>();
      json['egg_groups'].forEach((v) {
        eggGroups.add(new EggGroups.fromJson(v));
      });
    }
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = new List<FlavorTextEntries>();
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries.add(new FlavorTextEntries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eggGroups != null) {
      data['egg_groups'] = this.eggGroups.map((v) => v.toJson()).toList();
    }
    if (this.flavorTextEntries != null) {
      data['flavor_text_entries'] =
          this.flavorTextEntries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EggGroups {
  String name;
  String url;

  EggGroups({this.name, this.url});

  EggGroups.fromJson(Map<String, dynamic> json) {
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

class FlavorTextEntries {
  String flavorText;
  EggGroups language;
  EggGroups version;

  FlavorTextEntries({this.flavorText, this.language, this.version});

  FlavorTextEntries.fromJson(Map<String, dynamic> json) {
    flavorText = json['flavor_text'];
    language = json['language'] != null
        ? new EggGroups.fromJson(json['language'])
        : null;
    version = json['version'] != null
        ? new EggGroups.fromJson(json['version'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flavor_text'] = this.flavorText;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    if (this.version != null) {
      data['version'] = this.version.toJson();
    }
    return data;
  }
}
