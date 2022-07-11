import 'package:get/get.dart';
import 'package:my_first_flutter_app/app/data/providers/task/provider.dart';
import 'package:my_first_flutter_app/app/data/services/storage/repository.dart';
import 'package:my_first_flutter_app/app/modules/home/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        taskRepository: TaskRepositoty(
          taskProvider: TaskProvider(),
        ),
      ),
    );
  }
}
