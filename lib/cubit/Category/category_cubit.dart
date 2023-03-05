import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/Models/CategoryModel.dart';
import 'package:http/http.dart' as http ;
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  List<CategoryModel> CategoryData=[];
  void getBanners()async{
    Response CategoryRes= await http.get(Uri.parse('https://student.valuxapps.com/api/banners'));
    var CategoryDecoded=jsonDecode(CategoryRes.body);
    if(CategoryDecoded['status']==true){
      for (var item in CategoryDecoded['data'])   {       // بنلف علي كل بانر جوا الليست اوف ماب
        CategoryData.add(CategoryModel.fromJson(CategoryDatafromAPI: {}));
      }
      debugPrint('First item on BannesData is :  ${CategoryData.first.image}');

      debugPrint('Banners data is ${CategoryDecoded}');
      emit(CategorySuccessState());
    }
    else {

      emit(CategoryFailureState());
    }
  }
}
