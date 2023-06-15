import 'package:flutter/material.dart';

import '../components/custom_size.dart';

class FuelOrderScreen extends StatefulWidget {
  const FuelOrderScreen({Key? key}) : super(key: key);

  @override
  State<FuelOrderScreen> createState() => _FuelOrderScreenState();
}

class _FuelOrderScreenState extends State<FuelOrderScreen> {
  bool isChecked1 = false;
  double value1 = 1;
  bool isChecked2 = false;
  double value2 = 1;
  bool isChecked3 = false;
  double value3 = 1;
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
                if (formKey.currentState!.validate() &&
                    (isChecked1 || isChecked2 || isChecked3) == true) {}
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
                  Row(
                    children: [
                      /*SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset("assets/images/Fuel jerrycan.png",
                              fit: BoxFit.cover)),*/
                      Checkbox(
                        value: isChecked1,
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                        checkColor: Colors.white,
                        activeColor: Colors.red,
                        //tristate: true,
                        onChanged: (value) {
                          setState(() {
                            isChecked1 = value!;
                          });
                        },
                      ),
                      if (isChecked1)
                        Row(
                          children: [
                            Slider(
                              activeColor: Colors.red,
                              inactiveColor: Colors.grey[600],
                              min: 1,
                              max: 10,
                              label: 'Litter',
                              thumbColor: Colors.red,
                              value: value1,
                              onChanged: (value) {
                                setState(() {
                                  value1 = value;
                                });
                              },
                            ),
                            Text(
                              '${value1.toInt()} L',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 20),
                            )
                          ],
                        )
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked2,
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                        checkColor: Colors.white,
                        activeColor: Colors.red,
                        //tristate: true,
                        onChanged: (value) {
                          setState(() {
                            isChecked2 = value!;
                          });
                        },
                      ),
                      if (isChecked2)
                        Row(
                          children: [
                            Slider(
                              activeColor: Colors.red,
                              inactiveColor: Colors.grey[600],
                              min: 1,
                              max: 10,
                              label: 'Litter',
                              thumbColor: Colors.red,
                              value: value2,
                              onChanged: (value) {
                                setState(() {
                                  value2 = value;
                                });
                              },
                            ),
                            Text(
                              '${value2.toInt()} L',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 20),
                            )
                          ],
                        )
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked3,
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                        checkColor: Colors.white,
                        activeColor: Colors.red,
                        //tristate: true,
                        onChanged: (value) {
                          setState(() {
                            isChecked3 = value!;
                          });
                        },
                      ),
                      if (isChecked3)
                        Row(
                          children: [
                            Slider(
                              activeColor: Colors.red,
                              inactiveColor: Colors.grey[600],
                              min: 1,
                              max: 10,
                              label: 'Litter',
                              thumbColor: Colors.red,
                              value: value3,
                              onChanged: (value) {
                                setState(() {
                                  value3 = value;
                                });
                              },
                            ),
                            Text(
                              '${value3.toInt()} L',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 20),
                            )
                          ],
                        )
                    ],
                  ),
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
