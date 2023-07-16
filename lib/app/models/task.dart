import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Task todoFromJson(String str) => Task.fromJson(json.decode(str));

String todoToJson(Task data) => json.encode(data.toJson());

class Task {
  String? id;
  final String? title;
  final String? description;
  final String? selectionDate;
  final Timestamp? createdAt;
  Task({this.id,this.title,this.description,this.selectionDate,this.createdAt});

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    selectionDate: json["selectionDate"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "selectionDate": selectionDate,
    "createdAt": createdAt,
  };
}