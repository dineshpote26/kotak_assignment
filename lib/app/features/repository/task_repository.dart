import 'package:kotak_assignment/app/models/task.dart';
import 'package:kotak_assignment/app/models/task_response.dart';

class TaskRepository {
  Future<List<Task>> getTask({required int type}) async {
    TaskResponse taskResponse = TaskResponse(today: [
      const Task(
          title: 'Task1',
          description: 'Task1 Description',
          createDate: "15-07-2023"),
      const Task(
          title: 'Task2',
          description: 'Task2 Description',
          createDate: "15-07-2023")
    ], tomorrow: [
      const Task(
          title: 'Task2',
          description: 'Task1 Description',
          createDate: "16-07-2023")
    ], upcoming: [
      const Task(
          title: 'Task3',
          description: 'Task1 Description',
          createDate: "17-07-2023")
    ]);

    if(type ==1){
      return taskResponse.today ?? [];
    }else if(type == 2){
      return taskResponse.tomorrow ?? [];
    }else if(type == 3){
      return taskResponse.upcoming ?? [];
    }
    return taskResponse.today ?? [];
  }
}