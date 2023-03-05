
import 'package:flutter/material.dart';
import 'HomeScreen.dart';
class SplashScreen extends StatefulWidget {
   SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   double get Mwidth => MediaQuery.of(context).size.width;
   double get Mheight => MediaQuery.of(context).size.height;

   @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3),
    () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>HomeScreen() ,)),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

       body : Center(
          child: Image.asset('assets/images/logoblue.png',
          width: Mwidth*0.4,)
        ),
    );
  }
}
