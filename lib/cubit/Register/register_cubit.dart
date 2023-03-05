import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http ;
import 'package:http/http.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  String ? token ;
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  RegisterCubit() : super(RegisterInitial());
    void Register({required String name , required String phone , required String email , required String password}) async{
      emit(RegisterLoadingState());
     Response RegisterRes = await http.post(Uri.parse('https://student.valuxapps.com/api/register'),
     body: {
       'name': name,
       'email': email,
       'password' : password,
       'phone' : phone ,
       'image' : "jdfjfj"     // الصوره مش شغاله بس لازم ابعت قيمه ك value

     }
     );
      var data = jsonDecode(RegisterRes.body);

      if (RegisterRes.statusCode ==200){
        if (data['status']==true);
       emit(RegisterSuccessState());
       debugPrint(RegisterRes.body);
     }
     else {
       emit(RegisterFailureState());
       debugPrint("Failed");
     }
    }
}
