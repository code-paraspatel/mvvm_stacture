import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:with_project_stucture/utils/routes/routes_name.dart';
import 'package:with_project_stucture/view/covid_api_screen.dart';
import 'package:with_project_stucture/view/details_page_resreq_api.dart';
import 'package:with_project_stucture/view/dummy_json_rest_api.dart';
import 'package:with_project_stucture/view/favorite_movies_screen.dart';
import 'package:with_project_stucture/view/home_screen.dart';
import 'package:with_project_stucture/view/login_screen.dart';
import 'package:with_project_stucture/view/resreq_api_screen.dart';
import 'package:with_project_stucture/view/signup_screen.dart';
import 'package:with_project_stucture/view/splash_screen.dart';
import 'package:with_project_stucture/view_modal/auth_covid_api_modal.dart';
import 'package:with_project_stucture/view_modal/auth_dummyjson_api_modal.dart';
import 'package:with_project_stucture/view_modal/auth_movies_modal.dart';
import 'package:with_project_stucture/view_modal/auth_resreq_api_modal.dart';
import 'package:with_project_stucture/view_modal/auth_user_account_modal.dart';
import 'package:with_project_stucture/view_modal/auth_view_modal.dart';
import 'package:with_project_stucture/view_modal/favorite_screen_provider.dart';

void main() {
  runApp(MultiProvider(
      providers:[
        ChangeNotifierProvider.value(value: AuthViewModal()),
        ChangeNotifierProvider.value(value: AuthUserAccountModal()),
        ChangeNotifierProvider.value(value: AuthMoviesListProvider()),
        ChangeNotifierProvider.value(value: AuthResReqApiProvider()),
        ChangeNotifierProvider.value(value: AuthDummyJsonApiProvider()),
        ChangeNotifierProvider.value(value: AuthCovidApi()),
        ChangeNotifierProvider.value(value: FavoriteScreenProvider()),
      ],
    child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splash,
     routes: {
        RoutesName.splash:(context)=> const SplashScreen(),
        RoutesName.login:(context) => const LoginScreen(),
        RoutesName.singUp:(context) => const SignUpScreen(),
        RoutesName.home:(context) => const HomeScreen(),
        RoutesName.resReqApi:(context) => const ResReqApi(),
        RoutesName.detailsPageResReqApi:(context) => const DetailsPageResReqApi(),
        RoutesName.dummyJsonApi:(context) => const DummyJsonRestApi(),
        RoutesName.covidApiScreen:(context) => const CovidApiScreen(),
        RoutesName.favoriteMovies:(context) => const FavoriteMovies(),

     },
    );
  }
}
