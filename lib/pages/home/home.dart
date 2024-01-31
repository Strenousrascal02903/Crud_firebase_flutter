import 'package:crud_firebasee/models/todo_model.dart';
import 'package:crud_firebasee/pages/detail/detail.dart';
import 'package:crud_firebasee/pages/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightBlueAccent,
        onPressed: controller.addTodo,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          "To Do List",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: controller.todoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    TodoModel todo = controller.todoList[index];
                    return Card(
                      margin: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              todo.title!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8),
                            Expanded(
                              child: Text(
                                todo.content!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () =>
                                      Get.to(() => DetailPage(todo: todo)),
                                  child: Icon(Icons.info),
                                ),
                                SizedBox(width: 8),
                                InkWell(
                                  onTap: () => controller.updateTodo(todo),
                                  child: Icon(Icons.edit),
                                ),
                                SizedBox(width: 8),
                                InkWell(
                                  onTap: () => controller.deleteTodo(todo.id!),
                                  child: Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
