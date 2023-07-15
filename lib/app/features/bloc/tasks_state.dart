import 'package:equatable/equatable.dart';
import 'package:kotak_assignment/app/models/task.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskLoading extends TaskState {}

class TodosLoaded extends TaskState {
  final List<Task> tasks;

  const TodosLoaded({this.tasks = const <Task>[]});

  @override
  List<Object> get props => [tasks];
}