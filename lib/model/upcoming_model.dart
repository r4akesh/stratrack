class UpcomingModel {
  List<Events>? events;

  UpcomingModel({this.events});

  UpcomingModel.fromJson(Map<String, dynamic> json) {
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
  AwayScore? awayScore;
  AwayTeam? awayTeam;
  Changes? changes;
  String? customId;
  bool? finalResultOnly;
  bool? hasEventPlayerStatistics;
  bool? hasGlobalHighlights;
  AwayScore? homeScore;
  AwayTeam? homeTeam;
  int? id;
  Periods? periods;
  RoundInfo? roundInfo;
  String? slug;
  int? startTimestamp;
  Status? status;
  Time? time;
  Tournament? tournament;
  int? winnerCode;

  Events(
      {this.awayScore,
        this.awayTeam,
        this.changes,
        this.customId,
        this.finalResultOnly,
        this.hasEventPlayerStatistics,
        this.hasGlobalHighlights,
        this.homeScore,
        this.homeTeam,
        this.id,
        this.periods,
        this.roundInfo,
        this.slug,
        this.startTimestamp,
        this.status,
        this.time,
        this.tournament,
        this.winnerCode});

  Events.fromJson(Map<String, dynamic> json) {
    awayScore = json['awayScore'] != null
        ? new AwayScore.fromJson(json['awayScore'])
        : null;
    awayTeam = json['awayTeam'] != null
        ? new AwayTeam.fromJson(json['awayTeam'])
        : null;
    changes =
    json['changes'] != null ? new Changes.fromJson(json['changes']) : null;
    customId = json['customId'];
    finalResultOnly = json['finalResultOnly'];
    hasEventPlayerStatistics = json['hasEventPlayerStatistics'];
    hasGlobalHighlights = json['hasGlobalHighlights'];
    homeScore = json['homeScore'] != null
        ? new AwayScore.fromJson(json['homeScore'])
        : null;
    homeTeam = json['homeTeam'] != null
        ? new AwayTeam.fromJson(json['homeTeam'])
        : null;
    id = json['id'];
    periods =
    json['periods'] != null ? new Periods.fromJson(json['periods']) : null;
    roundInfo = json['roundInfo'] != null
        ? new RoundInfo.fromJson(json['roundInfo'])
        : null;
    slug = json['slug'];
    startTimestamp = json['startTimestamp'];
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    time = json['time'] != null ? new Time.fromJson(json['time']) : null;
    tournament = json['tournament'] != null
        ? new Tournament.fromJson(json['tournament'])
        : null;
    winnerCode = json['winnerCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.awayScore != null) {
      data['awayScore'] = this.awayScore!.toJson();
    }
    if (this.awayTeam != null) {
      data['awayTeam'] = this.awayTeam!.toJson();
    }
    if (this.changes != null) {
      data['changes'] = this.changes!.toJson();
    }
    data['customId'] = this.customId;
    data['finalResultOnly'] = this.finalResultOnly;
    data['hasEventPlayerStatistics'] = this.hasEventPlayerStatistics;
    data['hasGlobalHighlights'] = this.hasGlobalHighlights;
    if (this.homeScore != null) {
      data['homeScore'] = this.homeScore!.toJson();
    }
    if (this.homeTeam != null) {
      data['homeTeam'] = this.homeTeam!.toJson();
    }
    data['id'] = this.id;
    if (this.periods != null) {
      data['periods'] = this.periods!.toJson();
    }
    if (this.roundInfo != null) {
      data['roundInfo'] = this.roundInfo!.toJson();
    }
    data['slug'] = this.slug;
    data['startTimestamp'] = this.startTimestamp;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.time != null) {
      data['time'] = this.time!.toJson();
    }
    if (this.tournament != null) {
      data['tournament'] = this.tournament!.toJson();
    }
    data['winnerCode'] = this.winnerCode;
    return data;
  }
}

class AwayScore {
  int? current;
  int? display;
  int? period1;
  int? period2;
  int? period3;
  int? period4;

  AwayScore(
      {this.current,
        this.display,
        this.period1,
        this.period2,
        this.period3,
        this.period4});

  AwayScore.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    display = json['display'];
    period1 = json['period1'];
    period2 = json['period2'];
    period3 = json['period3'];
    period4 = json['period4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current'] = this.current;
    data['display'] = this.display;
    data['period1'] = this.period1;
    data['period2'] = this.period2;
    data['period3'] = this.period3;
    data['period4'] = this.period4;
    return data;
  }
}

