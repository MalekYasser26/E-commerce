import 'package:ecommerce/cubit/Banner/banner_cubit.dart';
import 'package:ecommerce/cubit/Category/category_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreScreen extends StatelessWidget {
   StoreScreen({Key? key}) : super(key: key);
  CategoryCubit cubit = CategoryCubit();
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<BannerCubit,BannerState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(.5),
                    suffixIcon: IconButton(onPressed: () {
                    }, icon: Icon(Icons.clear),),
                    hintText: "Search",
                  ),
                  onChanged: (SearchValue) {

                  },
                ),
                cubit.CategoryData.isEmpty?

                PageView.builder(itemBuilder: (context, index) {
                  return Image.network(cubit.CategoryData[index].image!);
                },
                  itemCount:cubit.CategoryData.length ,) : // put blocprovider in main ,
                SizedBox(child: CircularProgressIndicator())
              ],
            ),
          ),
        );
      },
    );
  }
}
