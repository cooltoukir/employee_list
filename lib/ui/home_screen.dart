import 'package:employee_list/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
        ),
        body: Obx(() => ListView.builder(
            itemCount: controller.employeeList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.employeeList[index].name ?? "No name"),
                subtitle:
                    Text(controller.employeeList[index].email ?? "No email"),
              );
            })));
  }
}
