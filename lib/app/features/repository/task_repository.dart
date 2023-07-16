import 'package:kotak_assignment/app/features/repository/iTask_repository.dart';
import 'package:kotak_assignment/app/models/task.dart';

class TaskRepository extends ITaskRepository {

  final String _collectionPath = 'tasks';
  final String _orderField = 'createdAt';

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

  @override
  Future<void> updateTask(Task task) async{
    await firestore.collection(_collectionPath).doc(task.id).update(task.toJson());
  }
}