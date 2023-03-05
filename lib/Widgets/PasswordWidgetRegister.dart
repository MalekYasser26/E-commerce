import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/Register/register_cubit.dart';

class PasswordWidget extends StatefulWidget {
  PasswordWidget({Key? key}) : super(key: key);

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {

  bool eyePass = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: BlocProvider.of<RegisterCubit>(context).passwordController,
        obscureText: eyePass,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
          labelText: "Password",
          prefixIcon: Icon(Icons.password_sharp),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff4a4bb7))),
          suffixIcon: IconButton(
            icon: Icon(
              eyePass ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                eyePass = !eyePass;
              });
            },
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter Password";
          } else if (value.length < 8) {
            return "Password must be more than 8";
          }
          return null;
        },

      ),
    );
  }
}