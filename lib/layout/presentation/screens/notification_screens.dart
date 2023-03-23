import 'package:elwarsha/core/constant/app_color_constant.dart';
import 'package:elwarsha/layout/presentation/components/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../components/notifications_conponents/accepted_notify.dart';
import '../components/notifications_conponents/denied_notify.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorConstant.backgroundColor,
        elevation: 0,
        /*leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_outlined)),*/
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 30, left: 10, bottom: 20),
            child: Text(
              'Notifications',
              style: TextStyles.largeTitlesStyle,
            ),
          ),
          AcceptedNotify(),
          SizedBox(
            height: 10,
          ),
          DeniedNotify(),
        ],
      ),
    );
  }
}
