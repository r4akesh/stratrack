class MatchDetailModel {
  Away? away;
  bool? confirmed;
  Home? home;
  MatchDetailModel({this.away, this.home, this.confirmed});

  MatchDetailModel.fromJson(Map<String, dynamic> json) {
    away = json['away'] != null ? new Away.fromJson(json['away']) : null;
    home = json['home'] != null ? new Home.fromJson(json['home']) : null;
    confirmed = json['confirmed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.away != null) {
      data['away'] = this.away!.toJson();
    }

    if (this.home != null) {
      data['home'] = this.home!.toJson();
    }
    data['confirmed'] = this.confirmed;
    return data;
  }
}

class Away {
  GoalkeeperColor? goalkeeperColor;
  GoalkeeperColor? playerColor;
  List<Players>? players;

  Away({this.goalkeeperColor, this.playerColor, this.players});

  Away.fromJson(Map<String, dynamic> json) {
    goalkeeperColor = json['goalkeeperColor'] != null
        ? new GoalkeeperColor.fromJson(json['goalkeeperColor'])
        : null;
    playerColor = json['playerColor'] != null
        ? new GoalkeeperColor.fromJson(json['playerColor'])
        : null;
    if (json['players'] != null) {
      players = <Players>[];
      json['players'].forEach((v) {
        players!.add(new Players.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.goalkeeperColor != null) {
      data['goalkeeperColor'] = this.goalkeeperColor!.toJson();
    }
    if (this.playerColor != null) {
      data['playerColor'] = this.playerColor!.toJson();
    }
    if (this.players != null) {
      data['players'] = this.players!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Home {
  GoalkeeperColor? goalkeeperColor;
  GoalkeeperColor? playerColor;
  List<Players>? players;

  Home({this.goalkeeperColor, this.playerColor, this.players});

  Home.fromJson(Map<String, dynamic> json) {
    goalkeeperColor = json['goalkeeperColor'] != null
        ? new GoalkeeperColor.fromJson(json['goalkeeperColor'])
        : null;
    playerColor = json['playerColor'] != null
        ? new GoalkeeperColor.fromJson(json['playerColor'])
        : null;
    if (json['players'] != null) {
      players = <Players>[];
      json['players'].forEach((v) {
        players!.add(new Players.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.goalkeeperColor != null) {
      data['goalkeeperColor'] = this.goalkeeperColor!.toJson();
    }
    if (this.playerColor != null) {
      data['playerColor'] = this.playerColor!.toJson();
    }
    if (this.players != null) {
      data['players'] = this.players!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GoalkeeperColor {
  String? fancyNumber;
  String? number;
  String? outline;
  String? primary;

  GoalkeeperColor({this.fancyNumber, this.number, this.outline, this.primary});

  GoalkeeperColor.fromJson(Map<String, dynamic> json) {
    fancyNumber = json['fancyNumber'];
    number = json['number'];
    outline = json['outline'];
    primary = json['primary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fancyNumber'] = this.fancyNumber;
    data['number'] = this.number;
    data['outline'] = this.outline;
    data['primary'] = this.primary;
    return data;
  }
}

class Players {
  Player? player;
  String? position;
  Statistics? statistics;
  bool? substitute;

  Players({this.player, this.position, this.statistics, this.substitute});

  Players.fromJson(Map<String, dynamic> json) {
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
    position = json['position'];
    statistics = json['statistics'] != null
        ? new Statistics.fromJson(json['statistics'])
        : null;
    substitute = json['substitute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    data['position'] = this.position;
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.toJson();
    }
    data['substitute'] = this.substitute;
    return data;
  }
}

class Player {
  Country? country;
  int? dateOfBirthTimestamp;
  String? firstName;
  int? id;
  String? lastName;
  String? marketValueCurrency;
  String? name;
  String? position;
  String? shortName;
  String? slug;
  int? userCount;

  Player(
      {this.country,
      this.dateOfBirthTimestamp,
      this.firstName,
      this.id,
      this.lastName,
      this.marketValueCurrency,
      this.name,
      this.position,
      this.shortName,
      this.slug,
      this.userCount});

  Player.fromJson(Map<String, dynamic> json) {
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    dateOfBirthTimestamp = json['dateOfBirthTimestamp'];
    firstName = json['firstName'];
    id = json['id'];
    lastName = json['lastName'];
    marketValueCurrency = json['marketValueCurrency'];
    name = json['name'];
    position = json['position'];
    shortName = json['shortName'];
    slug = json['slug'];
    userCount = json['userCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    data['dateOfBirthTimestamp'] = this.dateOfBirthTimestamp;
    data['firstName'] = this.firstName;
    data['id'] = this.id;
    data['lastName'] = this.lastName;
    data['marketValueCurrency'] = this.marketValueCurrency;
    data['name'] = this.name;
    data['position'] = this.position;
    data['shortName'] = this.shortName;
    data['slug'] = this.slug;
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

class Statistics {
  int? defensiveAssistTackles;
  int? defensiveCombineTackles;
  int? defensiveForcedFumbles;
  int? defensiveInterceptions;
  // int? defensiveInterceptionsYards;
  int? defensivePassesDefensed;
  int? defensiveSacks;
  int? fumbleFumbles;
  int? fumbleLost;
  int? fumbleRecovery;
  int? fumbleTouchdownReturns;
  // int? kickReturnsAverageYards;
  // int? kickReturnsLong;
  int? kickReturnsTotal; //used
  // int? kickReturnsTouchdowns;
  // int? kickReturnsYards;
  // int? kickingExtraAttempts;
  // int? kickingExtraMade;
  int? passingAttempts;
  int? passingCompletions;
  int? passingInterceptions;
  int? passingLongest;
  int? passingNetYards;
  int? passingSacked;
  int? passingTouchdowns;
  int? passingYards; //used
  double? passingYardsPerAttempt; //used
  // int? puntReturnsLong;
  // int? puntReturnsTotal;
  // int? puntReturnsYards;
  // int? puntingBlocked;
  // int? puntingInside20;
  // int? puntingLongest;
  // int? puntingNetYards;
  // int? puntingTotal;
  // int? puntingTouchbacks;
  // int? puntingYards;
  // double? puntingYardsPerPuntAvg;
  int? receivingLongest;
  int? receivingReceptions;
  int? receivingTouchdowns;
  int? receivingYards; //used
  double? receivingYardsPerReception; //used
  int? rushingAttempts;
  int? rushingLongest;
  int? rushingTouchdowns;
  int? rushingYards; //used
  double? rushingYardsPerAttempt;

  Statistics({
    this.defensiveAssistTackles,
    this.defensiveCombineTackles,
    this.defensiveForcedFumbles,
    this.defensiveInterceptions,
    // this.defensiveInterceptionsYards,
    this.defensivePassesDefensed,
    this.defensiveSacks,
    this.fumbleFumbles,
    this.fumbleLost,
    this.fumbleRecovery,
    this.fumbleTouchdownReturns,
    // this.kickReturnsAverageYards,
    // this.kickReturnsLong,
    this.kickReturnsTotal,
    // this.kickReturnsTouchdowns,
    // this.kickReturnsYards,
    // this.kickingExtraAttempts,
    // this.kickingExtraMade,
    this.passingAttempts,
    this.passingCompletions,
    this.passingInterceptions,
    this.passingLongest,
    this.passingNetYards,
    this.passingSacked,
    this.passingTouchdowns,
    this.passingYards,
    this.passingYardsPerAttempt,
    // this.puntReturnsLong,
    // this.puntReturnsTotal,
    // this.puntReturnsYards,
    // this.puntingBlocked,
    // this.puntingInside20,
    // this.puntingLongest,
    // this.puntingNetYards,
    // this.puntingTotal,
    // this.puntingTouchbacks,
    // this.puntingYards,
    // this.puntingYardsPerPuntAvg,
    this.receivingLongest,
    this.receivingReceptions,
    this.receivingTouchdowns,
    this.receivingYards,
    this.receivingYardsPerReception,
    // this.rushingAttempts,
    // this.rushingLongest,
    // this.rushingTouchdowns,
    this.rushingYards,
    // this.rushingYardsPerAttempt
  });

  Statistics.fromJson(Map<String, dynamic> json) {
    defensiveAssistTackles = json['defensiveAssistTackles'];
    defensiveCombineTackles = json['defensiveCombineTackles'];
    defensiveForcedFumbles = json['defensiveForcedFumbles'];
    defensiveInterceptions = json['defensiveInterceptions'];
    // defensiveInterceptionsYards = json['defensiveInterceptionsYards'];
    defensivePassesDefensed = json['defensivePassesDefensed'];
    defensiveSacks = json['defensiveSacks'];
    fumbleFumbles = int.parse(((json['fumbleFumbles'] ?? "0").toString()));
    fumbleLost = int.parse(((json['fumbleLost'] ?? "0").toString()));
    fumbleRecovery = int.parse(((json['fumbleRecovery'] ?? "0").toString()));
    fumbleTouchdownReturns =
        int.parse(((json['fumbleTouchdownReturns'] ?? "0").toString()));
    // kickReturnsAverageYards = json['kickReturnsAverageYards'];
    // kickReturnsLong = json['kickReturnsLong'];
    kickReturnsTotal =
        int.parse(((json['kickReturnsTotal'] ?? "0").toString()));
    // kickReturnsTouchdowns = json['kickReturnsTouchdowns'];
    // kickReturnsYards = json['kickReturnsYards'];
    // kickingExtraAttempts = json['kickingExtraAttempts'];
    // kickingExtraMade = json['kickingExtraMade'];
    passingAttempts = int.parse(((json['passingAttempts'] ?? "0").toString()));
    passingCompletions =
        int.parse(((json['passingCompletions'] ?? "0").toString()));
    passingInterceptions =
        int.parse(((json['passingInterceptions'] ?? "0").toString()));
    passingLongest = int.parse(((json['passingLongest'] ?? "0").toString()));
    passingNetYards = int.parse(((json['passingNetYards'] ?? "0").toString()));
    passingSacked = int.parse(((json['passingSacked'] ?? "0").toString()));
    passingTouchdowns =
        int.parse(((json['passingTouchdowns'] ?? "0").toString()));
    passingYards = int.parse(((json['passingYards'] ?? "0").toString()));
    passingYardsPerAttempt =
        double.parse(((json['passingYardsPerAttempt'] ?? "0").toString()));
    // puntReturnsLong = json['puntReturnsLong'];
    // puntReturnsTotal = json['puntReturnsTotal'];
    // puntReturnsYards = json['puntReturnsYards'];
    // puntingBlocked = json['puntingBlocked'];
    // puntingInside20 = json['puntingInside20'];
    // puntingLongest = json['puntingLongest'];
    // puntingNetYards = json['puntingNetYards'];
    // puntingTotal = json['puntingTotal'];
    // puntingTouchbacks = json['puntingTouchbacks'];
    // puntingYards = json['puntingYards'];
    // puntingYardsPerPuntAvg = json['puntingYardsPerPuntAvg'];
    receivingLongest =
        int.parse(((json['receivingLongest'] ?? "0").toString()));
    receivingReceptions =
        int.parse(((json['receivingReceptions'] ?? "0").toString()));
    receivingTouchdowns =
        int.parse(((json['receivingTouchdowns'] ?? "0").toString()));
    receivingYards = int.parse(((json['receivingYards'] ?? "0").toString()));
    receivingYardsPerReception =
        double.parse(((json['receivingYardsPerReception'] ?? "0").toString()));
    rushingAttempts = int.parse(((json['rushingAttempts'] ?? "0").toString()));
    rushingLongest = int.parse(((json['rushingLongest'] ?? "0").toString()));
    rushingTouchdowns =
        int.parse(((json['rushingTouchdowns'] ?? "0").toString()));
    rushingYards = int.parse(((json['rushingYards'] ?? "0").toString()));
    rushingYardsPerAttempt =
        double.parse(((json['rushingYardsPerAttempt'] ?? "0").toString()));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['defensiveAssistTackles'] = this.defensiveAssistTackles;
    // data['defensiveCombineTackles'] = this.defensiveCombineTackles;
    // data['defensiveForcedFumbles'] = this.defensiveForcedFumbles;
    // data['defensiveInterceptions'] = this.defensiveInterceptions;
    // data['defensiveInterceptionsYards'] = this.defensiveInterceptionsYards;
    // data['defensivePassesDefensed'] = this.defensivePassesDefensed;
    // data['defensiveSacks'] = this.defensiveSacks;
    // data['fumbleFumbles'] = this.fumbleFumbles;
    // data['fumbleLost'] = this.fumbleLost;
    // data['fumbleRecovery'] = this.fumbleRecovery;
    // data['fumbleTouchdownReturns'] = this.fumbleTouchdownReturns;
    // data['kickReturnsAverageYards'] = this.kickReturnsAverageYards;
    // data['kickReturnsLong'] = this.kickReturnsLong;
    //  data['kickReturnsTotal'] = this.kickReturnsTotal;
    // data['kickReturnsTouchdowns'] = this.kickReturnsTouchdowns;
    // data['kickReturnsYards'] = this.kickReturnsYards;
    // data['kickingExtraAttempts'] = this.kickingExtraAttempts;
    // data['kickingExtraMade'] = this.kickingExtraMade;
    // data['passingAttempts'] = this.passingAttempts;
    // data['passingCompletions'] = this.passingCompletions;
    // data['passingInterceptions'] = this.passingInterceptions;
    // data['passingLongest'] = this.passingLongest;
    // data['passingNetYards'] = this.passingNetYards;
    // data['passingSacked'] = this.passingSacked;
    // data['passingTouchdowns'] = this.passingTouchdowns;
    data['passingYards'] = this.passingYards;
    data['passingYardsPerAttempt'] = this.passingYardsPerAttempt;
    // data['puntReturnsLong'] = this.puntReturnsLong;
    // data['puntReturnsTotal'] = this.puntReturnsTotal;
    // data['puntReturnsYards'] = this.puntReturnsYards;
    // data['puntingBlocked'] = this.puntingBlocked;
    // data['puntingInside20'] = this.puntingInside20;
    // data['puntingLongest'] = this.puntingLongest;
    // data['puntingNetYards'] = this.puntingNetYards;
    // data['puntingTotal'] = this.puntingTotal;
    // data['puntingTouchbacks'] = this.puntingTouchbacks;
    // data['puntingYards'] = this.puntingYards;
    // data['puntingYardsPerPuntAvg'] = this.puntingYardsPerPuntAvg;
    // data['receivingLongest'] = this.receivingLongest;
    // data['receivingReceptions'] = this.receivingReceptions;
    // data['receivingTouchdowns'] = this.receivingTouchdowns;
    data['receivingYards'] = this.receivingYards;
    data['receivingYardsPerReception'] = this.receivingYardsPerReception;
    // data['rushingAttempts'] = this.rushingAttempts;
    // data['rushingLongest'] = this.rushingLongest;
    // data['rushingTouchdowns'] = this.rushingTouchdowns;
    data['rushingYards'] = this.rushingYards;
    // data['rushingYardsPerAttempt'] = this.rushingYardsPerAttempt;
    return data;
  }
}
