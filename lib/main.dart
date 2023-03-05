import 'package:ecommerce/BlocObserver.dart';
import 'package:ecommerce/Screens/SplashScreen.dart';
import 'package:ecommerce/cubit/Login/login_cubit.dart';
import 'package:ecommerce/cubit/Banner/banner_cubit.dart';
import 'package:ecommerce/cubit/Category/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/Register/register_cubit.dart';
void main() {
  Bloc.observer =MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => BannerCubit()),
          BlocProvider(create: (context) => CategoryCubit()),
          BlocProvider(create: (context) => RegisterCubit()),



        ],
        child: MaterialApp(
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
        ));
  }
}

