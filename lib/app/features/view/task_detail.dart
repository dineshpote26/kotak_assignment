import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotak_assignment/app/common/widgets/custom_button.dart';
import 'package:kotak_assignment/app/common/widgets/custom_text.dart';
import 'package:kotak_assignment/app/features/bloc/tasks_bloc.dart';
import 'package:kotak_assignment/app/features/bloc/tasks_event.dart';
import 'package:kotak_assignment/app/models/task.dart';

class TaskDetail extends StatelessWidget {

  final Task task;

  const TaskDetail({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "Task Details"),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const CustomText(text: "Title",fontWeight: FontWeight.bold,size: 16,),
            const SizedBox(height: 8),
            CustomText(text: "${task.title}",size: 14,),
            const SizedBox(height: 16),

            const CustomText(text: "Description",fontWeight: FontWeight.bold,size: 16,),
            const SizedBox(height: 8),
            CustomText(text: "${task.description}",size: 14,),
            const SizedBox(height: 16),

            const CustomText(text: "Date",fontWeight: FontWeight.bold,size: 16,),
            const SizedBox(height: 8),
            CustomText(text: "${task.selectionDate}",size: 14,),
            const SizedBox(height: 20),
            Row(
              children: [
                 Expanded(
                   child: CustomButton(
                     buttonWidth: 200,
                      borderRadius: 2,
                      text: "Edit Task",
                      color: Colors.blue,
                      onTap: () {
                      }),
                 ),
                  const SizedBox(width: 40),
                  Expanded(
                    child: CustomButton(
                        buttonWidth: 200,
                        borderRadius: 2,
                      text: "Delete Task",
                      color: Colors.red,
                      onTap: () {
                        BlocProvider.of<TaskBloc>(context).add(DeleteTask(task: task));
                        Navigator.of(context).pop();
                      }),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
