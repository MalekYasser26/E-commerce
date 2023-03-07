
import 'package:ecommerce/cubit/bottom_nav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavigationCubit, BottomNavState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Color(0xff4a4bb7),
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              unselectedLabelStyle: TextStyle(color: Colors.grey),
              currentIndex: BlocProvider.of<BottomNavigationCubit>(context).bottomNavIndex,
              onTap: (currentIndex) {
                debugPrint("Current index is : $currentIndex");

                BlocProvider.of<BottomNavigationCubit>(context).changeBottomNavIndex(CurrentIndex: currentIndex);
              },
              items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.category),label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favorites"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
          ]
        ),
        body:  BlocProvider.of<BottomNavigationCubit>(context).layoutScreens[
          BlocProvider.of<BottomNavigationCubit>(context).bottomNavIndex],)
        ;
      },
    );
  }
}
