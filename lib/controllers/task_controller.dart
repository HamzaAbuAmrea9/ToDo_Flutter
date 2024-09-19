import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todo_app/db/db_helper.dart';
import 'package:todo_app/models/task.dart';

class TaskController extends GetxController{

final RxList<Task> taskList = <Task>[].obs;  

Future<int> addTask({Task? task}) {  
  return DBHelper.insert(task!);  
}  



 Future <void>getTasks() async {  
  final List<Map<String, dynamic>> tasks = await DBHelper.query();  
  taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());  
} 

void deleteAllTasks() async {  
    await DBHelper.deleteAll();  
    getTasks();  
}  


void deleteTasks(Task task) async {  
  await DBHelper.delete(task);  
  getTasks();
}  
 void markTaskCompleted(int id) async {  
  await DBHelper.update(id);  
  getTasks();
}  
}
