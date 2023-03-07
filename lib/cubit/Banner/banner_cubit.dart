import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../../Models/BannerModel.dart';
part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  final BannerController = PageController();
  BannerCubit() : super(BannerInitial());
  List<BannerModel> BannersData=[];
   void  getBanners()async{
   Response BannersRes= await http.get(
       Uri.parse('https://student.valuxapps.com/api/banners'));
   var BannersDecoded=jsonDecode(BannersRes.body);
   if(BannersDecoded['status']==true){
     for (var item in BannersDecoded['data'])   {       // بنلف علي كل بانر جوا الليست اوف ماب
       BannersData.add(BannerModel.fromJson(datafromAPI: item));
   }
    // debugPrint('First item on BannesData is :  ${BannersData.first.image}');

     debugPrint('${BannersData.length}');
     emit(BannerSuccessState());
   }
   else {
      BannersData=[];
      print("Banners Data is : $BannersDecoded");
     emit(BannerFailureState());
   }
  }
}
