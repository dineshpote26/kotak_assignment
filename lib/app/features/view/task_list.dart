import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotak_assignment/app/common/utils/get_initials.dart';
import 'package:kotak_assignment/app/common/widgets/circle_avatar_text.dart';
import 'package:kotak_assignment/app/common/widgets/custom_text.dart';
import 'package:kotak_assignment/app/features/bloc/tasks_bloc.dart';
import 'package:kotak_assignment/app/features/bloc/tasks_state.dart';
import 'package:kotak_assignment/app/features/view/add_task.dart';
import 'package:kotak_assignment/app/features/view/task_detail.dart';
import 'package:kotak_assignment/app/models/task.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Management"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return AddTaskScreen();
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context,state) {
          if(state is TaskLoading){
            return const Center(child:  CircularProgressIndicator());
          }
          if (state is TaskLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    const CustomText(
                      text: "Today",
                      size: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 8),
                    state.todayTask.isNotEmpty ?
                    ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.todayTask.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                              Task task = state.todayTask[index];
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return TaskDetail(task: task,);
                                }),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  CircleAvatarText(
                                    text: GetInitials.getInitials(
                                        state.todayTask[index].title ?? ""),
                                    radius: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  CustomText(
                                      text: state.todayTask[index].title ?? ""),
                                ],
                              ),
                            ),
                          );
                        }) :  const Center(child: Text('No Task Found')),
                    const SizedBox(height: 12),
                    const CustomText(
                      text: "Tomorrow",
                      size: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 8),
                    state.tomorrowTask.isNotEmpty ?
                    ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.tomorrowTask.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                              Task task = state.tomorrowTask[index];
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return TaskDetail(task: task,);
                                }),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  CircleAvatarText(
                                    text: GetInitials.getInitials(
                                        state.tomorrowTask[index].title ?? ""),
                                    radius: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  CustomText(
                                      text: state.tomorrowTask[index].title ?? ""),
                                ],
                              ),
                            ),
                          );
                        }) :  const Center(child: Text('No Task Found')),
                    const SizedBox(height: 12),
                    const CustomText(
                      text: "Upcoming",
                      size: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 8),
                    state.upcomingTask.isNotEmpty ?
                    ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.upcomingTask.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                              Task task = state.upcomingTask[index];
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return TaskDetail(task: task);
                                }),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  CircleAvatarText(
                                    text: GetInitials.getInitials(
                                        state.upcomingTask[index].title ?? ""),
                                    radius: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  CustomText(
                                      text: state.upcomingTask[index].title ?? ""),
                                ],
                              ),
                            ),
                          );
                        }) :  const Center(child: Text('No Task Found')),
                  ],
                ),
              ),
            );
          }else{
            return const Text('No Task Found');
          }
        }
      ),
    );
  }
}
