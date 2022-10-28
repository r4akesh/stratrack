class AllTeamModel {
  List<Standings>? standings;

  AllTeamModel({this.standings});

  AllTeamModel.fromJson(Map<String, dynamic> json) {
    if (json['standings'] != null) {
      standings = <Standings>[];
      json['standings'].forEach((v) {
        standings!.add(new Standings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.standings != null) {
      data['standings'] = this.standings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Standings {
  //List<Null>? descriptions;
  int? id;
  String? name;
  List<Rows>? rows;
  Tournament? tournament;
  String? type;
  int? updatedAtTimestamp;

  Standings(
      {
       // this.descriptions,
      this.id,
      this.name,
      this.rows,
      this.tournament,
      this.type,
      this.updatedAtTimestamp});

  Standings.fromJson(Map<String, dynamic> json) {
    // if (json['descriptions'] != null) {
    //   descriptions = <Null>[];
    //   json['descriptions'].forEach((v) {
    //     descriptions!.add(new Null.fromJson(v));
    //   });
    // }
    id = json['id'];
    name = json['name'];
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(new Rows.fromJson(v));
      });
    }
    tournament = json['tournament'] != null
        ? new Tournament.fromJson(json['tournament'])
        : null;
    type = json['type'];
    updatedAtTimestamp = json['updatedAtTimestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.descriptions != null) {
    //   data['descriptions'] = this.descriptions!.map((v) => v.toJson()).toList();
    // }
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.rows != null) {
      data['rows'] = this.rows!.map((v) => v.toJson()).toList();
    }
    if (this.tournament != null) {
      data['tournament'] = this.tournament!.toJson();
    }
    data['type'] = this.type;
    data['updatedAtTimestamp'] = this.updatedAtTimestamp;
    return data;
  }
}

class Rows {
 // List<Null>? descriptions;
  int? id;
  int? losses;
  int? percentage;
  int? position;
  Team? team;
  int? wins;

  Rows(
      {
        //this.descriptions,
      this.id,
      this.losses,
      this.percentage,
      this.position,
      this.team,
      this.wins});

  Rows.fromJson(Map<String, dynamic> json) {
    // if (json['descriptions'] != null) {
    //   descriptions = <Null>[];
    //   json['descriptions'].forEach((v) {
    //     descriptions!.add(new Null.fromJson(v));
    //   });
    // }
    id = json['id'];
    losses = json['losses'];
    percentage = json['percentage'];
    position = json['position'];
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    wins = json['wins'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.descriptions != null) {
    //   data['descriptions'] = this.descriptions!.map((v) => v.toJson()).toList();
    // }
    data['id'] = this.id;
    data['losses'] = this.losses;
    data['percentage'] = this.percentage;
    data['position'] = this.position;
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    data['wins'] = this.wins;
    return data;
  }
}

class Team {
  bool? disabled;
  String? gender;
  int? id;
  String? name;
  String? nameCode;
  bool? national;
  String? shortName;
  String? slug;
  Sport? sport;
  TeamColors? teamColors;
  int? type;
  int? userCount;

  Team(
      {this.disabled,
      this.gender,
      this.id,
      this.name,
      this.nameCode,
      this.national,
      this.shortName,
      this.slug,
      this.sport,
      this.teamColors,
      this.type,
      this.userCount});

  Team.fromJson(Map<String, dynamic> json) {
    disabled = json['disabled'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    nameCode = json['nameCode'];
    national = json['national'];
    shortName = json['shortName'];
    slug = json['slug'];
    sport = json['sport'] != null ? new Sport.fromJson(json['sport']) : null;
    teamColors = json['teamColors'] != null
        ? new TeamColors.fromJson(json['teamColors'])
        : null;
    type = json['type'];
    userCount = json['userCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['disabled'] = this.disabled;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['name'] = this.name;
    data['nameCode'] = this.nameCode;
    data['national'] = this.national;
    data['shortName'] = this.shortName;
    data['slug'] = this.slug;
    if (this.sport != null) {
      data['sport'] = this.sport!.toJson();
    }
    if (this.teamColors != null) {
      data['teamColors'] = this.teamColors!.toJson();
    }
    data['type'] = this.type;
    data['userCount'] = this.userCount;
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
  UniqueTournament? uniqueTournament;

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
        ? new UniqueTournament.fromJson(json['uniqueTournament'])
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

class UniqueTournament {
  Category? category;
  bool? displayInverseHomeAwayTeams;
  int? id;
  String? name;
  String? slug;
  int? userCount;

  UniqueTournament(
      {this.category,
      this.displayInverseHomeAwayTeams,
      this.id,
      this.name,
      this.slug,
      this.userCount});

  UniqueTournament.fromJson(Map<String, dynamic> json) {
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
