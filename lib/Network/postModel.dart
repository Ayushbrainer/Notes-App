// To parse this JSON data, do
//
//     final postNote = postNoteFromJson(jsonString);

import 'dart:convert';

PostNote postNoteFromJson(String str) => PostNote.fromJson(json.decode(str));

String postNoteToJson(PostNote data) => jsonEncode(data.toJson());

class PostNote {
  PostNote({
    this.id,
    this.userName,
    this.title,
    this.note,
    this.date,
    this.v,
  });

  Id id;
  String userName;
  String title;
  String note;
  DateTime date;
  V v;

  factory PostNote.fromJson(Map<String, dynamic> json) => PostNote(
    id: Id.fromJson(json["_id"]),
    userName: json["userName"],
    title: json["title"],
    note: json["note"],
    date: DateTime.parse(json["date"]),
    v: V.fromJson(json["__v"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userName": userName,
    "title": title,
    "note": note,
    "date": date.toIso8601String(),
    "__v": v.toJson(),
  };
}

class Id {
  Id({
    this.oid,
  });

  String oid;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    oid: json["\u0024oid"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024oid": oid,
  };
}

class V {
  V({
    this.numberInt,
  });

  String numberInt;

  factory V.fromJson(Map<String, dynamic> json) => V(
    numberInt: json["\u0024numberInt"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024numberInt": numberInt,
  };
}
