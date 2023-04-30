import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:elwarsha/authentication/domain/usecase/send_verfy_code_usecase.dart';
import 'package:elwarsha/core/constant/app_variable_constants.dart';
import 'package:elwarsha/layout/domain/entities/profile_entities/profile_entity.dart';
import 'package:elwarsha/layout/domain/usecase/get_products_usecase.dart';
import 'package:elwarsha/layout/presentation/screens/more_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../authentication/domain/entities/auth_entity.dart';
import '../../../../core/services/cache_helper.dart';
import '../../../../core/services/location_helper.dart';
import '../../../domain/usecase/get_profile_data_usecase.dart';
import '../../../domain/usecase/get_slides_usecase.dart';
import '../../screens/categories screen.dart';
import '../../screens/home_screen.dart';
import '../../screens/orders screen.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  final GetSlidesUserCase getSlides;
  final GetProductUseCase getProductsUseCase;
  final GetProfileDataUseCase getProfileDataUseCase;

  LayoutCubit(
      this.getSlides, this.getProductsUseCase, this.getProfileDataUseCase)
      : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    const CategoriesScreen(),
    const OrdersScreen(),
    MoreScreen(),
  ];

  void changeBottomIndex({required int index}) {
    currentIndex = index;
    emit(LayoutChangeBottomNavBar());
  }

  int activeIndex = 0;

  void changeActiveIndex({required int index}) {
    activeIndex = index;
    emit(AppChangeCarousalActiveIndexState());
  }

  void getSliders({required String token}) async {
    emit(GetSlidesLoadingState());
    SlideParameter parameter = SlideParameter(token: token);
    var result = await getSlides(parameter);
    result.fold(
      (l) => emit(GetSlidesErrorState(errorMessage: l.message)),
      (r) => emit(GetSlidesSuccessState(sliders: r)),
    );
  }

  void getProducts({required String token}) async {
    emit(GetProductsLoadingState());
    ProductParameter parameter = ProductParameter(token: token);
    var result = await getProductsUseCase(parameter);
    result.fold(
      (l) => emit(GetProductsErrorState(errorMessage: l.message)),
      (r) => emit(GetProductsSuccessState(products: r)),
    );
  }

  ProfileEntity? currentUserData;

  void getProfileData({required String token}) async {
    emit(GetProfileLoadingState());
    ProfileParameter parameter = ProfileParameter(token: token);
    var result = await getProfileDataUseCase(parameter);
    result.fold(
      (l) => emit(GetProfileErrorState(errorMessage: l.message)),
      (r) {
        currentUserData = r;
        emit(GetProfileSuccessState(userData: r));
      },
    );
  }

  File? image;
  String? imagePath;
  final imagePicker = ImagePicker();
  int numImage = 0;

  Future setImage() async {
    image = null;
    var pickerImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickerImage != null) {
      emit(LoadingUploadUserPhotoState());
      image = File(pickerImage.path);
      uploadImage().then((value) {
        imagePath = value;
        emit(SuccessUploadUserPhotoState(image: imagePath));
        image = null;
        numImage++;
      }).catchError((error) {
        emit(ErrorUploadUserPhotoState());
        print('error while upload photo $error');
      });
    } else {}
  }

  Future uploadImage() async {
    String path = 'Images/$numImage/elwarsha-app.appspot.com/';
    final ref = FirebaseStorage.instance.ref().child(path);
    UploadTask? uploadTask;
    uploadTask = ref.putFile(image!);
    final snapshot = await uploadTask.whenComplete(() {});

    final urlDownload = await snapshot.ref.getDownloadURL();
    return urlDownload;
    //CacheHelper.saveData(key: 'photoURL', value: urlDownload);
    //print('Image link:$urlDownload');
  }



  late String lat;
  late String long;
  late Position? position;

  Future<void> getUserCurrentLocation() async {
    await LocationHelper.detectCurrentLocation();
    position = await Geolocator.getLastKnownPosition().whenComplete(() {
      lat = position!.latitude.toString();
      long = position!.longitude.toString();
      emit(SuccessGetUserCurrentLocationState(lat, long));
      print('lat =>$lat , long =>$long');

    }).catchError((error) {
      emit(ErrorGetUserCurrentLocationState(error.toString()));
    });
  }
}
