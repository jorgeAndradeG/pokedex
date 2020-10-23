class PokemonAboutLocationListModel {
  List<PokeAboutLocation> items = new List();
  PokemonAboutLocationListModel();
  PokemonAboutLocationListModel.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var i = 0; i < jsonList.length; i++) {
      final pokemon = PokeAboutLocation.fromJson(jsonList[i]);
      items.add(pokemon);
    }
  }
}

class PokeAboutLocation {
  LocationArea locationArea;

  PokeAboutLocation({this.locationArea});

  PokeAboutLocation.fromJson(Map<String, dynamic> json) {
    locationArea = json['location_area'] != null
        ? new LocationArea.fromJson(json['location_area'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.locationArea != null) {
      data['location_area'] = this.locationArea.toJson();
    }
    return data;
  }
}

class LocationArea {
  String name;
  String url;

  LocationArea({this.name, this.url});

  LocationArea.fromJson(Map<String, dynamic> json) {
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
