class TeamPlayerModel {
  List<ForeignPlayers>? foreignPlayers;
  List<NationalPlayers>? nationalPlayers;
  List<Players>? players;

  TeamPlayerModel({this.foreignPlayers, this.nationalPlayers, this.players});

  TeamPlayerModel.fromJson(Map<String, dynamic> json) {
    if (json['foreignPlayers'] != null) {
      foreignPlayers = <ForeignPlayers>[];
      json['foreignPlayers'].forEach((v) {
        foreignPlayers!.add(new ForeignPlayers.fromJson(v));
      });
    }
    if (json['nationalPlayers'] != null) {
      nationalPlayers = <NationalPlayers>[];
      json['nationalPlayers'].forEach((v) {
        nationalPlayers!.add(new NationalPlayers.fromJson(v));
      });
    }
    if (json['players'] != null) {
      players = <Players>[];
      json['players'].forEach((v) {
        players!.add(new Players.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.foreignPlayers != null) {
      data['foreignPlayers'] =
          this.foreignPlayers!.map((v) => v.toJson()).toList();
    }
    if (this.nationalPlayers != null) {
      data['nationalPlayers'] =
          this.nationalPlayers!.map((v) => v.toJson()).toList();
    }
    if (this.players != null) {
      data['players'] = this.players!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ForeignPlayers {
  Player? player;

  ForeignPlayers({this.player});

  ForeignPlayers.fromJson(Map<String, dynamic> json) {
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    return data;
  }
}

class Player {
  Country? country;
  int? dateOfBirthTimestamp;
  int? height;
  int? id;
  String? jerseyNumber;
  String? name;
  String? position;
  bool? retired;
  int? shirtNumber;
  String? shortName;
  String? slug;
  Team? team;
  int? userCount;

  Player(
      {this.country,
      this.dateOfBirthTimestamp,
      this.height,
      this.id,
      this.jerseyNumber,
      this.name,
      this.position,
      this.retired,
      this.shirtNumber,
      this.shortName,
      this.slug,
      this.team,
      this.userCount});

  Player.fromJson(Map<String, dynamic> json) {
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    dateOfBirthTimestamp = json['dateOfBirthTimestamp'];
    height = json['height'];
    id = json['id'];
    jerseyNumber = json['jerseyNumber'];
    name = json['name'];
    position = json['position'];
    retired = json['retired'];
    shirtNumber = json['shirtNumber'];
    shortName = json['shortName'];
    slug = json['slug'];
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    userCount = json['userCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    data['dateOfBirthTimestamp'] = this.dateOfBirthTimestamp;
    data['height'] = this.height;
    data['id'] = this.id;
    data['jerseyNumber'] = this.jerseyNumber;
    data['name'] = this.name;
    data['position'] = this.position;
    data['retired'] = this.retired;
    data['shirtNumber'] = this.shirtNumber;
    data['shortName'] = this.shortName;
    data['slug'] = this.slug;
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    data['userCount'] = this.userCount;
    return data;
  }
}

class Country {
  String? alpha2;
  String? name;

  Country({this.alpha2, this.name});

  Country.fromJson(Map<String, dynamic> json) {
    alpha2 = json['alpha2'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alpha2'] = this.alpha2;
    data['name'] = this.name;
    return data;
  }
}

class Team {
  Country? country;
  bool? disabled;
  String? gender;
  int? id;
  String? name;
  String? nameCode;
  bool? national;
  PrimaryUniqueTournament? primaryUniqueTournament;
  String? shortName;
  String? slug;
  Sport? sport;
  TeamColors? teamColors;
  Tournament? tournament;
  int? type;
  int? userCount;

  Team(
      {this.country,
      this.disabled,
      this.gender,
      this.id,
      this.name,
      this.nameCode,
      this.national,
      this.primaryUniqueTournament,
      this.shortName,
      this.slug,
      this.sport,
      this.teamColors,
      this.tournament,
      this.type,
      this.userCount});

  Team.fromJson(Map<String, dynamic> json) {
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    disabled = json['disabled'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    nameCode = json['nameCode'];
    national = json['national'];
    primaryUniqueTournament = json['primaryUniqueTournament'] != null
        ? new PrimaryUniqueTournament.fromJson(json['primaryUniqueTournament'])
        : null;
    shortName = json['shortName'];
    slug = json['slug'];
    sport = json['sport'] != null ? new Sport.fromJson(json['sport']) : null;
    teamColors = json['teamColors'] != null
        ? new TeamColors.fromJson(json['teamColors'])
        : null;
    tournament = json['tournament'] != null
        ? new Tournament.fromJson(json['tournament'])
        : null;
    type = json['type'];
    userCount = json['userCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    data['disabled'] = this.disabled;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['name'] = this.name;
    data['nameCode'] = this.nameCode;
    data['national'] = this.national;
    if (this.primaryUniqueTournament != null) {
      data['primaryUniqueTournament'] = this.primaryUniqueTournament!.toJson();
    }
    data['shortName'] = this.shortName;
    data['slug'] = this.slug;
    if (this.sport != null) {
      data['sport'] = this.sport!.toJson();
    }
    if (this.teamColors != null) {
      data['teamColors'] = this.teamColors!.toJson();
    }
    if (this.tournament != null) {
      data['tournament'] = this.tournament!.toJson();
    }
    data['type'] = this.type;
    data['userCount'] = this.userCount;
    return data;
  }
}

class PrimaryUniqueTournament {
  Category? category;
  bool? displayInverseHomeAwayTeams;
  int? id;
  String? name;
  String? slug;
  int? userCount;

  PrimaryUniqueTournament(
      {this.category,
      this.displayInverseHomeAwayTeams,
      this.id,
      this.name,
      this.slug,
      this.userCount});

  PrimaryUniqueTournament.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    displayInverseHomeAwayTeams = json['displayInverseHomeAwayTeams'];
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    userCount = json['userCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['displayInverseHomeAwayTeams'] = this.displayInverseHomeAwayTeams;
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['userCount'] = this.userCount;
    return data;
  }
}

class Category {
  String? alpha2;
  String? flag;
  int? id;
  String? name;
  String? slug;
  Sport? sport;

  Category({this.alpha2, this.flag, this.id, this.name, this.slug, this.sport});

  Category.fromJson(Map<String, dynamic> json) {
    alpha2 = json['alpha2'];
    flag = json['flag'];
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    sport = json['sport'] != null ? new Sport.fromJson(json['sport']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alpha2'] = this.alpha2;
    data['flag'] = this.flag;
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    if (this.sport != null) {
      data['sport'] = this.sport!.toJson();
    }
    return data;
  }
}

class Sport {
  int? id;
  String? name;
  String? slug;

  Sport({this.id, this.name, this.slug});

  Sport.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class TeamColors {
  String? primary;
  String? secondary;
  String? text;

  TeamColors({this.primary, this.secondary, this.text});

  TeamColors.fromJson(Map<String, dynamic> json) {
    primary = json['primary'];
    secondary = json['secondary'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primary'] = this.primary;
    data['secondary'] = this.secondary;
    data['text'] = this.text;
    return data;
  }
}

class Tournament {
  Category? category;
  int? id;
  String? name;
  int? priority;
  String? slug;
  PrimaryUniqueTournament? uniqueTournament;

  Tournament(
      {this.category,
      this.id,
      this.name,
      this.priority,
      this.slug,
      this.uniqueTournament});

  Tournament.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    id = json['id'];
    name = json['name'];
    priority = json['priority'];
    slug = json['slug'];
    uniqueTournament = json['uniqueTournament'] != null
        ? new PrimaryUniqueTournament.fromJson(json['uniqueTournament'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['priority'] = this.priority;
    data['slug'] = this.slug;
    if (this.uniqueTournament != null) {
      data['uniqueTournament'] = this.uniqueTournament!.toJson();
    }
    return data;
  }
}

class NationalPlayers {
  Player? player;

  NationalPlayers({this.player});

  NationalPlayers.fromJson(Map<String, dynamic> json) {
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    return data;
  }
}

class Players {
  Player? player;

  Players({this.player});

  Players.fromJson(Map<String, dynamic> json) {
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    return data;
  }
}
