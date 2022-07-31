import 'dart:convert';

import 'package:error_handling/app/exceptions_handlers/exceptions_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BaseClients {
  static const int timeOutDuration = 35;

  //GET FEATURES
  Future<dynamic> get(String url) async {
    var uri = Uri.parse(url);
    try {
      http.Response response =
          await http.get(uri).timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } catch (e) {
      throw ExceptionsHandler().getExceptionString(e);
    }
  }

  //POST FEATURES
  Future<dynamic> post(String url, Object payloadObj) async {
    var uri = Uri.parse(url);
    var payload = payloadObj;
    try {
      final response = await http
          .post(
            uri,
            body: payload,
          )
          .timeout(
            const Duration(seconds: timeOutDuration),
          );

      return _processResponse(response);
    } catch (e) {
      Get.snackbar(
        "ERROR",
        ExceptionsHandler().getExceptionString(e).toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      throw ExceptionsHandler().getExceptionString(e);
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200: //Success
        var responseJson = response.body;
        return responseJson;
      case 400: //Bad request
        throw BadRequestException(jsonDecode(response.body)['message']);
      case 401: //Unauthorized
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 403: //Forbidden
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 404: //Resource Not Found
        throw NotFoundException(jsonDecode(response.body)['message']);
      case 500: //Internal Server Error
      default:
        throw FetchDataException(
            'Something went wrong! ${response.statusCode}');
    }
  }
}
