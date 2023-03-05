import 'package:ecommerce/Screens/LoginScreen.dart';
import 'package:ecommerce/Screens/StoreScreen.dart';
import 'package:ecommerce/Widgets/NameWidget.dart';
import 'package:ecommerce/Widgets/PhoneWidget.dart';
import 'package:ecommerce/cubit/Register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Widgets/EmailWidgetRegister.dart';
import '../Widgets/PasswordWidgetRegister.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formkey = GlobalKey();

   double get Mwidth => MediaQuery.of(context).size.width;
   double get Mheight => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
  listener: (context, state) {
    if (state is RegisterSuccessState){
      debugPrint("registerd");
      Navigator.push(context, MaterialPageRoute(builder: (context) => StoreScreen(),));
    }else if ( state is RegisterFailureState )
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Container(
            alignment: Alignment.center,
            height: 50,
            width: double.infinity,
            child: Text("ERROR OCCURED"),
          )))
      ;
    }
    },builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: Mheight * 0.2,),
                Text("WELCOME", style: TextStyle(color: Color(0xff4a4bb7),
                    fontSize: Mheight * 0.03,
                    fontWeight: FontWeight.bold),),
                SizedBox(height: Mheight * 0.1,),
                NameWidget(),
                PhoneWidget(),
                EmailWidgetRegister(),
                PasswordWidget(),
                SizedBox(height: Mheight * 0.05,),
                InkWell(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      BlocProvider.of<RegisterCubit>(context).Register(
                          name: BlocProvider.of<RegisterCubit>(context).nameController.text,
                          phone: BlocProvider.of<RegisterCubit>(context).phoneController.text,
                          email: BlocProvider.of<RegisterCubit>(context).emailController.text ,
                          password: BlocProvider.of<RegisterCubit>(context).passwordController.text,
                      );
                      debugPrint("SUCCESS");
                      debugPrint("${BlocProvider.of<RegisterCubit>(context).nameController.text}");

                    }
                  },
                  child: Container(
                    height: Mheight * 0.05,
                    width: Mwidth * 0.7,
                    decoration: BoxDecoration(color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff4a4bb7))
                    ),
                    child: Center(child: Text("Register")),
                  ),
                ),
                SizedBox(height: Mheight * 0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account ? ",style: TextStyle(color: Colors.grey,
                      fontSize: Mheight * 0.02,
                    )),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                      },
                      child: Text("Login",style: TextStyle(color: Color(0xff4a4bb7),
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
// Response response = await http.post(
//   Uri.parse("https://student.valuxapps.com/api/login"),
//   body: {
//     'name' : name,
//     'email' : email,
//     'password' : password,
//     'phone' : phone,
//     'image' : image ?? "kjdkf",
//   }
// );
//
// // jsonDecode()
// var responseBody = jsonDecode(response.body);
// if( responseBody['status'] == true )
//   {
//     // save token
//     emit(RegisterSuccessState());
//   }
// debugPrint('responseItem['data']['token']);
