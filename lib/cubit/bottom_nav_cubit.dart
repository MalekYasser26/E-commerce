import 'package:bloc/bloc.dart';
import 'package:ecommerce/Screens/CategoriesScreen.dart';
import 'package:ecommerce/Screens/StoreScreen.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../Screens/CartScreen.dart';
import '../Screens/FavoritesScreen.dart';
import '../Screens/ProfileScreen.dart';

part 'bottom_nav_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavState> {
  BottomNavigationCubit() : super(ChangeBottomNavIndexState());
  int bottomNavIndex = 0 ;
  changeBottomNavIndex({required int CurrentIndex}){
    bottomNavIndex = CurrentIndex ;
emit(ChangeBottomNavIndexState());
  }
  List<Widget> layoutScreens = [StoreScreen(),CategoriesScreen(),FavoritesScreen(),CartScreen(),ProfileScreen()];

}
