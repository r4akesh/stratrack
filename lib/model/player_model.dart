class PlayerDetailModel {
  Player? player;

  PlayerDetailModel({this.player});

  PlayerDetailModel.fromJson(Map<String, dynamic> json) {
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
  bool? retired;
  int? id;
  String? name;
  int? userCount;
  int? dateOfBirthTimestamp;
  int? shirtNumber;
  String? jerseyNumber;
  String? slug;
  int? height;
  Country? country;
  String? position;
  String? shortName;
  Team? team;

  Player(
      {this.retired,
        this.id,
        this.name,
        this.userCount,
        this.dateOfBirthTimestamp,
        this.shirtNumber,
        this.jerseyNumber,
        this.slug,
        this.height,
        this.country,
        this.position,
        this.shortName,
        this.team});

  Player.fromJson(Map<String, dynamic> json) {
    retired = json['retired'];
    id = json['id'];
    name = json['name'];
    userCount = json['userCount'];
    dateOfBirthTimestamp = json['dateOfBirthTimestamp'];
    shirtNumber = json['shirtNumber'];
    jerseyNumber = json['jerseyNumber'];
    slug = json['slug'];
    height = json['height'];
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    position = json['position'];
    shortName = json['shortName'];
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['retired'] = this.retired;
    data['id'] = this.id;
    data['name'] = this.name;
    data['userCount'] = this.userCount;
    data['dateOfBirthTimestamp'] = this.dateOfBirthTimestamp;
    data['shirtNumber'] = this.shirtNumber;
    data['jerseyNumber'] = this.jerseyNumber;
    data['slug'] = this.slug;
    data['height'] = this.height;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    data['position'] = this.position;
    data['shortName'] = this.shortName;
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
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
  int? userCount;
  int? id;
  String? nameCode;
  String? name;
  PrimaryUniqueTournament? primaryUniqueTournament;
  String? gender;
  Tournament? tournament;
  TeamColors? teamColors;
  Sport? sport;
  String? shortName;
  Country? country;
  bool? national;
  String? slug;
  int? type;

  Team(
      {this.userCount,
        this.id,
        this.nameCode,
        this.name,
        this.primaryUniqueTournament,
        this.gender,
        this.tournament,
        this.teamColors,
        this.sport,
        this.shortName,
        this.country,
        this.national,
        this.slug,
        this.type});

  Team.fromJson(Map<String, dynamic> json) {
    userCount = json['userCount'];
    id = json['id'];
    nameCode = json['nameCode'];
    name = json['name'];
    primaryUniqueTournament = json['primaryUniqueTournament'] != null
        ? new PrimaryUniqueTournament.fromJson(json['primaryUniqueTournament'])
        : null;
    gender = json['gender'];
    tournament = json['tournament'] != null
        ? new Tournament.fromJson(json['tournament'])
        : null;
    teamColors = json['teamColors'] != null
        ? new TeamColors.fromJson(json['teamColors'])
        : null;
    sport = json['sport'] != null ? new Sport.fromJson(json['sport']) : null;
    shortName = json['shortName'];
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    national = json['national'];
    slug = json['slug'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userCount'] = this.userCount;
    data['id'] = this.id;
    data['nameCode'] = this.nameCode;
    data['name'] = this.name;
    if (this.primaryUniqueTournament != null) {
      data['primaryUniqueTournament'] = this.primaryUniqueTournament!.toJson();
    }
    data['gender'] = this.gender;
    if (this.tournament != null) {
      data['tournament'] = this.tournament!.toJson();
    }
    if (this.teamColors != null) {
      data['teamColors'] = this.teamColors!.toJson();
    }
    if (this.sport != null) {
      data['sport'] = this.sport!.toJson();
    }
    data['shortName'] = this.shortName;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    data['national'] = this.national;
    data['slug'] = this.slug;
    data['type'] = this.type;
    return data;
  }
}

class PrimaryUniqueTournament {
  bool? displayInverseHomeAwayTeams;
  int? id;
  int? userCount;
  String? name;
  Category? category;
  String? slug;

  PrimaryUniqueTournament(
      {this.displayInverseHomeAwayTeams,
        this.id,
        this.userCount,
        this.name,
        this.category,
        this.slug});

  PrimaryUniqueTournament.fromJson(Map<String, dynamic> json) {
    displayInverseHomeAwayTeams = json['displayInverseHomeAwayTeams'];
    id = json['id'];
    userCount = json['userCount'];
    name = json['name'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayInverseHomeAwayTeams'] = this.displayInverseHomeAwayTeams;
    data['id'] = this.id;
    data['userCount'] = this.userCount;
    data['name'] = this.name;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['slug'] = this.slug;
    return data;
  }
}

class Category {
  String? alpha2;
  Sport? sport;
  int? id;
  String? flag;
  String? name;
  String? slug;

  Category({this.alpha2, this.sport, this.id, this.flag, this.name, this.slug});

  Category.fromJson(Map<String, dynamic> json) {
    alpha2 = json['alpha2'];
    sport = json['sport'] != null ? new Sport.fromJson(json['sport']) : null;
    id = json['id'];
    flag = json['flag'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alpha2'] = this.alpha2;
    if (this.sport != null) {
      data['sport'] = this.sport!.toJson();
    }
    data['id'] = this.id;
    data['flag'] = this.flag;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class Sport {
  String? name;
  String? slug;
  int? id;

  Sport({this.name, this.slug, this.id});

  Sport.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['id'] = this.id;
    return data;
  }
}

class Tournament {
  int? priority;
  int? id;
  PrimaryUniqueTournament? uniqueTournament;
  String? name;
  Category? category;
  String? slug;

  Tournament(
      {this.priority,
        this.id,
        this.uniqueTournament,
        this.name,
        this.category,
        this.slug});

  Tournament.fromJson(Map<String, dynamic> json) {
    priority = json['priority'];
    id = json['id'];
    uniqueTournament = json['uniqueTournament'] != null
        ? new PrimaryUniqueTournament.fromJson(json['uniqueTournament'])
        : null;
    name = json['name'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['priority'] = this.priority;
    data['id'] = this.id;
    if (this.uniqueTournament != null) {
      data['uniqueTournament'] = this.uniqueTournament!.toJson();
    }
    data['name'] = this.name;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['slug'] = this.slug;
    return data;
  }
}

class TeamColors {
  String? secondary;
  String? primary;
  String? text;

  TeamColors({this.secondary, this.primary, this.text});

  TeamColors.fromJson(Map<String, dynamic> json) {
    secondary = json['secondary'];
    primary = json['primary'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['secondary'] = this.secondary;
    data['primary'] = this.primary;
    data['text'] = this.text;
    return data;
  }
}