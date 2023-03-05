import 'package:ecommerce/cubit/Login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailWidgetLogin extends StatefulWidget {
  const EmailWidgetLogin({Key? key}) : super(key: key);

  @override
  State<EmailWidgetLogin> createState() => _EmailWidgetLoginState();
}

class _EmailWidgetLoginState extends State<EmailWidgetLogin> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        textDirection: TextDirection.ltr,
        onTapOutside: (event) =>
            FocusManager.instance.primaryFocus?.unfocus(),
        controller: BlocProvider.of<LoginCubit>(context).emailController,
        decoration: InputDecoration(border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff4a4bb7))),
          labelText: "Email",
          prefixIcon: Icon(Icons.email_outlined),),
        keyboardType: TextInputType.emailAddress,


        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter Email";
          } else if (
          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(BlocProvider.of<LoginCubit>(context).emailController.text!)==false)
          {
            return "Enter a correct email form";
          }
          return null;
        },

      ),
    );;
  }
}
