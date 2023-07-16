import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kotak_assignment/app/models/task.dart';

abstract class ITaskRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<List<Task>> getAllTask();
  Future<void> addTask(Task task);
  Future<void> removeTask(Task task);
  Future<void> updateTask(Task task);
}