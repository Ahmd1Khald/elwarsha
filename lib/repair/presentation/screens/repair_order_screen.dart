import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/global/widgets/show_flutter_toast.dart';
import '../../../core/services/cache_helper.dart';
import '../../../core/services/service_locator.dart';
import '../../../fuel/presentation/components/custom_size.dart';
import '../../domain/usecase/repair_usecase.dart';
import '../controllers/repair_cubit/repair_cubit.dart';
import '../controllers/repair_cubit/repair_state.dart';

class RepairOrderScreen extends StatelessWidget {
  final TextEditingController carDetailsController = TextEditingController();
  final TextEditingController problemsController = TextEditingController();
  final GlobalKey formKey = GlobalKey<FormState>();

  RepairOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RepairCubit>(),
      child: BlocConsumer<RepairCubit, RepairStates>(
        listener: (context, state) {
          if (state is SuccessMakeRepairOrderState) {
            showFlutterToast(
                message: state.makeRepairOrderResponse.message,
                state: ToastState.success);
            print("Kero: object => ${state.makeRepairOrderResponse.services[0].name}");
          }

        },
        builder: (context, state) {
          RepairCubit cubit = RepairCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.grey[900],
            floatingActionButton: Container(
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(50)),
              child: MaterialButton(
                onPressed: () {
                  ///TODO: ADD the USer info After finishing the UI Screen
                  RepairParameter parameter = RepairParameter(
                    token: CacheHelper.getDate(key: 'token'),
                    carType: 'BMW',
                    lag: 31.248515510559074,
                    lat: 27.154732639303678,
                    description: 'Kerollos KErollso Wash',
                    city: 'assuit',
                    repairService: [1,2],
                  );
                  cubit.makeRepairOrder(parameter: parameter);
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
