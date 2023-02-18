import 'package:elwarsha/authentication/presentation/controller/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constant/app_color_constant.dart';
import '../../../core/constant/app_string_constants.dart';
import '../../../core/global/widgets/show_flutter_toast.dart';
import '../../../core/services/cache_helper.dart';
import '../../../core/services/service_locator.dart';
import '../controller/login_cubit/login_states.dart';
import 'otp_code_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          // TODO: implement listener
          if (state is SendVerifyCodeLoadingState) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          } else if (state is SendVerifyCodeErrorState) {
            showFlutterToast(
                message: state.errorMessage, state: ToastState.error);
            Navigator.of(context).pop();
          } else if (state is SendVerifyCodeSuccessState) {
            showFlutterToast(
                message: 'Code was Send as SMS', state: ToastState.success);
            //Navigator.of(context).pop();
            //print("KErollososoosososoososo ${state.verificationId}");
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OtpScreen(
                  cubit: cubit,

                ),
              ),
            );
          }

          if (state is ConfirmVerifyCodeLoadingState) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          }
          else if (state is ConfirmVerifyCodeErrorState) {
            showFlutterToast(
                message: state.errorMessage, state: ToastState.error);
            Navigator.of(context).pop();
          }
          else if (state is ConfirmVerifyCodeSuccessState) {
            ///Todo:  Login to database using phone number

            // the credential user data
            print(state.credential);
            showFlutterToast(
                message: 'Login Successfully', state: ToastState.success);
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            body: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    cursorColor: AppColorConstant.loginCursorColor,
                    decoration: InputDecoration(
                      hintText: AppStringConstant.loginHintText,
                      hintStyle: const TextStyle(
                          color: AppColorConstant.loginHintTextColor),
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '+20',
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColorConstant.loginHintTextColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColorConstant.loginBorderColor)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColorConstant.loginBorderColor)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColorConstant.loginBorderColor)),
                    ),
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (String? value) {
                      if (value!.length < 11) {
                        return 'Invalid phone number';
                      }
                      return null;
                    },
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
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            String num = '+20${phoneController.text}';
                            CacheHelper.saveData(
                                key:
                                    AppStringConstant.cacheHelperSaveUserNumber,
                                value: num);
                            //print(num);
                            ///ToDo : Verify Phone number
                            cubit.sendVerificationCode(phoneNumber: num);
                            /* await AppVariableConstants.auth.verifyPhoneNumber(
                        phoneNumber: num,
                        verificationCompleted:
                            (PhoneAuthCredential credential) async {
                          await AppVariableConstants.auth
                              .signInWithCredential(credential);
                        },
                        verificationFailed: (FirebaseAuthException e) {
                          if (e.code == 'invalid-phone-number') {
                            showFlutterToast(
                                message: 'Invalid phone number',
                                state: ToastState.error);
                          } else {
                            showFlutterToast(
                                message: 'There is no signal try again later',
                                state: ToastState.error);
                          }
                          showFlutterToast(
                              message: 'Try again later',
                              state: ToastState.error);
                        },
                        codeSent: (String verificationId, int? resendToken) {
                          navigateTo(context, OtpScreen());
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {
                          AppVariableConstants.saveVerificationId =
                              verificationId;
                        },
                      );*/
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
        },
      ),
    );
  }
}
