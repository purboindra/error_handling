import 'package:error_handling/app/data/models/user_model.dart';
import 'package:error_handling/app/widgets/custom_form_fiel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<UserModel>(
              future: controller.fetchData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  return ListTile(
                    title: Text(data!.data!.email!),
                  );
                }
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Text("Loading");
              },
            ),
            CustomFormField(
              controller: controller.emailController,
              hintText: "Email",
            ),
            SizedBox(
              height: 30,
            ),
            Obx(() => CustomFormField(
                  controller: controller.passwordController,
                  isObsecure: controller.isObsecure.value,
                  hintText: "Password",
                )),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
              onPressed: () {
                controller.post(controller.emailController.text,
                    controller.passwordController.text);
              },
              child: Center(
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
