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

class AddTaskScreen extends StatefulWidget {

  final Task? task;

  AddTaskScreen({Key? key, this.task}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();

  TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();

    if(widget.task!=null){
      titleController.text = widget.task?.title ?? "";
      descController.text = widget.task?.description ?? "";
      dateController.text = widget.task?.selectionDate ?? "";
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(title:  CustomText(text: (widget.task!=null) ? "Edit Task" : "Add Task"),centerTitle: false,),
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
                autoFocus: false,
                isDense: false,
                key: const ValueKey("date"),
                controller: dateController,
                labelText: "Date",
                fillColor: AppColors.white,
                enabled: true,
                onTap: (){
                  _selectDate(context);
                },
                validator: Validators.validateEmpty,
                contentPadding:
                const EdgeInsets.only(bottom: 10.0, top: 0.0),
              ),
              const SizedBox(height: 40),
              CustomButton(
                  text: (widget.task!=null) ? "Edit Task" : "Add Task",
                  color: Colors.blue,
                  borderRadius: 2,
                  buttonWidth: 200,
                  onTap: () {
                    if(widget.task!=null){
                      BlocProvider.of<TaskBloc>(context).add(UpdateTask(task: Task(id : widget.task?.id,title: titleController.text,description: descController.text,selectionDate: dateController.text)));
                    }else{
                      BlocProvider.of<TaskBloc>(context).add(AddTask(task: Task(id: DateTime.now().microsecondsSinceEpoch.toString(), title: titleController.text,description: descController.text,selectionDate: dateController.text)));
                    }
                    Navigator.of(context).pop();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
