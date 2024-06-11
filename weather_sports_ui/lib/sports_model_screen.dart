// To parse this JSON data, do
//
//     final sportsModel = sportsModelFromJson(jsonString);

import 'dart:convert';

SportsModel sportsModelFromJson(String str) => SportsModel.fromJson(json.decode(str));

String sportsModelToJson(SportsModel data) => json.encode(data.toJson());

class SportsModel {
  List<Football>? football;
  List<dynamic>? cricket;
  List<dynamic>? golf;

  SportsModel({
    this.football,
    this.cricket,
    this.golf,
  });

  factory SportsModel.fromJson(Map<String, dynamic> json) => SportsModel(
    football: json["football"] == null ? [] : List<Football>.from(json["football"]!.map((x) => Football.fromJson(x))),
    cricket: json["cricket"] == null ? [] : List<dynamic>.from(json["cricket"]!.map((x) => x)),
    golf: json["golf"] == null ? [] : List<dynamic>.from(json["golf"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "football": football == null ? [] : List<dynamic>.from(football!.map((x) => x.toJson())),
    "cricket": cricket == null ? [] : List<dynamic>.from(cricket!.map((x) => x)),
    "golf": golf == null ? [] : List<dynamic>.from(golf!.map((x) => x)),
  };
}

class Football {
  String? stadium;
  String? country;
  String? region;
  String? tournament;
  String? start;
  String? match;

  Football({
    this.stadium,
    this.country,
    this.region,
    this.tournament,
    this.start,
    this.match,
  });

  factory Football.fromJson(Map<String, dynamic> json) => Football(
    stadium: json["stadium"],
    country: json["country"],
    region: json["region"],
    tournament: json["tournament"],
    start: json["start"],
    match: json["match"],
  );

  Map<String, dynamic> toJson() => {
    "stadium": stadium,
    "country": country,
    "region": region,
    "tournament": tournament,
    "start": start,
    "match": match,
  };
}
