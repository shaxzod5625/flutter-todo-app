import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_app/app/core/untils/extensions.dart';
import 'package:my_first_flutter_app/app/modules/home/controller.dart';

class DoingList extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  DoingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeCtrl.doingTodos.isEmpty && homeCtrl.doneTodos.isEmpty
        ? Column(
          children: [
            Image.asset(
              'assets/images/task.png',
              fit: BoxFit.cover,
              width: 65.0.wp,
            ),
            Text(
              'Add Task',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0.sp
              )
            )
          ],
        ) : ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            ...homeCtrl.doingTodos.map((todo) => 
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 3.0.wp,
                  horizontal: 9.0.wp,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Checkbox(
                        fillColor: MaterialStateProperty.resolveWith((states) => Colors.grey),
                        value: todo['done'],
                        onChanged: (value) {
                          homeCtrl.doneTodo(todo['title']);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                      child: Text(
                        todo['title'],
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ]
                ),
              )
            ).toList(),
            if (homeCtrl.doingTodos.isNotEmpty) Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
              child: const Divider(thickness: 2),
            )
          ],
        )
    );
  }
}