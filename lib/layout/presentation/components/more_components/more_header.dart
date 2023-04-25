import 'dart:io';

import 'package:elwarsha/layout/presentation/controller/layout_cubit/layout_cubit.dart';
import 'package:elwarsha/layout/presentation/controller/layout_cubit/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreHeader extends StatelessWidget {
  final String accountName;
  final String accountPhoneNumber;

  //final String accountProfileImage;
  MoreHeader({
    super.key,
    required this.accountName,
    required this.accountPhoneNumber, //required this.accountProfileImage,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        LayoutCubit cubit = LayoutCubit.get(context);
        return SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Text(
                        "My Account",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 20,
                                  decoration: TextDecoration.underline,
                                ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      accountName,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                    Text(
                      accountPhoneNumber,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.green,
                          fontSize: 20,
                          //color: AppColorConstant.titleMedColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.37,
                top: MediaQuery.of(context).size.height * 0.17,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    state is SuccessUploadUserPhotoState
                        ? CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.grey,
                            // backgroundImage: FileImage(
                            //   cubit.image!,
                            // ),
                            backgroundImage: NetworkImage(state.image!),
                          )
                        : const CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.grey,
                            backgroundImage:
                                AssetImage('assets/images/banner photo.jpeg'),
                          ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
