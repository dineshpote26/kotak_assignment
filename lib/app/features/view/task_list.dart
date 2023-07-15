import 'package:flutter/material.dart';
import 'package:kotak_assignment/app/common/utils/get_initials.dart';
import 'package:kotak_assignment/app/common/widgets/circle_avatar_text.dart';
import 'package:kotak_assignment/app/common/widgets/custom_text.dart';
import 'package:kotak_assignment/app/features/view/add_task.dart';
import 'package:kotak_assignment/app/models/task.dart';
import 'package:kotak_assignment/app/models/task_response.dart';

class TaskListScreen extends StatelessWidget {
  TaskListScreen({Key? key}) : super(key: key);

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
      body: Padding(
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
                itemCount: taskResponse.today!.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        CircleAvatarText(
                          text: GetInitials.getInitials(
                              taskResponse.today![index].title ?? ""),
                          radius: 20,
                        ),
                        const SizedBox(width: 5),
                        CustomText(
                            text: taskResponse.today![index].title ?? ""),
                      ],
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
                itemCount: taskResponse.tomorrow!.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        CircleAvatarText(
                          text: GetInitials.getInitials(
                              taskResponse.tomorrow![index].title ?? ""),
                          radius: 20,
                        ),
                        const SizedBox(width: 5),
                        CustomText(
                            text: taskResponse.tomorrow![index].title ?? ""),
                      ],
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
                itemCount: taskResponse.upcoming!.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        CircleAvatarText(
                          text: GetInitials.getInitials(
                              taskResponse.upcoming![index].title ?? ""),
                          radius: 20,
                        ),
                        const SizedBox(width: 5),
                        CustomText(
                            text: taskResponse.upcoming![index].title ?? ""),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
