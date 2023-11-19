import 'package:flutter/material.dart';
import 'package:to_do/constants/colors.dart';
import 'package:to_do/constants/sizes.dart';
import 'package:to_do/model/todo.dart';
import 'package:to_do/service/supabase_funcation.dart';
import 'package:to_do/widget/show_add_todo_dialog.dart';
import 'package:to_do/widget/todo_item.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

bool isComplete = false;

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.grey,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(fontSize: 16),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height48,
                      Text(
                        "Hello, Lujain",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                      ),
                      height4,
                      const Text(
                        "Good Morning",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Image.asset(
                      "assets/avatar.png",
                      width: 64,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 64),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "My Task",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.secondaryColor.withOpacity(0.1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.date_range_outlined,
                                  color: AppColors.secondaryColor,
                                  size: 20,
                                ),
                                Text(
                                  " 17 November",
                                  style: TextStyle(
                                      color: AppColors.secondaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    height18,
                  ],
                ),
              ),
              FutureBuilder(
                future: getToDo(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<ToDo> toDo = snapshot.data!;
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: toDo.length,
                        itemBuilder: (context, index) {
                          return ToDoItem(
                            name: toDo[index].name!,
                            detail: toDo[index].detail!,
                            isComplete: toDo[index].isComplete,
                            onPressed: () {
                              setState(
                                () {
                                  deleteToDo(toDo[index].id!);
                                },
                              );
                            },
                            onChanged: (value) {
                              setState(() {
                                isComplete = value!;
                              });
                              updateToDo(snapshot.data![index].id!, value!);
                            },
                          );
                        },
                      ),
                    );
                  } else if (snapshot.data?.length == 0) {
                    const Text("no data");
                  } else if (snapshot.hasError) {
                    const Text("error");
                  }
                  return Center(
                      child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.primaryColor,
                  ));
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () async {
          showAddToDoDialog(context: context);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
