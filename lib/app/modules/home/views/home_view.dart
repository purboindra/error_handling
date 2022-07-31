import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: "homeC",
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Connection Check'),
              centerTitle: true,
            ),
            body: Center(
              child: Obx(() => Text(
                    controller.connectionStatus.value == 1
                        ? 'HomeView is working'
                        : 'COnnection error',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          );
        });
  }
}
