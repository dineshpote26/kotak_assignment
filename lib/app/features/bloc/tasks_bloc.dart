import 'package:kotak_assignment/app/features/bloc/tasks_event.dart';
import 'package:kotak_assignment/app/features/bloc/tasks_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotak_assignment/app/models/task.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskLoading()) {
    on<LoadTasks>(_onLoadTodos);
    on<AddTask>(_onAddTodo);
    on<DeleteTask>(_onDeleteTodo);
    on<UpdateTask>(_onUpdateTodo);
  }

  void _onLoadTodos(LoadTasks event, Emitter<TaskState> emit) {
    emit(TodosLoaded(tasks: event.tasks));
  }

  void _onAddTodo(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    if (state is TodosLoaded) {
      emit(TodosLoaded(tasks: List.from(state.tasks)..add(event.task)));
    }
  }

  void _onDeleteTodo(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    if (state is TodosLoaded) {
      List<Task> taskList = state.tasks.where((data) {
        return data.id != event.task.id;
      }).toList();
      emit(TodosLoaded(tasks: taskList));
    }
  }

  void _onUpdateTodo(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    if (state is TodosLoaded) {
      List<Task> taskList = (state.tasks.map((data) {
        return data.id == event.task.id ? event.task : data;
      })).toList();
      emit(TodosLoaded(tasks: taskList));
    }
  }
}