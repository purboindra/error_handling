import 'dart:convert';

import 'package:error_handling/app/data/api/base_clients.dart';
import 'package:error_handling/app/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late Future<UserModel> getUser;

  final isObsecure = RxBool(true);

  var user = UserModel().obs;

  void changeObsecure() {
    isObsecure.value = !isObsecure.value;
  }

  Future<UserModel> fetchData() async {
    final response = await BaseClients().get('https://reqres.in/api/users/5');
    var jsonResponse = jsonDecode(response);
    return UserModel.fromJson(jsonResponse);
  }

  Future<dynamic> post(String email, password) async {
    final response = await BaseClients().post(
      'https://reqres.in/api/login',
      {
        "email": email,
        'password': password,
      },
    );
    var jsonResponse = jsonDecode(response);
    print(jsonResponse);
    return jsonResponse;
  }

  Future postData(String email, password) async {
    final url = Uri.parse('https://reqres.in/api/login');
    try {
      http.Response response = await http.post(
        url,
        body: {
          "email": email,
          'password': password,
        },
      );
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        Get.snackbar("erROR", jsonResponse["error"],
            backgroundColor: Colors.red, colorText: Colors.white);
      } else {
        Get.snackbar("SUCCESS", 'Success login');
      }
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void onInit() {
    // getUser = BaseClients().get("");
    super.onInit();
  }
}
