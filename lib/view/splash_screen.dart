import 'dart:async';

import 'package:flutter/material.dart';
import 'package:with_project_stucture/resources/color.dart';
import 'package:with_project_stucture/view_modal/services/splash_services.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashServices=SplashServices();
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      splashServices.checkUserLogin(context);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Screen',style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.blueColor),),
      ),
    );
  }
}
