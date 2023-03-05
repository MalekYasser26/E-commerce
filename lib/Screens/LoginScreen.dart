import 'package:ecommerce/Screens/RegisterScreen.dart';
import 'package:ecommerce/Screens/StoreScreen.dart';
import 'package:ecommerce/Widgets/EmailWidgetLogin.dart';
import 'package:ecommerce/cubit/Login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Widgets/EmailWidgetRegister.dart';
import '../Widgets/PasswordWidgetLogin.dart';
import '../Widgets/PasswordWidgetRegister.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double get Mwidth => MediaQuery.of(context).size.width;

  double get Mheight => MediaQuery.of(context).size.height;


  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if (state is LoginSuccessState){
      print("LOGIN SUCCESSFUL");
      Navigator.push(context, MaterialPageRoute(builder: (context) => StoreScreen(),));

    } else if (state is LoginFailureState) {
      print("errorlogin");
    }
  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: Mheight * 0.3,),
                Text("WELCOME", style: TextStyle(color: Color(0xff4a4bb7),
                    fontSize: Mheight * 0.03,
                    fontWeight: FontWeight.bold),),
                SizedBox(height: Mheight * 0.1,),
                EmailWidgetLogin(),
                PassWidgetLogin(),
                SizedBox(height: Mheight * 0.05,),
                InkWell(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      BlocProvider.of<LoginCubit>(context).Login(
                          email: BlocProvider.of<LoginCubit>(context).emailController.text,
                          password: BlocProvider.of<LoginCubit>(context).passwordController.text);
                      debugPrint("SUCCESS");
                    }
                  },
                  child: Container(
                    height: Mheight * 0.05,
                    width: Mwidth * 0.7,
                    decoration: BoxDecoration(color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff4a4bb7))
                    ),
                    child: Center(child: Text("Login")),
                  ),
                ),
                SizedBox(height: Mheight * 0.05,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ? ",style: TextStyle(color: Colors.grey,
                        fontSize: Mheight * 0.02,
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                      },
                      child: Text("REGISTER",style: TextStyle(color: Color(0xff4a4bb7),
                          fontSize: Mheight * 0.025,
                          fontWeight: FontWeight.bold)),
                    ),
                  ],
                )


              ],
            ),
          ),
        ),
      ),

    );
  },
);
  }

}