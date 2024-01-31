import 'package:crud_firebasee/pages/create/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePage extends GetView<CreateController> {
  const CreatePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller.titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: InputBorder
                        .none, // Remove the border as it's handled by Card
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller.contentController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: 'Content',
                    border: InputBorder
                        .none, // Remove the border as it's handled by Card
                  ),
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: controller.onSubmit,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
