import 'package:ecommerce/StoreScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double get Mwidth =>
      MediaQuery
          .of(context)
          .size
          .width;

  double get Mheight =>
      MediaQuery
          .of(context)
          .size
          .height;
  bool eyePass = true;

  String ? Passwordvalue, emailValue;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    controller: TextEditingController(text: emailValue),
                    decoration: InputDecoration(border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff4a4bb7))),
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email_outlined),),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      emailValue = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Email";
                      } else if (
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(emailValue!)==false)
                      {
                        return "Enter a correct email form";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: TextEditingController(text: Passwordvalue),
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
                      } else if (value.length <= 8) {
                        return "Password must be more than 8";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      Passwordvalue = value;
                    },
                  ),
                ),
                SizedBox(height: Mheight * 0.05,),
                InkWell(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      debugPrint("SUCCESS");
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => StoreScreen(),));
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
                )


              ],
            ),
          ),
        ),
      ),

    );
  }

}