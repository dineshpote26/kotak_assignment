import 'dart:convert';

import 'package:kotak_assignment/app/models/task.dart';

TaskResponse taskResponseFromJson(String str) => TaskResponse.fromJson(json.decode(str));

String taskResponseToJson(TaskResponse data) => json.encode(data.toJson());

class TaskResponse {
  final List<Task>? today;
  final List<Task>? tomorrow;
  final List<Task>? upcoming;

  TaskResponse({
    this.today,
    this.tomorrow,
    this.upcoming,
  });

  factory TaskResponse.fromJson(Map<String, dynamic> json) => TaskResponse(
    today: json["Today"] == null ? [] : List<Task>.from(json["Today"]!.map((x) => Task.fromJson(x))),
    tomorrow: json["Tomorrow"] == null ? [] : List<Task>.from(json["Tomorrow"]!.map((x) => Task.fromJson(x))),
    upcoming: json["Upcoming"] == null ? [] : List<Task>.from(json["Upcoming"]!.map((x) => Task.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Today": today == null ? [] : List<Task>.from(today!.map((x) => x.toDocument())),
    "Tomorrow": tomorrow == null ? [] : List<Task>.from(tomorrow!.map((x) => x.toDocument())),
    "Upcoming": upcoming == null ? [] : List<Task>.from(upcoming!.map((x) => x.toDocument())),
  };
}