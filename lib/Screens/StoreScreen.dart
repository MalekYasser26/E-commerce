import 'package:ecommerce/cubit/Banner/banner_cubit.dart';
import 'package:ecommerce/cubit/Category/category_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StoreScreen extends StatelessWidget {
   StoreScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<CategoryCubit ,CategoryState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: TextFormField(
                      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(.1),
                        suffixIcon: IconButton(onPressed: () {
                        }, icon: Icon(Icons.clear),),
                        hintText: "Search",
                      ),
                      onChanged: (SearchValue) {

                      },
                    ),
                  ),
                  BlocProvider.of<BannerCubit>(context).BannersData.isEmpty?
                  SizedBox(child: CircularProgressIndicator()) : // put blocprovider in main ,
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PageView.builder(
                        controller: BlocProvider.of<BannerCubit>(context).BannerController,
                        itemBuilder: (context, index) {
                          return Image.network(BlocProvider.of<BannerCubit>(context).BannersData[index].image!,height: double.infinity,);
                        }, itemCount:BlocProvider.of<BannerCubit>(context).BannersData.length ,),
                    ),
                  ),
                  SizedBox(height: 15,),
                  SmoothPageIndicator(controller: BlocProvider.of<BannerCubit>(context).BannerController,
                    count:3 ,
                    effect: JumpingDotEffect(),
                  ),
                  SizedBox(height: 25,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Categories",style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Color(0xff4a4bb7)
                        )),
                      ),
                      Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("View All",style: TextStyle(fontSize: 15,color: Colors.grey),),
                      ),

                    ],

                  ),
                  SizedBox(height: 10,),
                  BlocProvider.of<CategoryCubit>(context).CategoryData.isEmpty?
                  SizedBox(child: CircularProgressIndicator()) :
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: BlocProvider.of<CategoryCubit>(context).CategoryData.length,

                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          //  child: Text("${BlocProvider.of<CategoryCubit>(context).getCategories()}"),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage("${BlocProvider.of<CategoryCubit>(context).CategoryData[index].image!}"),
                            radius: 30,
                          ),
                        );
                      },),
                  )
                ],
              ),
            ),
          );
      },
    );
  }
}
