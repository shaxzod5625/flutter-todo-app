import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_first_flutter_app/app/core/untils/keys.dart';
import 'package:my_first_flutter_app/app/data/models/task.dart';
import 'package:my_first_flutter_app/app/data/services/storage/services.dart';

class TaskProvider {
  StorageService _storage = Get.find<StorageService>();

  List<Task> readTasks() {
    var tasks = <Task>[];
    jsonDecode(_storage.read(taskKey).toString())
        .forEach((task) => tasks.add(Task.fromJson(task)));
    return tasks;
  }

  void writeTasks(List<Task> tasks) {
    _storage.write(taskKey, jsonEncode(tasks));
  }
}
