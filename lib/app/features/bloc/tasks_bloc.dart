import 'package:kotak_assignment/app/features/bloc/tasks_event.dart';
import 'package:kotak_assignment/app/features/bloc/tasks_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotak_assignment/app/features/repository/task_repository.dart';
import 'package:kotak_assignment/app/models/task.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {

  final TaskRepository _taskRepository;
  List<Task> todayList = [];
  List<Task> tomorrowList = [];
  List<Task> upcomingList = [];

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
      filterData(tasks);
      emit(TaskLoaded(tasks: tasks,todayTask: todayList,tomorrowTask: tomorrowList,upcomingTask: upcomingList));
    } catch (e) {
      emit(TasksError(e.toString()));
    }
  }

  filterData(var tasks){
    todayList.clear();
    tomorrowList.clear();
    upcomingList.clear();
    for(Task task in tasks){
      try{
        DateTime now = DateTime.now();
        final today = DateTime(now.year, now.month, now.day);
        final tomorrow = DateTime(now.year, now.month, now.day + 1);
        DateTime dbDate = DateTime.parse(task.selectionDate ?? "");
        if(dbDate == today ){
          todayList.add(task);
        }else if(dbDate.isAtSameMomentAs(tomorrow)){
          tomorrowList.add(task);
        }else{
          upcomingList.add(task);
        }
      }catch(e){
        print(e.toString());
      }
    }
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) async{
    if (event.task.title!.isEmpty) return;
    emit(TaskLoading());
    try {
       await _taskRepository.addTask(event.task);
       final tasks = await _taskRepository.getAllTask();
       filterData(tasks);
      emit(TaskLoaded(tasks: tasks,todayTask: todayList,tomorrowTask: tomorrowList,upcomingTask: upcomingList));
    } catch (e) {
      emit(TasksError(e.toString()));
    }
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) async{
    emit(TaskLoading());
    await _taskRepository.removeTask(event.task);
    final tasks = await _taskRepository.getAllTask();
    filterData(tasks);
    emit(TaskLoaded(tasks: tasks,todayTask: todayList,tomorrowTask: tomorrowList,upcomingTask: upcomingList));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) async{
    emit(TaskLoading());
    await _taskRepository.updateTask(event.task);
    final tasks = await _taskRepository.getAllTask();
    filterData(tasks);
    emit(TaskLoaded(tasks: tasks,todayTask: todayList,tomorrowTask: tomorrowList,upcomingTask: upcomingList));
  }
}