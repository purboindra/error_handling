import 'package:error_handling/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObsecure;
  const CustomFormField({
    Key? key,
    required this.controller,
    this.isObsecure = false,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObsecure,
      decoration: InputDecoration(
        suffixIcon: hintText == "Password"
            ? GetX<LoginController>(builder: (loginC) {
                return InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      loginC.changeObsecure();
                    },
                    child: Icon(loginC.isObsecure.isTrue
                        ? Icons.visibility
                        : Icons.visibility_off));
              })
            : SizedBox(),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
