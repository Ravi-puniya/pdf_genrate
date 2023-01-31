import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome(
      {required this.name,
      required this.w,
      required this.s1,
      required this.s2,
      required this.a1,
      required this.a2,
      required this.a3,
      required this.a4,
      required this.tracking,
      required this.tracking2,
      required this.billing,
      required this.decs,
      required this.referanceno1,
      required this.referanceno2,
      required this.lastData,
      required this.lastData2,
      required this.maxi,
      required this.country});

  var name;
  var w;
  var s1;
  var s2;
  var a1;
  var a2;
  var a3;
  var a4;
  var tracking;
  var tracking2;
  var billing;
  var decs;
  var referanceno1;
  var referanceno2;
  var lastData;
  var lastData2;
  var maxi;
  var country;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
      name: json["NAME"],
      w: json["W"],
      s1: json["S1"],
      s2: json["S2"],
      a1: json["A1"],
      a2: json["A2"],
      a3: json["A3"],
      a4: json["A4"],
      tracking: json["TRACKING"],
      tracking2: json["TRACKING2"],
      billing: json["BILLING"],
      decs: json["DECS"],
      referanceno1: json["REFERANCENO1"],
      referanceno2: json["REFERANCENO2"],
      lastData: json["LAST_DATA"],
      lastData2: json["LAST_DATA2"],
      maxi: json['MAXI'],
      country: json['COUNTRY']);

  Map<String, dynamic> toJson() => {
        "NAME": name,
        "W": w,
        "S1": s1,
        "S2": s2,
        "A1": a1,
        "A2": a2,
        "A3": a3,
        "A4": a4,
        "TRACKING": tracking,
        "TRACKING2": tracking2,
        "BILLING": billing,
        "DECS": decs,
        "REFERANCENO1": referanceno1,
        "REFERANCENO2": referanceno2,
        "LAST_DATA": lastData,
        "LAST_DATA2": lastData2,
        "MAXI": maxi,
        "COUNTRY": country
      };
}
