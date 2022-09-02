
class UpcomingModel {
  String? id;
  int? year;
  String? type;
  String? name;
  Week? week;
  String? sComment;

  UpcomingModel(
      {this.id, this.year, this.type, this.name, this.week, this.sComment});

  UpcomingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    year = json['year'];
    type = json['type'];
    name = json['name'];
    week = json['week'] != null ? new Week.fromJson(json['week']) : null;
    sComment = json['_comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['year'] = this.year;
    data['type'] = this.type;
    data['name'] = this.name;
    if (this.week != null) {
      data['week'] = this.week!.toJson();
    }
    data['_comment'] = this.sComment;
    return data;
  }
}

class Week {
  String? id;
  int? sequence;
  String? title;
  List<Games>? games;

  Week({this.id, this.sequence, this.title, this.games});

  Week.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sequence = json['sequence'];
    title = json['title'];
    if (json['games'] != null) {
      games = <Games>[];
      json['games'].forEach((v) {
        games!.add(new Games.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sequence'] = this.sequence;
    data['title'] = this.title;
    if (this.games != null) {
      data['games'] = this.games!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Games {
  String? id;
  String? status;
  String? scheduled;
  String? entryMode;
  String? srId;
  String? gameType;
  Venue? venue;
  Home? home;
  Home? away;
  Broadcast? broadcast;

  Games(
      {this.id,
        this.status,
        this.scheduled,
        this.entryMode,
        this.srId,
        this.gameType,
        this.venue,
        this.home,
        this.away,
        this.broadcast});

  Games.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    scheduled = json['scheduled'];
    entryMode = json['entry_mode'];
    srId = json['sr_id'];
    gameType = json['game_type'];
    venue = json['venue'] != null ? new Venue.fromJson(json['venue']) : null;
    home = json['home'] != null ? new Home.fromJson(json['home']) : null;
    away = json['away'] != null ? new Home.fromJson(json['away']) : null;
    broadcast = json['broadcast'] != null
        ? new Broadcast.fromJson(json['broadcast'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['scheduled'] = this.scheduled;
    data['entry_mode'] = this.entryMode;
    data['sr_id'] = this.srId;
    data['game_type'] = this.gameType;
    if (this.venue != null) {
      data['venue'] = this.venue!.toJson();
    }
    if (this.home != null) {
      data['home'] = this.home!.toJson();
    }
    if (this.away != null) {
      data['away'] = this.away!.toJson();
    }
    if (this.broadcast != null) {
      data['broadcast'] = this.broadcast!.toJson();
    }
    return data;
  }
}

class Venue {
  String? id;
  String? name;
  String? city;
  String? state;
  String? country;
  String? zip;
  String? address;
  int? capacity;
  String? surface;
  String? roofType;
  String? srId;
  Location? location;

  Venue(
      {this.id,
        this.name,
        this.city,
        this.state,
        this.country,
        this.zip,
        this.address,
        this.capacity,
        this.surface,
        this.roofType,
        this.srId,
        this.location});

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zip = json['zip'];
    address = json['address'];
    capacity = json['capacity'];
    surface = json['surface'];
    roofType = json['roof_type'];
    srId = json['sr_id'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['zip'] = this.zip;
    data['address'] = this.address;
    data['capacity'] = this.capacity;
    data['surface'] = this.surface;
    data['roof_type'] = this.roofType;
    data['sr_id'] = this.srId;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class Location {
  String? lat;
  String? lng;

  Location({this.lat, this.lng});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Home {
  String? id;
  String? name;
  String? alias;
  int? gameNumber;
  String? srId;

  Home({this.id, this.name, this.alias, this.gameNumber, this.srId});

  Home.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alias = json['alias'];
    gameNumber = json['game_number'];
    srId = json['sr_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['alias'] = this.alias;
    data['game_number'] = this.gameNumber;
    data['sr_id'] = this.srId;
    return data;
  }
}

class Broadcast {
  String? network;
  String? satellite;

  Broadcast({this.network, this.satellite});

  Broadcast.fromJson(Map<String, dynamic> json) {
    network = json['network'];
    satellite = json['satellite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['network'] = this.network;
    data['satellite'] = this.satellite;
    return data;
  }
}