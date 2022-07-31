import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeController extends GetxController {
  late StreamSubscription subscription;
  var isDeviceConnected = false.obs;
  bool isAlertSet = false;

  var connectionStatus = 0.obs;

  // bool isConnected = await InternetConnectionChecker().hasConnection;
  late StreamSubscription<InternetConnectionStatus> _listener;

  void getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected.value =
              await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected.value && isAlertSet == false) {
            showDialog();
          }
          update(
            ["homeC"],
          );
        },
      );

  // void connectSnackBar() => Get.snackbar(
  //       "Connection",
  //       "You're back!",
  //       backgroundColor: Colors.green,
  //       colorText: Colors.white,
  //     );

  // void showSnackbar() => Get.snackbar(
  //       "Connection",
  //       "Lost connection, please check your connectivity",
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );

  void showDialog() => Get.defaultDialog(
        barrierDismissible: false,
        title: 'No Connection',
        middleText: "Please check your internet connectivity",
        textConfirm: "Oke",
        onConfirm: () async {
          Get.back();
          isAlertSet = false;
          isDeviceConnected.value =
              await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected.value) {
            showDialog();
            isAlertSet = true;
          }
        },
      );

  @override
  void onInit() {
    getConnectivity();
    _listener = InternetConnectionChecker()
        .onStatusChange
        .listen((InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          connectionStatus.value = 1;
          Get.snackbar('Connected', 'You\'re conneccted');

          break;
        case InternetConnectionStatus.disconnected:
          connectionStatus.value = 0;
          Get.snackbar(
            'Lost',
            'You\'re conneccted has been lost',
            colorText: Colors.white,
            backgroundColor: Colors.red,
          );

          break;
        default:
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _listener.cancel();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
