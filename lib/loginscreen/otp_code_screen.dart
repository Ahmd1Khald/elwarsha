import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/constant/app_color_constant.dart';
import '../core/constant/app_variable_constants.dart';
import '../core/global/widgets/show_flutter_toast.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key}) : super(key: key);
  var codeController1 = TextEditingController();
  var codeController2 = TextEditingController();
  var codeController3 = TextEditingController();
  var codeController4 = TextEditingController();
  var codeController5 = TextEditingController();
  var codeController6 = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: codeController1,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColorConstant.otpCodeBorderColor)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColorConstant.otpCodeBorderColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColorConstant.otpCodeBorderColor)),
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: codeController2,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColorConstant.otpCodeBorderColor)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColorConstant.otpCodeBorderColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColorConstant.otpCodeBorderColor)),
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: codeController3,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColorConstant.otpCodeBorderColor)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColorConstant.otpCodeBorderColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColorConstant.otpCodeBorderColor)),
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: codeController4,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColorConstant.otpCodeBorderColor)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColorConstant.otpCodeBorderColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColorConstant.otpCodeBorderColor)),
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: codeController5,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColorConstant.otpCodeBorderColor)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColorConstant.otpCodeBorderColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColorConstant.otpCodeBorderColor)),
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: codeController6,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColorConstant.otpCodeBorderColor)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColorConstant.otpCodeBorderColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColorConstant.otpCodeBorderColor)),
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(0),
                  border: Border.all(color: Colors.black)),
              child: MaterialButton(
                  onPressed: () {
                    String allControllers =
                        "${codeController1.text}${codeController2.text}${codeController3.text}${codeController4.text}${codeController5.text}${codeController6.text}";
                    if (formKey.currentState!.validate()) {
                      print(AppVariableConstants.saveVerificationId);
                      print("------------------------------------------------");
                      if (allControllers ==
                          AppVariableConstants.saveVerificationId) {
                        showFlutterToast(
                            message: 'Success', state: ToastState.success);
                      } else {
                        showFlutterToast(
                            message: 'Invalid phone number',
                            state: ToastState.error);
                      }
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: AppColorConstant.loginCursorColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
