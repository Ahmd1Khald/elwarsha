import 'package:flutter/material.dart';
import '../../../fuel/presentation/components/custom_size.dart';

class CarWashOrderScreen extends StatefulWidget {
  const CarWashOrderScreen({Key? key}) : super(key: key);

  @override
  State<CarWashOrderScreen> createState() => _CarWashOrderScreenState();
}

class _CarWashOrderScreenState extends State<CarWashOrderScreen> {
  String paymentMethod = '';

  var carDetailsController = TextEditingController();
  var problemsController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width*0.03),
          Radio(
            activeColor: Theme.of(context).primaryColor,
            value: 'cash',
            groupValue: paymentMethod,
            onChanged: (value){
              setState(() {
                paymentMethod = value!;
              });
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width * 0.15,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/cach.png',
                  height: MediaQuery.of(context).size.height * 0.0695,
                ),
                Text(
                  'Cash',
                  style: TextStyle(color: Colors.green),
                )
              ],
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width*0.05),
          Radio(
            activeColor: Theme.of(context).primaryColor,
            value: 'paypal',
            groupValue: paymentMethod,
            onChanged: (value){
              setState(() {
                paymentMethod = value!;
              });
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.25,
            child: Image.asset('assets/images/paypal.png'),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(50)),
            child: MaterialButton(
              onPressed: () {
                print(paymentMethod);

              },
              child: const Text(
                'Order',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MainCustomSizedBox(),
                  const Text(
                    'Car Details:',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .2,
                    width: double.infinity,
                    child: TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Must be non empty';
                        } else {
                          return null;
                        }
                      },
                      maxLines: null,
                      expands: true,
                      cursorColor: Colors.grey,
                      controller: carDetailsController,
                      decoration: InputDecoration(
                        hintText:
                        'Ex. Toyota Rukus 2.4 VVT-i Super ECT, 4-speed',
                        filled: true,
                        fillColor: Colors.grey[800],
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                    ),
                  ),
                  const MainCustomSizedBox(),
                  const Text(
                    'Problem Description:',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .2,
                    width: double.infinity,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Must be non empty';
                        }
                      },
                      maxLines: null,
                      expands: true,
                      cursorColor: Colors.grey,
                      controller: problemsController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[800],
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
