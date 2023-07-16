import 'package:kotak_assignment/app/features/bloc/tasks_event.dart';
import 'package:kotak_assignment/app/features/bloc/tasks_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotak_assignment/app/features/repository/task_repository.dart';
import 'package:kotak_assignment/app/models/task.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {

  final TaskRepository _taskRepository;

  TaskBloc(this._taskRepository) : super(TaskLoading()) {
    on<LoadTasks>(_onLoadTask);
    on<AddTask>(_onAddTask);
    on<DeleteTask>(_onDeleteTask);
    on<UpdateTask>(_onUpdateTask);
  }


  Future<void> _onLoadTask(LoadTasks event, Emitter<TaskState> emit) async {
    emit(TaskLoading());
    try {
      final tasks = await _taskRepository.getAllTask();
      emit(TaskLoaded(tasks: tasks));
    } catch (e) {
      emit(TasksError(e.toString()));
    }
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) async{
    /*final state = this.state;
    if (state is TaskLoaded) {
      emit(TaskLoaded(tasks: List.from(state.tasks)..add(event.task)));
    }*/
    if (event.task.title!.isEmpty) return;
    emit(TaskLoading());
    try {
       await _taskRepository.addTask(event.task);
       final tasks = await _taskRepository.getAllTask();
      emit(TaskLoaded(tasks: tasks));
    } catch (e) {
      emit(TasksError(e.toString()));
    }
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) async{
    emit(TaskLoading());
    await _taskRepository.removeTask(event.task);
    final tasks = await _taskRepository.getAllTask();
    emit(TaskLoaded(tasks: tasks));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) async{
    emit(TaskLoading());
    await _taskRepository.updateTask(event.task);
    final tasks = await _taskRepository.getAllTask();
    emit(TaskLoaded(tasks: tasks));
  }
}