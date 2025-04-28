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
            controller: controller.scrollController,
            itemCount: controller.employeeList.length,
            itemBuilder: (context, index) {
              final employee = controller.employeeList[index];
              return ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(employee.avatar ?? ''),
                  backgroundColor: Colors.grey[200],
                ),
                title: Text(employee.name ?? "No name"),
                subtitle: Text(employee.email ?? "No email"),
              );
            })));
  }
}
