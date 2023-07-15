import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final String? createDate;

  const Task({this.id,this.title, this.description, this.createDate});

  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(
        id: map["id"],
        title: map["title"],
        description: map["description"],
        createDate: map["createDate"]);
  }

  factory Task.fromSnapshot(DocumentSnapshot snap) {
    return Task(
        id: snap["id"],
        title: snap["title"],
        description: snap["description"],
        createDate: snap["createDate"]);
  }

  Map<String, dynamic> toDocument() {
    return {
      "id":id,
      "title": title,
      "description": description,
      "createDate": createDate,
    };
  }

  @override
  List<Object?> get props => [id,title,description,createDate];
}
