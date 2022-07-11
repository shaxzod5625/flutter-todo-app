import 'package:my_first_flutter_app/app/data/models/task.dart';
import 'package:my_first_flutter_app/app/data/providers/task/provider.dart';

class TaskRepositoty {
  TaskProvider taskProvider;
  TaskRepositoty({required this.taskProvider});

  List<Task> readTasks() => taskProvider.readTasks();
  void writeTasks(List<Task> tasks) => taskProvider.writeTasks(tasks);
}
