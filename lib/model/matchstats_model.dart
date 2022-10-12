class MatchStatsModel {
  List<MatchStatistics>? statistics;

  MatchStatsModel({this.statistics});

  MatchStatsModel.fromJson(Map<String, dynamic> json) {
    if (json['statistics'] != null) {
      statistics = <MatchStatistics>[];
      json['statistics'].forEach((v) {
        statistics!.add(new MatchStatistics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.statistics != null) {
      data['statistics'] = this.statistics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MatchStatistics {
  List<Groups>? groups;
  String? period;

  MatchStatistics({this.groups, this.period});

  MatchStatistics.fromJson(Map<String, dynamic> json) {
    if (json['groups'] != null) {
      groups = <Groups>[];
      json['groups'].forEach((v) {
        groups!.add(new Groups.fromJson(v));
      });
    }
    period = json['period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.groups != null) {
      data['groups'] = this.groups!.map((v) => v.toJson()).toList();
    }
    data['period'] = this.period;
    return data;
  }
}

class Groups {
  String? groupName;
  List<StatisticsItems>? statisticsItems;

  Groups({this.groupName, this.statisticsItems});

  Groups.fromJson(Map<String, dynamic> json) {
    groupName = json['groupName'];
    if (json['statisticsItems'] != null) {
      statisticsItems = <StatisticsItems>[];
      json['statisticsItems'].forEach((v) {
        statisticsItems!.add(new StatisticsItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupName'] = this.groupName;
    if (this.statisticsItems != null) {
      data['statisticsItems'] =
          this.statisticsItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StatisticsItems {
  String? away;
  int? compareCode;
  String? home;
  String? name;

  StatisticsItems({this.away, this.compareCode, this.home, this.name});

  StatisticsItems.fromJson(Map<String, dynamic> json) {
    away = json['away'];
    compareCode = json['compareCode'];
    home = json['home'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['away'] = this.away;
    data['compareCode'] = this.compareCode;
    data['home'] = this.home;
    data['name'] = this.name;
    return data;
  }
}