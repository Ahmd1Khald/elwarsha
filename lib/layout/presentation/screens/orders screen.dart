import 'package:elwarsha/layout/presentation/controller/layout_cubit/layout_cubit.dart';
import 'package:elwarsha/layout/presentation/controller/layout_cubit/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/global_components/layout_header.dart';
import '../components/styles/text_styles.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const LayoutHeader(),
              //const SizedBox(height: 40,),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.height*.2,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.1),
                        border: Border.all(color: Colors.black)),

                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fuel',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.bodyMediumStyle
                                    .copyWith(fontSize: 19),
                              ),
                              Text(
                                'Service provider name',
                                style: TextStyles.bodySmallStyle.copyWith(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '22\$',
                                    style: TextStyles.bodySmallStyle.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.green),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                  ),
                                  const Text(
                                    '26 July 11 am',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                itemCount: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}
