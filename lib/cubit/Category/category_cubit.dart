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
  final CategoryController = PageController();
  List<CategoryModel> CategoryData=[];

  Future<String> getCategories() async {
    emit(CategoryLoadingState());
    Response CategoryRes = await http.get(
      Uri.parse('https://student.valuxapps.com/api/categories'),
      headers: {
        'lang': 'en',
      },
    );
    var CategoryDecoded = jsonDecode(CategoryRes.body);
    if (CategoryDecoded['status'] == true) {
      for (var item in CategoryDecoded['data']['data']) {
        CategoryData.add(CategoryModel.fromJson(CategorydatafromAPI: item));
      }
      debugPrint('First item on CategoryData is: ${CategoryData.first.image}');

      debugPrint('Categories data is ${CategoryDecoded}');
      emit(CategorySuccessState());
    } else {
      CategoryData = [];
      print("Category Data is: $CategoryDecoded");
      emit(CategoryFailureState());
    }
    return "${CategoryDecoded}";
  }

}
