import 'package:flutter/material.dart';

import '../../../core/constant/app_color_constant.dart';
import '../../../core/constant/app_string_constants.dart';

class UpdateProfileScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Stack(
                    alignment: Alignment.topCenter,
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
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontSize: 20,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Kerollos Sameh",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                            Text(
                              "01282454642",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Colors.green,
                                      fontSize: 20,
                                      //color: AppColorConstant.titleMedColor,
                                      fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.15,
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('assets/images/banner photo.jpeg'),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.23,
                        left: MediaQuery.of(context).size.width * 0.49,
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: IconButton(
                              onPressed: () {
                                print("Kerollos Sameh Foaud");
                              },
                              icon: const Icon(Icons.camera_alt_outlined)),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        cursorColor:
                            Theme.of(context).textTheme.bodyLarge!.color,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 25),
                        decoration: InputDecoration(
                          hintText: "Update Your Name",
                          hintStyle:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: AppColorConstant.primaryColor,
                                    fontWeight: FontWeight.w300,
                                  ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColorConstant.primaryColor,
                            ),
                          ),
                          enabled: true,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        //controller: phoneController,
                        keyboardType: TextInputType.phone,
                        validator: (String? value) {
                          if (value!.length < 11) {
                            return 'Invalid phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      TextFormField(
                        cursorColor:
                            Theme.of(context).textTheme.bodyLarge!.color,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 25,
                            ),
                        decoration: InputDecoration(
                          hintText: "Update Your Phone",
                          hintStyle:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: AppColorConstant.primaryColor,
                                    fontWeight: FontWeight.w300,
                                  ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColorConstant.primaryColor,
                            ),
                          ),
                          enabled: true,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        //controller: phoneController,
                        keyboardType: TextInputType.phone,
                        validator: (String? value) {
                          if (value!.length < 11) {
                            return 'Invalid phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
