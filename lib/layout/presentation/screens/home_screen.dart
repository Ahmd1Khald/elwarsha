import 'package:carousel_slider/carousel_slider.dart';
import 'package:elwarsha/core/constant/app_color_constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/global/widgets/navigate_to.dart';
import '../../../winch/presentation/screens/winch_service_screen.dart';
import '../components/global_components/layout_header.dart';
import '../components/home_components/banner_model.dart';
import '../components/home_components/dummy_data.dart';
import '../controller/layout_cubit/layout_cubit.dart';
import '../controller/layout_cubit/layout_state.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LayoutHeader(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .06,
            ),
            CarouselSlider.builder(
              options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    LayoutCubit.get(context).changeActiveIndex(index: index);
                  },
                  height: 230,
                  autoPlay: true,
                  viewportFraction: 1,
                  reverse: false,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  enlargeCenterPage: true),
              itemCount: bannerItems.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return buildCarousal(bannerItems[index], index);
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: AnimatedSmoothIndicator(
                activeIndex: LayoutCubit.get(context).activeIndex,
                count: bannerItems.length,
                effect: const WormEffect(
                  activeDotColor: AppColorConstant.primaryColor,
                  dotWidth: 10,
                  dotHeight: 10,
                  spacing: 3.5,
                  paintStyle: PaintingStyle.stroke,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 18.0, top: MediaQuery.of(context).size.height * 0.04),
              child: const FavoriteServiceBuilder(),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04, left: 18),
              child: Text(
                "Online Shop",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => buildOnlineShop(context: context,index: index,list: shopImages),
                itemCount: shopImages.length,
              ),
            )
          ],
        );
      },
    );
  }
}

class FavoriteServiceBuilder extends StatelessWidget {
  const FavoriteServiceBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Favorite Service",
            style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Row(
          children: [
            InkWell(
              onTap: () {
                navigateTo(context: context, destination: WinchServiceScreen());
              },
              child: Container(
                height: MediaQuery.of(context).size.height * .12,
                width: MediaQuery.of(context).size.width * .27,
                decoration: BoxDecoration(
                    color: AppColorConstant.backgroundColor,
                    border: Border.all(color: Colors.white)),
                child: Image.asset('assets/images/winsh.png'),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .05,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: MediaQuery.of(context).size.height * .12,
                width: MediaQuery.of(context).size.width * .27,
                decoration: BoxDecoration(
                    color: AppColorConstant.backgroundColor,
                    border: Border.all(color: Colors.white)),
                child: Image.asset('assets/images/car repair.png'),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .05,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: MediaQuery.of(context).size.height * .12,
                width: MediaQuery.of(context).size.width * .27,
                decoration: BoxDecoration(
                    color: AppColorConstant.backgroundColor,
                    border: Border.all(color: Colors.white)),
                child: Image.asset('assets/images/fuel pump.png'),
              ),
            ),
          ],
        )
      ],
    );
  }
}

Widget buildCarousal(BannerModel model, int index) => Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: AssetImage(model.image),
            fit: BoxFit.cover,
          )),
    );

List<String>shopImages = [
  "assets/images/au500005396_1.jpg",
  "assets/images/61KtQiffmiL._AC_SX679_.jpg",
  "assets/images/51MBjZtg8ES._AC_SX679_.jpg",
  "assets/images/41233v6K1jL._AC_SL1500_.jpg",
];

Widget buildOnlineShop({required context, required List list , required int index})=>Padding(
  padding: const EdgeInsets.all(10.0),
  child: InkWell(
    onTap: () {},
    child: Container(
      height: MediaQuery.of(context).size.height * .12,
      width: MediaQuery.of(context).size.width * .27,
      decoration: BoxDecoration(
          color: AppColorConstant.backgroundColor,
          border: Border.all(color: Colors.white)),
      child: Image.asset(list[index],fit: BoxFit.cover),
    ),
  ),
);
