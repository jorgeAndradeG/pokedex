class PokeMovesDetail {
  int id;
  List<Moves> moves;
  String name;
  List<Types> types;

  PokeMovesDetail({this.id, this.moves, this.name, this.types});

  PokeMovesDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['moves'] != null) {
      moves = new List<Moves>();
      json['moves'].forEach((v) {
        moves.add(new Moves.fromJson(v));
      });
    }
    name = json['name'];
    if (json['types'] != null) {
      types = new List<Types>();
      json['types'].forEach((v) {
        types.add(new Types.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.moves != null) {
      data['moves'] = this.moves.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    if (this.types != null) {
      data['types'] = this.types.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Moves {
  Move move;
  List<VersionGroupDetails> versionGroupDetails;

  Moves({this.move, this.versionGroupDetails});

  Moves.fromJson(Map<String, dynamic> json) {
    move = json['move'] != null ? new Move.fromJson(json['move']) : null;
    if (json['version_group_details'] != null) {
      versionGroupDetails = new List<VersionGroupDetails>();
      json['version_group_details'].forEach((v) {
        versionGroupDetails.add(new VersionGroupDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.move != null) {
      data['move'] = this.move.toJson();
    }
    if (this.versionGroupDetails != null) {
      data['version_group_details'] =
          this.versionGroupDetails.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Move {
  String name;
  String url;

  Move({this.name, this.url});

  Move.fromJson(Map<String, dynamic> json) {
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

class VersionGroupDetails {
  int levelLearnedAt;
  Move moveLearnMethod;
  Move versionGroup;

  VersionGroupDetails(
      {this.levelLearnedAt, this.moveLearnMethod, this.versionGroup});

  VersionGroupDetails.fromJson(Map<String, dynamic> json) {
    levelLearnedAt = json['level_learned_at'];
    moveLearnMethod = json['move_learn_method'] != null
        ? new Move.fromJson(json['move_learn_method'])
        : null;
    versionGroup = json['version_group'] != null
        ? new Move.fromJson(json['version_group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level_learned_at'] = this.levelLearnedAt;
    if (this.moveLearnMethod != null) {
      data['move_learn_method'] = this.moveLearnMethod.toJson();
    }
    if (this.versionGroup != null) {
      data['version_group'] = this.versionGroup.toJson();
    }
    return data;
  }
}

class Types {
  int slot;
  Move type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ? new Move.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot'] = this.slot;
    if (this.type != null) {
      data['type'] = this.type.toJson();
    }
    return data;
  }
}
