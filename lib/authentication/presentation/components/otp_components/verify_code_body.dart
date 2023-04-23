import 'package:elwarsha/authentication/presentation/components/otp_components/verify_code_form.dart';
import 'package:elwarsha/authentication/presentation/controller/login_cubit/login_cubit.dart';
import 'package:elwarsha/authentication/presentation/controller/login_cubit/login_states.dart';
import 'package:elwarsha/core/constant/app_string_constants.dart';
import 'package:elwarsha/core/services/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/app_color_constant.dart';
import '../../../../core/constant/app_path_constant.dart';
import '../../../../core/global/widgets/custom_button.dart';

class VerifyCodeBody extends StatelessWidget {
  const VerifyCodeBody({
    super.key,
    required this.formKey,
    required this.codeController1,
    required this.codeController2,
    required this.codeController3,
    required this.codeController4,
    required this.codeController5,
    required this.codeController6,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController codeController1;
  final TextEditingController codeController2;
  final TextEditingController codeController3;
  final TextEditingController codeController4;
  final TextEditingController codeController5;
  final TextEditingController codeController6;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.70,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 380,
          image: AssetImage(AppPathConstant.splashBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.16,
          ),
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppPathConstant.lockIcon),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "Enter The code we sent",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 25),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: formKey,
              child: VerifyCodeForm(
                codeController1: codeController1,
                codeController2: codeController2,
                codeController3: codeController3,
                codeController4: codeController4,
                codeController5: codeController5,
                codeController6: codeController6,
              ),
            ),
          ),
          const Spacer(),
          Text(
            '1:59',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: MediaQuery.of(context).size.width * 0.3,
            ),
            child: CustomButton(
                onPressed: () {},
                color: AppColorConstant.backgroundColor!,
                child: TextButton(
                  onPressed: () {
                    /*cubit.sendVerificationCode(
                        phoneNumber: CacheHelper.getDate(
                            key: AppStringConstant
                                .cacheHelperSaveUserNumber));*/
                  },
                  child: Text(
                    'Resend',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
