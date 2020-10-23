class PokeStatsSpecies {
  int captureRate;
  Color color;
  Color habitat;
  int id;
  String name;
  List<PalParkEncounters> palParkEncounters;
  Color shape;

  PokeStatsSpecies(
      {this.captureRate,
      this.color,
      this.habitat,
      this.id,
      this.name,
      this.palParkEncounters,
      this.shape});

  PokeStatsSpecies.fromJson(Map<String, dynamic> json) {
    captureRate = json['capture_rate'];
    color = json['color'] != null ? new Color.fromJson(json['color']) : null;
    habitat =
        json['habitat'] != null ? new Color.fromJson(json['habitat']) : null;
    id = json['id'];
    name = json['name'];
    if (json['pal_park_encounters'] != null) {
      palParkEncounters = new List<PalParkEncounters>();
      json['pal_park_encounters'].forEach((v) {
        palParkEncounters.add(new PalParkEncounters.fromJson(v));
      });
    }
    shape = json['shape'] != null ? new Color.fromJson(json['shape']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['capture_rate'] = this.captureRate;
    if (this.color != null) {
      data['color'] = this.color.toJson();
    }
    if (this.habitat != null) {
      data['habitat'] = this.habitat.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.palParkEncounters != null) {
      data['pal_park_encounters'] =
          this.palParkEncounters.map((v) => v.toJson()).toList();
    }
    if (this.shape != null) {
      data['shape'] = this.shape.toJson();
    }
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

class PalParkEncounters {
  Color area;
  int baseScore;
  int rate;

  PalParkEncounters({this.area, this.baseScore, this.rate});

  PalParkEncounters.fromJson(Map<String, dynamic> json) {
    area = json['area'] != null ? new Color.fromJson(json['area']) : null;
    baseScore = json['base_score'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.area != null) {
      data['area'] = this.area.toJson();
    }
    data['base_score'] = this.baseScore;
    data['rate'] = this.rate;
    return data;
  }
}
