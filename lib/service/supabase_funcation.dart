import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do/model/todo.dart';

Future<List<ToDo>?> getToDo() async {
  final List data = await Supabase.instance.client.from('Todo').select('*');
  //log(data.length.toString());
  List<ToDo> toDoList = [];
  for (var element in data) {
    toDoList.add(ToDo.fromJson(element));
  }
  return toDoList;
}

addNewToDo(Map body) async {
  final supabase = Supabase.instance.client;
  await supabase.from('Todo').insert(body);
}

updateToDo(int id, bool isComplete) async {
  final supabase = Supabase.instance.client;
  await supabase.from('Todo').update({'isComplete': isComplete}).eq('id', id);
}

deleteToDo(int id) async {
  final supabase = await Supabase.instance.client;
  await supabase.from('Todo').delete().eq('id', id);
}
