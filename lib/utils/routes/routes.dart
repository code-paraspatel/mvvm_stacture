

import 'package:flutter/material.dart';
import 'package:with_project_stucture/utils/routes/routes_name.dart';
import 'package:with_project_stucture/view/home_screen.dart';
import 'package:with_project_stucture/view/login_screen.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginScreen(),);
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen(),);
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        },
        );}
  }
}