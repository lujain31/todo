import 'package:flutter/material.dart';
import 'package:to_do/constants/colors.dart';
import 'package:to_do/constants/sizes.dart';
import 'package:to_do/screen/todo_list.dart';
import 'package:to_do/service/supabase_funcation.dart';
import 'package:to_do/widget/app_text_filed.dart';

showAddToDoDialog({
  required BuildContext context,
}) {
  final _formKey = GlobalKey<FormState>();
  TextEditingController taskController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    Text(
                      "Add task",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ),
                    height32,
                    Form(
                      key: _formKey,
                      child: Column(children: [
                        AppTextFormFiled(
                          controller: taskController,
                          label: 'Task',
                          hint: 'go to mall',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Name is required';
                            }
                            return null;
                          },
                        ),
                        height8,
                        AppTextFormFiled(
                          controller: detailController,
                          label: 'Detail',
                          hint: 'buy travel bag',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Details is required';
                            }
                            return null;
                          },
                        ),
                      ]),
                    ),
                    height32,
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 32,
                      height: 54,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            addNewToDo({
                              "name": taskController.text,
                              "detail": detailController.text,
                            });

                            //Navigator.pop(context);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ToDoList()),
                            );
                          }
                        },
                        icon: const Icon(Icons.add),
                        label: const Text("Add New Task"),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 0,
                            backgroundColor: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      });
}
