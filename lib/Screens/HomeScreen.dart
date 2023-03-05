import 'package:ecommerce/Screens/BoardingScreenModel.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'LoginScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double get Mwidth => MediaQuery.of(context).size.width;
  double get Mheight => MediaQuery.of(context).size.height;
  int currentIndex = 0 ;
  final PVcontroller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight:Mheight*0.05,backgroundColor: Colors.white,elevation: 0, ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: bsmItems.length,
                    controller: PVcontroller,
                    onPageChanged: (index) {
                      currentIndex = index;
                      setState(() {
                      });
                    },
                    itemBuilder:(context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: Mheight*0.1,),
                           Image.asset(bsmItems[index].image,fit: BoxFit.fitWidth,width: Mwidth*0.8,height: Mheight*0.5) ,
                            Text(bsmItems[index].title,style: TextStyle(fontSize:Mheight*0.03,color: Color(0xff4a4bb7),fontWeight: FontWeight.bold),),
                            Text(bsmItems[index].desc,style: TextStyle(fontSize:Mheight*0.019,color: Colors.grey),textAlign: TextAlign.center,),
                            SizedBox(height: Mheight*0.1,),
                            SmoothPageIndicator(
                              axisDirection: Axis.horizontal,
                              controller: PVcontroller, count: bsmItems.length,
                            effect:JumpingDotEffect(),

                            )
                          ],
                        ),
                      );
                    },

                ),
              )
            ),
            Column(
              children:  [
                InkWell(
                  onTap: () {
                    debugPrint("skip");
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));

                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Text("Skip",style: TextStyle(color: Color(0xff4a4bb7),fontSize: Mheight*0.025,fontWeight: FontWeight.bold),)),
                  ),
                ),
                Expanded(child: SizedBox()),
                InkWell(
                  onTap: () {
                    debugPrint("next");
                    if (currentIndex <2){
                    PVcontroller.nextPage(duration: Duration(milliseconds: 250), curve: Curves.decelerate);
                      setState(() {});
                    }
                    else {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 40),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Text("Next",style: TextStyle(color: Color(0xff4a4bb7),fontSize: Mheight*0.025,fontWeight: FontWeight.bold),)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
