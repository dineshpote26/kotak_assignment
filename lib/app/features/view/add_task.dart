import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotak_assignment/app/common/style/app_colors.dart';
import 'package:kotak_assignment/app/common/utils/validators.dart';
import 'package:kotak_assignment/app/common/widgets/custom_button.dart';
import 'package:kotak_assignment/app/common/widgets/custom_text.dart';
import 'package:kotak_assignment/app/common/widgets/custom_text_field_widget.dart';
import 'package:kotak_assignment/app/features/bloc/tasks_bloc.dart';
import 'package:kotak_assignment/app/features/bloc/tasks_event.dart';
import 'package:kotak_assignment/app/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(title: const CustomText(text: "Add Task"),centerTitle: false,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Column(
            children: [
              CustomUnderlineTextFieldWithLabel(
                autoFocus: true,
                isDense: false,
                key: const ValueKey("title"),
                controller: titleController,
                labelText: "Title",
                fillColor: AppColors.white,
                validator: Validators.validateEmpty,
                contentPadding:
                const EdgeInsets.only(bottom: 10.0, top: 0.0),
              ),
              const SizedBox(height: 16),
              CustomUnderlineTextFieldWithLabel(
                autoFocus: true,
                isDense: false,
                key: const ValueKey("description"),
                controller: descController,
                labelText: "Description",
                fillColor: AppColors.white,
                validator: Validators.validateEmpty,
                maxLines: 4,
                contentPadding:
                const EdgeInsets.only(bottom: 10.0, top:10.0),
              ),
              const SizedBox(height: 16),
              CustomUnderlineTextFieldWithLabel(
                autoFocus: true,
                isDense: false,
                key: const ValueKey("date"),
                controller: dateController,
                labelText: "Date",
                fillColor: AppColors.white,
                validator: Validators.validateEmpty,
                contentPadding:
                const EdgeInsets.only(bottom: 10.0, top: 0.0),
              ),
              const SizedBox(height: 40),
              CustomButton(
                  text: "Add Task",
                  color: Colors.blue,
                  borderRadius: 2,
                  buttonWidth: 200,
                  onTap: () {
                    BlocProvider.of<TaskBloc>(context).add(AddTask(task: Task(title: titleController.text,description: descController.text,selectionDate: dateController.text)));
                    Navigator.of(context).pop();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
