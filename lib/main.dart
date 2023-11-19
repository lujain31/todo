import 'package:flutter/material.dart';
import 'package:to_do/screen/todo_list.dart';
import 'package:to_do/service/supabase_config.dart';

void main() {
  supabaseConfig();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoList(),
    );
  }
}
