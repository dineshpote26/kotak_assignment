import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotak_assignment/app/features/bloc/tasks_bloc.dart';
import 'package:kotak_assignment/app/features/bloc/tasks_event.dart';
import 'package:kotak_assignment/app/features/view/task_list.dart';

import 'app/features/repository/task_repository.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => TaskRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => TaskBloc(
                    RepositoryProvider.of<TaskRepository>(context),
                  )..add(const LoadTasks()))
        ],
        child: MaterialApp(
          title: "",
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const TaskListScreen(),
        ),
      ),
    );
  }
}
