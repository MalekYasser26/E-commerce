import 'package:ecommerce/cubit/Login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PassWidgetLogin extends StatefulWidget {
  const PassWidgetLogin({Key? key}) : super(key: key);

  @override
  State<PassWidgetLogin> createState() => _PassWidgetLoginState();
}
bool eyePass = true;

class _PassWidgetLoginState extends State<PassWidgetLogin> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: BlocProvider.of<LoginCubit>(context).passwordController,
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
