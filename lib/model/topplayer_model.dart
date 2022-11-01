class TopPlayerModel {
  TopPlayers? topPlayers;

  TopPlayerModel({this.topPlayers});

  TopPlayerModel.fromJson(Map<String, dynamic> json) {
    topPlayers = json['topPlayers'] != null
        ? new TopPlayers.fromJson(json['topPlayers'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.topPlayers != null) {
      data['topPlayers'] = this.topPlayers!.toJson();
    }
    return data;
  }
}

class TopPlayers {
  List<DefensiveInterceptions>? defensiveInterceptions;
  List<DefensiveSacks>? defensiveSacks;
  List<DefensiveTotalTackles>? defensiveTotalTackles;
  List<KickingFgMade>? kickingFgMade;
  
  List<PassingCompletionPercentage>? passingCompletionPercentage;
  List<PassingTouchdownInterceptionRatio>? passingTouchdownInterceptionRatio;
  List<PassingTouchdowns>? passingTouchdowns;
  List<ReceivingTouchdowns>? receivingTouchdowns;
 
  List<ReceivingYardsPerReception>? receivingYardsPerReception;
  List<RushingTouchdowns>? rushingTouchdowns;
  List<RushingYardsPerAttempt>? rushingYardsPerAttempt;

  TopPlayers(
      {this.defensiveInterceptions,
      this.defensiveSacks,
      this.defensiveTotalTackles,
      this.kickingFgMade,
      this.passingCompletionPercentage,
      this.passingTouchdownInterceptionRatio,
      this.passingTouchdowns,
      this.receivingTouchdowns,
      this.receivingYardsPerReception,
      this.rushingTouchdowns,
      this.rushingYardsPerAttempt});

  TopPlayers.fromJson(Map<String, dynamic> json) {
    if (json['defensiveInterceptions'] != null) {
      defensiveInterceptions = <DefensiveInterceptions>[];
      json['defensiveInterceptions'].forEach((v) {
        defensiveInterceptions!.add(new DefensiveInterceptions.fromJson(v));
      });
    }
    if (json['defensiveSacks'] != null) {
      defensiveSacks = <DefensiveSacks>[];
      json['defensiveSacks'].forEach((v) {
        defensiveSacks!.add(new DefensiveSacks.fromJson(v));
      });
    }
    if (json['defensiveTotalTackles'] != null) {
      defensiveTotalTackles = <DefensiveTotalTackles>[];
      json['defensiveTotalTackles'].forEach((v) {
        defensiveTotalTackles!.add(new DefensiveTotalTackles.fromJson(v));
      });
    }
    if (json['kickingFgMade'] != null) {
      kickingFgMade = <KickingFgMade>[];
      json['kickingFgMade'].forEach((v) {
        kickingFgMade!.add(new KickingFgMade.fromJson(v));
      });
    }
    if (json['passingCompletionPercentage'] != null) {
      passingCompletionPercentage = <PassingCompletionPercentage>[];
      json['passingCompletionPercentage'].forEach((v) {
        passingCompletionPercentage!
            .add(new PassingCompletionPercentage.fromJson(v));
      });
    }
    if (json['passingTouchdownInterceptionRatio'] != null) {
      passingTouchdownInterceptionRatio = <PassingTouchdownInterceptionRatio>[];
      json['passingTouchdownInterceptionRatio'].forEach((v) {
        passingTouchdownInterceptionRatio!
            .add(new PassingTouchdownInterceptionRatio.fromJson(v));
      });
    }
    if (json['passingTouchdowns'] != null) {
      passingTouchdowns = <PassingTouchdowns>[];
      json['passingTouchdowns'].forEach((v) {
        passingTouchdowns!.add(new PassingTouchdowns.fromJson(v));
      });
    }
    if (json['receivingTouchdowns'] != null) {
      receivingTouchdowns = <ReceivingTouchdowns>[];
      json['receivingTouchdowns'].forEach((v) {
        receivingTouchdowns!.add(new ReceivingTouchdowns.fromJson(v));
      });
    }
    if (json['receivingYardsPerReception'] != null) {
      receivingYardsPerReception = <ReceivingYardsPerReception>[];
      json['receivingYardsPerReception'].forEach((v) {
        receivingYardsPerReception!
            .add(new ReceivingYardsPerReception.fromJson(v));
      });
    }
    if (json['rushingTouchdowns'] != null) {
      rushingTouchdowns = <RushingTouchdowns>[];
      json['rushingTouchdowns'].forEach((v) {
        rushingTouchdowns!.add(new RushingTouchdowns.fromJson(v));
      });
    }
    if (json['rushingYardsPerAttempt'] != null) {
      rushingYardsPerAttempt = <RushingYardsPerAttempt>[];
      json['rushingYardsPerAttempt'].forEach((v) {
        rushingYardsPerAttempt!.add(new RushingYardsPerAttempt.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.defensiveInterceptions != null) {
      data['defensiveInterceptions'] =
          this.defensiveInterceptions!.map((v) => v.toJson()).toList();
    }
    if (this.defensiveSacks != null) {
      data['defensiveSacks'] =
          this.defensiveSacks!.map((v) => v.toJson()).toList();
    }
    if (this.defensiveTotalTackles != null) {
      data['defensiveTotalTackles'] =
          this.defensiveTotalTackles!.map((v) => v.toJson()).toList();
    }
    if (this.kickingFgMade != null) {
      data['kickingFgMade'] =
          this.kickingFgMade!.map((v) => v.toJson()).toList();
    }
    if (this.passingCompletionPercentage != null) {
      data['passingCompletionPercentage'] =
          this.passingCompletionPercentage!.map((v) => v.toJson()).toList();
    }
    if (this.passingTouchdownInterceptionRatio != null) {
      data['passingTouchdownInterceptionRatio'] = this
          .passingTouchdownInterceptionRatio!
          .map((v) => v.toJson())
          .toList();
    }
    if (this.passingTouchdowns != null) {
      data['passingTouchdowns'] =
          this.passingTouchdowns!.map((v) => v.toJson()).toList();
    }
    if (this.receivingTouchdowns != null) {
      data['receivingTouchdowns'] =
          this.receivingTouchdowns!.map((v) => v.toJson()).toList();
    }
    if (this.receivingYardsPerReception != null) {
      data['receivingYardsPerReception'] =
          this.receivingYardsPerReception!.map((v) => v.toJson()).toList();
    }
    if (this.rushingTouchdowns != null) {
      data['rushingTouchdowns'] =
          this.rushingTouchdowns!.map((v) => v.toJson()).toList();
    }
    if (this.rushingYardsPerAttempt != null) {
      data['rushingYardsPerAttempt'] =
          this.rushingYardsPerAttempt!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DefensiveInterceptions {
  bool? playedEnough;
  Player? player;
  Statistics? statistics;

  DefensiveInterceptions({this.playedEnough, this.player, this.statistics});

  DefensiveInterceptions.fromJson(Map<String, dynamic> json) {
    playedEnough = json['playedEnough'];
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
    statistics = json['statistics'] != null
        ? new Statistics.fromJson(json['statistics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playedEnough'] = this.playedEnough;
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.toJson();
    }
    return data;
  }
}

class Player {
  int? id;
  String? name;
  String? position;
  String? shortName;
  String? slug;
  int? userCount;

  Player(
      {this.id,
      this.name,
      this.position,
      this.shortName,
      this.slug,
      this.userCount});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    position = json['position'];
    shortName = json['shortName'];
    slug = json['slug'];
    userCount = json['userCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['position'] = this.position;
    data['shortName'] = this.shortName;
    data['slug'] = this.slug;
    data['userCount'] = this.userCount;
    return data;
  }
}

class Statistics {
  int? appearances;
  int? defensiveInterceptions;
  int? id;
  String? type;

  Statistics(
      {this.appearances, this.defensiveInterceptions, this.id, this.type});

  Statistics.fromJson(Map<String, dynamic> json) {
    appearances = json['appearances'];
    defensiveInterceptions = json['defensiveInterceptions'];
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appearances'] = this.appearances;
    data['defensiveInterceptions'] = this.defensiveInterceptions;
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}


class DefensiveSacks {
  bool? playedEnough;
  Player? player;
  Statistics? statistics;

  DefensiveSacks({this.playedEnough, this.player, this.statistics});

  DefensiveSacks.fromJson(Map<String, dynamic> json) {
    playedEnough = json['playedEnough'];
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
    statistics = json['statistics'] != null
        ? new Statistics.fromJson(json['statistics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playedEnough'] = this.playedEnough;
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.toJson();
    }
    return data;
  }
}


class DefensiveTotalTackles {
  bool? playedEnough;
  Player? player;
  Statistics? statistics;

  DefensiveTotalTackles({this.playedEnough, this.player, this.statistics});

  DefensiveTotalTackles.fromJson(Map<String, dynamic> json) {
    playedEnough = json['playedEnough'];
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
    statistics = json['statistics'] != null
        ? new Statistics.fromJson(json['statistics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playedEnough'] = this.playedEnough;
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.toJson();
    }
    return data;
  }
}
 

class KickingFgMade {
  bool? playedEnough;
  Player? player;
  Statistics? statistics;

  KickingFgMade({this.playedEnough, this.player, this.statistics});

  KickingFgMade.fromJson(Map<String, dynamic> json) {
    playedEnough = json['playedEnough'];
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
    statistics = json['statistics'] != null
        ? new Statistics.fromJson(json['statistics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playedEnough'] = this.playedEnough;
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.toJson();
    }
    return data;
  }
}

class PassingCompletionPercentage {
  bool? playedEnough;
  Player? player;
  Statistics? statistics;

  PassingCompletionPercentage({this.playedEnough, this.player, this.statistics});

  PassingCompletionPercentage.fromJson(Map<String, dynamic> json) {
    playedEnough = json['playedEnough'];
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
    statistics = json['statistics'] != null
        ? new Statistics.fromJson(json['statistics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playedEnough'] = this.playedEnough;
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.toJson();
    }
    return data;
  }
}

class PassingTouchdownInterceptionRatio {
  bool? playedEnough;
  Player? player;
  Statistics? statistics;

  PassingTouchdownInterceptionRatio({this.playedEnough, this.player, this.statistics});

  PassingTouchdownInterceptionRatio.fromJson(Map<String, dynamic> json) {
    playedEnough = json['playedEnough'];
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
    statistics = json['statistics'] != null
        ? new Statistics.fromJson(json['statistics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playedEnough'] = this.playedEnough;
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.toJson();
    }
    return data;
  }
}

class PassingTouchdowns {
  bool? playedEnough;
  Player? player;
  Statistics? statistics;

  PassingTouchdowns({this.playedEnough, this.player, this.statistics});

  PassingTouchdowns.fromJson(Map<String, dynamic> json) {
    playedEnough = json['playedEnough'];
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
    statistics = json['statistics'] != null
        ? new Statistics.fromJson(json['statistics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playedEnough'] = this.playedEnough;
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.toJson();
    }
    return data;
  }
}

class ReceivingTouchdowns {
  bool? playedEnough;
  Player? player;
  Statistics? statistics;

  ReceivingTouchdowns({this.playedEnough, this.player, this.statistics});

  ReceivingTouchdowns.fromJson(Map<String, dynamic> json) {
    playedEnough = json['playedEnough'];
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
    statistics = json['statistics'] != null
        ? new Statistics.fromJson(json['statistics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playedEnough'] = this.playedEnough;
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.toJson();
    }
    return data;
  }
}

class ReceivingYardsPerReception {
  bool? playedEnough;
  Player? player;
  Statistics? statistics;

  ReceivingYardsPerReception({this.playedEnough, this.player, this.statistics});

  ReceivingYardsPerReception.fromJson(Map<String, dynamic> json) {
    playedEnough = json['playedEnough'];
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
    statistics = json['statistics'] != null
        ? new Statistics.fromJson(json['statistics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playedEnough'] = this.playedEnough;
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.toJson();
    }
    return data;
  }
}

class RushingTouchdowns {
  bool? playedEnough;
  Player? player;
  Statistics? statistics;

  RushingTouchdowns({this.playedEnough, this.player, this.statistics});

  RushingTouchdowns.fromJson(Map<String, dynamic> json) {
    playedEnough = json['playedEnough'];
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
    statistics = json['statistics'] != null
        ? new Statistics.fromJson(json['statistics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playedEnough'] = this.playedEnough;
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.toJson();
    }
    return data;
  }
}

class RushingYardsPerAttempt {
  bool? playedEnough;
  Player? player;
  Statistics? statistics;

  RushingYardsPerAttempt({this.playedEnough, this.player, this.statistics});

  RushingYardsPerAttempt.fromJson(Map<String, dynamic> json) {
    playedEnough = json['playedEnough'];
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
    statistics = json['statistics'] != null
        ? new Statistics.fromJson(json['statistics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playedEnough'] = this.playedEnough;
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.toJson();
    }
    return data;
  }
}

