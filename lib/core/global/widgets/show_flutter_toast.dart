import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../constant/app_color_constant.dart';

enum ToastState {error,success}
Future<bool?> showFlutterToast({required String message,required ToastState state}){
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: state == ToastState.error? Colors.red:Colors.green,
    textColor: AppColorConstant.titleMedLightColor,
    fontSize: 16.0,
  );
}
