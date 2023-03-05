import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../../Models/BannerModel.dart';
part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(BannerInitial());
  List<BannerModel> BannersData=[];
  void getBanners()async{
   Response BannersRes= await http.get(Uri.parse('https://student.valuxapps.com/api/banners'));
   var BannersDecoded=jsonDecode(BannersRes.body);
   if(BannersDecoded['status']==true){
     for (var item in BannersDecoded['data'])   {       // بنلف علي كل بانر جوا الليست اوف ماب
       BannersData.add(BannerModel.fromJson(datafromAPI: item));
   }
     debugPrint('First item on BannesData is :  ${BannersData.first.image}');

     debugPrint('Banners data is ${BannersDecoded}');
     emit(BannerSuccessState());
   }
   else {

     emit(BannerFailureState());
   }
  }
}
