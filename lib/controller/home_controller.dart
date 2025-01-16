import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_obj;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HomeController extends GetxController {
  Dio dio = Dio();

  getEmployeeList() async {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true));
    try {
      dio_obj.Response response =
          await dio.get("https://dummyapi.online/api/users");

      if (response.statusCode == 200) {}
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getEmployeeList();
  }

}
