import 'package:elwarsha/core/global/widgets/navigate_to.dart';
import 'package:elwarsha/layout/presentation/controller/layout_cubit/layout_cubit.dart';
import 'package:elwarsha/layout/presentation/controller/layout_cubit/layout_state.dart';
import 'package:elwarsha/layout/presentation/screens/update_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constant/app_color_constant.dart';
import '../components/global_components/layout_header.dart';
import '../components/more_components/more_header.dart';
import '../components/more_components/more_item.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  const MoreHeader(
                      accountName: "Kerollos Sameh",
                      accountPhoneNumber: "01061748098"),
                  //
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical:.0),
                  //   child: CircleAvatar(
                  //     radius: 35,
                  //     backgroundColor: Colors.black,
                  //     child: CircleAvatar(
                  //       radius: 34,
                  //       backgroundColor: Theme.of(context).cardTheme.color,
                  //       child: Icon(
                  //         Icons.list,
                  //         color: Theme.of(context).primaryColor,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  const BuildMoreItem(title: "Manage My Card"),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  BuildMoreItem(
                    title: "Manage Account",
                    onTap: () {
                      navigateTo(context: context, destination:  UpdateProfileScreen());
                    },
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  const BuildMoreItem(title: "Entertainment Corner"),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  const BuildMoreItem(title: "E-Shop"),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  const BuildMoreItem(title: "Check My Address"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
