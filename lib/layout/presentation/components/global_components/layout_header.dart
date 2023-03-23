import 'package:elwarsha/core/constant/app_color_constant.dart';
import 'package:elwarsha/core/global/widgets/navigate_to.dart';
import 'package:elwarsha/layout/presentation/screens/notification_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/search_screen.dart';

class LayoutHeader extends StatelessWidget {
  const LayoutHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 80,
          decoration: const BoxDecoration(
            gradient: AppColorConstant.primaryGradientColor,
          ),
        ),
        Positioned(
          top: 50,
          left: 10,
          child: Card(
            child: SizedBox(
              width: 200,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Hi",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "User",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                        Text(
                          "01061748098",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: AppColorConstant.titleMedColor,
                                  fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 220,
          top: 50,
          child: Card(
            child: SizedBox(
              width: 55,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Badge.count(count: 9),
                    IconButton(
                        onPressed: () {
                          navigateTo(context: context, destination: const NotificationScreen());
                        },
                        icon: const Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 290,
          top: 50,
          child: Card(
            child: SizedBox(
              width: 55,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) => SearchScreen());
                    },
                    icon: const Icon(
                      Icons.search_outlined,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
