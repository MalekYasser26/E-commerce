import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'login_state.dart';
class LoginCubit extends Cubit<LoginState> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginCubit() : super(LoginInitialState());
  void Login({required String email,required String password}) async {
    Response LoginRes = await http.post(Uri.parse('https://student.valuxapps.com/api/login'),
    body: {
      'email':  email ,
      'password' : password
    } ,
    );
    var data = jsonDecode(LoginRes.body);
    if (LoginRes.statusCode==200){
      if(data['status']==true){
        emit(LoginSuccessState());
      }
      else{
        emit(LoginFailureState());
      }
    }

    
  }
}