class AwayTeam {
  bool? disabled;
  int? id;
  String? name;
  String? shortName;
  String? slug;
  Sport? sport;
  //List<Null>? subTeams;
  TeamColors? teamColors;
  int? type;
  int? userCount;

  AwayTeam(
      {this.disabled,
        this.id,
        this.name,
        this.shortName,
        this.slug,
        this.sport,
       // this.subTeams,
        this.teamColors,
        this.type,
        this.userCount});

  AwayTeam.fromJson(Map<String, dynamic> json) {
    disabled = json['disabled'];
    id = json['id'];
    name = json['name'];
    shortName = json['shortName'];
    slug = json['slug'];
    sport = json['sport'] != null ? new Sport.fromJson(json['sport']) : null;
    // if (json['subTeams'] != null) {
    //   subTeams = <Null>[];
    //   json['subTeams'].forEach((v) {
    //     subTeams!.add(new Null.fromJson(v));
    //   });
    // }
    teamColors = json['teamColors'] != null
        ? new TeamColors.fromJson(json['teamColors'])
        : null;
    type = json['type'];
    userCount = json['userCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['disabled'] = this.disabled;
    data['id'] = this.id;
    data['name'] = this.name;
    data['shortName'] = this.shortName;
    data['slug'] = this.slug;
    if (this.sport != null) {
      data['sport'] = this.sport!.toJson();
    }
    // if (this.subTeams != null) {
    //   data['subTeams'] = this.subTeams!.map((v) => v.toJson()).toList();
    // }
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

class Changes {
  int? changeTimestamp;
 // List<String>? changes;

  Changes({this.changeTimestamp});

  Changes.fromJson(Map<String, dynamic> json) {
    changeTimestamp = json['changeTimestamp'];
   // changes = json['changes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['changeTimestamp'] = this.changeTimestamp;
  //  data['changes'] = this.changes;
    return data;
  }
}

class Periods {
  String? current;
  String? overtime;
  String? period1;
  String? period2;
  String? period3;
  String? period4;

  Periods(
      {this.current,
        this.overtime,
        this.period1,
        this.period2,
        this.period3,
        this.period4});

  Periods.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    overtime = json['overtime'];
    period1 = json['period1'];
    period2 = json['period2'];
    period3 = json['period3'];
    period4 = json['period4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current'] = this.current;
    data['overtime'] = this.overtime;
    data['period1'] = this.period1;
    data['period2'] = this.period2;
    data['period3'] = this.period3;
    data['period4'] = this.period4;
    return data;
  }
}

class RoundInfo {
  int? round;

  RoundInfo({this.round});

  RoundInfo.fromJson(Map<String, dynamic> json) {
    round = json['round'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['round'] = this.round;
    return data;
  }
}

class Status {
  int? code;
  String? description;
  String? type;

  Status({this.code, this.description, this.type});

  Status.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['description'] = this.description;
    data['type'] = this.type;
    return data;
  }
}

class Time {
  int? overtimeLength;
  int? periodLength;
  int? totalPeriodCount;

  Time({this.overtimeLength, this.periodLength, this.totalPeriodCount});

  Time.fromJson(Map<String, dynamic> json) {
    overtimeLength = json['overtimeLength'];
    periodLength = json['periodLength'];
    totalPeriodCount = json['totalPeriodCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['overtimeLength'] = this.overtimeLength;
    data['periodLength'] = this.periodLength;
    data['totalPeriodCount'] = this.totalPeriodCount;
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
  bool? hasBoxScore;
  bool? hasEventPlayerStatistics;
  bool? hasPositionGraph;
  int? id;
  String? name;
  String? slug;
  int? userCount;

  UniqueTournament(
      {this.category,
        this.displayInverseHomeAwayTeams,
        this.hasBoxScore,
        this.hasEventPlayerStatistics,
        this.hasPositionGraph,
        this.id,
        this.name,
        this.slug,
        this.userCount});

  UniqueTournament.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    displayInverseHomeAwayTeams = json['displayInverseHomeAwayTeams'];
    hasBoxScore = json['hasBoxScore'];
    hasEventPlayerStatistics = json['hasEventPlayerStatistics'];
    hasPositionGraph = json['hasPositionGraph'];
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
    data['hasBoxScore'] = this.hasBoxScore;
    data['hasEventPlayerStatistics'] = this.hasEventPlayerStatistics;
    data['hasPositionGraph'] = this.hasPositionGraph;
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['userCount'] = this.userCount;
    return data;
  }
}