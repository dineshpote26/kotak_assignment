import 'package:kotak_assignment/app/features/repository/iTask_repository.dart';
import 'package:kotak_assignment/app/models/task.dart';

class TaskRepository extends ITodoRepository {

  final String _collectionPath = 'tasks';
  final String _orderField = 'createdAt';

  /*Future<List<Task>> getTask({required int type}) async {
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
  }*/

  @override
  Future<void> addTask(Task task) async{
    await firestore.collection(_collectionPath).add(task.toJson());
  }

  @override
  Future<List<Task>> getAllTask() async{
    List<Task> todos = [];
    final results = await firestore.collection(_collectionPath).orderBy(_orderField).get();
    for (var snapshot in results.docs) {
      Task newTodo = Task.fromJson(snapshot.data());
      newTodo.id = snapshot.id;
      todos.add(newTodo);
    }
    return todos;
  }

  @override
  Future<void> removeTask(Task task) async{
    await firestore.collection(_collectionPath).doc(task.id).delete();
  }
}