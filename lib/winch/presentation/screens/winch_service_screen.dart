import 'package:elwarsha/core/constant/app_color_constant.dart';
import 'package:elwarsha/core/global/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/app_string_constants.dart';
import '../../../layout/presentation/components/styles/text_styles.dart';

class WinchServiceScreen extends StatelessWidget {
  WinchServiceScreen({Key? key}) : super(key: key);

  var locationController = TextEditingController();
  var destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColorConstant.backgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            )),
        title: Text(
          'Winch',
          style: TextStyles.largeTitlesStyle.copyWith(fontSize: 28),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 120.0, vertical: 20),
              child: Container(
                width: 120,
                height: 150,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/broken car.png'))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                cursorColor: Theme.of(context).textTheme.bodyLarge!.color,
                style:
                    Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25),
                decoration: InputDecoration(

                  hintText: 'Location',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: AppColorConstant.primaryColor),
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
                controller: locationController,
                keyboardType: TextInputType.phone,
                validator: (String? value) {
                  if (value!.length < 11) {
                    return 'Invalid phone number';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                cursorColor: Theme.of(context).textTheme.bodyLarge!.color,
                style:
                    Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25),
                decoration: InputDecoration(

                  hintText: 'Destination',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: AppColorConstant.primaryColor),
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
                controller: destinationController,
                keyboardType: TextInputType.phone,
                validator: (String? value) {
                  if (value!.length < 11) {
                    return 'Invalid phone number';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 40),
            //r=
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style:  ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xff00b50d)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                  ),
                  child: Text(
                    "Request",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
