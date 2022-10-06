class MatchHilightModel {
  List<Highlights>? highlights;

  MatchHilightModel({this.highlights});

  MatchHilightModel.fromJson(Map<String, dynamic> json) {
    if (json['highlights'] != null) {
      highlights = <Highlights>[];

      var _list = json['highlights'] ?? [];

      for(var item in _list){
        highlights!.add( Highlights.fromJson(item));
      }

      // json['highlights'].forEach((v) {
      //
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.highlights != null) {
      data['highlights'] = this.highlights!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Highlights {
  int? createdAtTimestamp;
  bool? doFollow;
  int? id;
  int? mediaType;
  String? sourceUrl;
  String? subtitle;
  String? thumbnailUrl;
  String? title;
  String? url;

  Highlights(
      {this.createdAtTimestamp,
        this.doFollow,
        this.id,
        this.mediaType,
        this.sourceUrl,
        this.subtitle,
        this.thumbnailUrl,
        this.title,
        this.url});

  Highlights.fromJson(Map<String, dynamic> json) {
    createdAtTimestamp = json['createdAtTimestamp'];
    doFollow = json['doFollow'];
    id = json['id'];
    mediaType = json['mediaType'];
    sourceUrl = json['sourceUrl'];
    subtitle = json['subtitle'];
    thumbnailUrl = json['thumbnailUrl'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAtTimestamp'] = this.createdAtTimestamp;
    data['doFollow'] = this.doFollow;
    data['id'] = this.id;
    data['mediaType'] = this.mediaType;
    data['sourceUrl'] = this.sourceUrl;
    data['subtitle'] = this.subtitle;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}