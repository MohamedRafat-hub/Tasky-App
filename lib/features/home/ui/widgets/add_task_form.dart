import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tasky/features/auth/ui/widgets/custom_text_field.dart';

import '../../../auth/ui/widgets/custom_button.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({
    super.key,
  });

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
    return Form(
      key: formKey,
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            'AddTask',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          CustomTextField(hint: 'Title', controller: title),
          CustomTextField(hint: 'Description', controller: description),
          Row(
            children: [
              Image.asset(
                'assets/icons/date.png',
                // width: 50,
                // height: 50,
                fit: BoxFit.fill,
              ),
              Spacer(),
              Image.asset(
                'assets/icons/flag.png',
                // width: 50,
                // height: 50,
                fit: BoxFit.fill,
              ),
            ],
          ),
          CustomButton(
            buttonName: 'AddTask',
            onTap: () async {

              if (formKey.currentState!.validate()) {
                await addTask(tasks , context);
              }
            },
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

   addTask(CollectionReference<Object?> tasks , BuildContext context) async {
    try {
      await tasks
          .add({
            'title': title.text,
            'description': description.text, // 42
          });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
                'Task added successfully' , style: TextStyle(fontSize: 16),),
          ),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
                '"Failed to add user: $e"' , style: TextStyle(fontSize: 16 ,color: Colors.white),),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
