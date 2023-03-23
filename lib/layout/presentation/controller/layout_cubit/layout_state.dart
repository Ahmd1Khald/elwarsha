import 'package:equatable/equatable.dart';

abstract class LayoutStates {}

class LayoutInitialState extends LayoutStates {}

class LayoutChangeBottomNavBar extends LayoutStates {}

class AppChangeCarousalActiveIndexState extends LayoutStates {}
