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
import 'package:kotak_assignment/app/models/task_response.dart';

class TaskListScreen extends StatelessWidget {
  TaskListScreen({Key? key}) : super(key: key);

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
            return const CircularProgressIndicator();
          }
          if (state is TaskLoaded) {
            return Padding(
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
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const TaskDetail();
                              }),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                CircleAvatarText(
                                  text: GetInitials.getInitials(
                                      state.tasks[index].title ?? ""),
                                  radius: 20,
                                ),
                                const SizedBox(width: 5),
                                CustomText(
                                    text: state.tasks[index].title ?? ""),
                              ],
                            ),
                          ),
                        );
                      }),
                  const SizedBox(height: 12),
                  const CustomText(
                    text: "Tomorrow",
                    size: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.tasks.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const TaskDetail();
                              }),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                CircleAvatarText(
                                  text: GetInitials.getInitials(
                                      state.tasks[index].title ?? ""),
                                  radius: 20,
                                ),
                                const SizedBox(width: 5),
                                CustomText(
                                    text: state.tasks[index].title ?? ""),
                              ],
                            ),
                          ),
                        );
                      }),
                  const SizedBox(height: 12),
                  const CustomText(
                    text: "Upcoming",
                    size: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.tasks.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const TaskDetail();
                              }),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                CircleAvatarText(
                                  text: GetInitials.getInitials(
                                      state.tasks[index].title ?? ""),
                                  radius: 20,
                                ),
                                const SizedBox(width: 5),
                                CustomText(
                                    text: state.tasks[index].title ?? ""),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
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
