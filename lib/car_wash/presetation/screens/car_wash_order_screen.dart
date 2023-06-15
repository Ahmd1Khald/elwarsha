import 'package:elwarsha/car_wash/presetation/controller/car_wash_cubit/wash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/global/widgets/show_flutter_toast.dart';
import '../../../core/services/cache_helper.dart';
import '../../../core/services/service_locator.dart';
import '../../../fuel/presentation/components/custom_size.dart';
import '../../domain/usecase/wash_usecase.dart';
import '../controller/car_wash_cubit/wash_state.dart';

class CarWashOrderScreen extends StatelessWidget {
  var carDetailsController = TextEditingController();
  var problemsController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  CarWashOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WashCubit>(),
      child: BlocConsumer<WashCubit, WashStates>(
        listener: (context, state) {
          if (state is SuccessMakeWashOrderState) {
            showFlutterToast(
                message: state.makeWashOrderResponse.message,
                state: ToastState.success);
          }
        },
        builder: (context, state) {
          WashCubit cubit = WashCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.grey[900],
            floatingActionButton: Container(
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(50)),
              child: MaterialButton(
                onPressed: () {
                  ///TODO: ADD the USer info After finishing the UI Screen
                  WashParameter parameter = WashParameter(
                    token: CacheHelper.getDate(key: 'token'),
                    carType: 'TYOTA',
                    lag: 31.248515510559074,
                    lat: 27.154732639303678,
                    description: 'Kerollos KErollso Wash',
                    city: 'assuit',
                  );
                  cubit.makeWashOrder(parameter: parameter);
                },
                child: const Text(
                  'Order',
                  style: TextStyle(fontSize: 20),
                ),
              ),
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
        },
      ),
    );
  }
}
