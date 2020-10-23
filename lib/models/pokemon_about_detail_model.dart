class PokeAboutDetail {
  int height;
  int id;
  String locationAreaEncounters;
  String name;
  int order;
  Species species;
  int weight;

  PokeAboutDetail(
      {this.height,
      this.id,
      this.locationAreaEncounters,
      this.name,
      this.order,
      this.species,
      this.weight});

  PokeAboutDetail.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    id = json['id'];
    locationAreaEncounters = json['location_area_encounters'];
    name = json['name'];
    order = json['order'];
    species =
        json['species'] != null ? new Species.fromJson(json['species']) : null;
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['id'] = this.id;
    data['location_area_encounters'] = this.locationAreaEncounters;
    data['name'] = this.name;
    data['order'] = this.order;
    if (this.species != null) {
      data['species'] = this.species.toJson();
    }
    data['weight'] = this.weight;
    return data;
  }
}

class Species {
  String name;
  String url;

  Species({this.name, this.url});

  Species.fromJson(Map<String, dynamic> json) {
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
