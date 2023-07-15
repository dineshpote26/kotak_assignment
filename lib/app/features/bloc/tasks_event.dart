import 'package:equatable/equatable.dart';
import 'package:kotak_assignment/app/models/task.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

/// Load add Task
class LoadTasks extends TaskEvent {
  final List<Task> tasks;

  const LoadTasks({this.tasks = const <Task>[]});

  @override
  List<Object> get props => [tasks];
}

/// Add Task
class AddTask extends TaskEvent {
  final Task task;

  const AddTask({required this.task});

  @override
  List<Object> get props => [task];
}

/// Delete Task
class DeleteTask extends TaskEvent {
  final Task task;

  const DeleteTask({required this.task});

  @override
  List<Object> get props => [task];
}

/// Update Task
class UpdateTask extends TaskEvent {
  final Task task;

  const UpdateTask({required this.task});

  @override
  List<Object> get props => [task];
}