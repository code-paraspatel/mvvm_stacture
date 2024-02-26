
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:with_project_stucture/utils/routes/routes_name.dart';
import 'package:with_project_stucture/view_modal/auth_user_account_modal.dart';
import 'package:with_project_stucture/view_modal/services/splash_services.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String tokan='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sharePref();
  }
  sharePref() async {
    SharedPreferences sp =await SharedPreferences.getInstance();
    tokan= sp.getString('token') ?? '';
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
   //final userData= Provider.of<AuthUserAccountModal>(context).getUserData() ?? '';
    return Consumer<AuthUserAccountModal>(
      builder: (context,authUserViewModal,_){
        return Drawer(
            backgroundColor: Colors.white,
            child: ListView(
              children: [
                 UserAccountsDrawerHeader(
                    accountName: const Text('paras patel'),
                    accountEmail: Text(tokan)),
                ListTile(
                  onTap: (){
                    Navigator.pushNamed(context, RoutesName.resReqApi);
                  },
                  title: const Text('ResReq Api'),
                ),
                ListTile(
                  onTap: (){
                    Navigator.pushNamed(context, RoutesName.dummyJsonApi);
                  },
                  title: const Text('Dummy Json Api'),
                ),
                ListTile(
                  onTap: (){
                    Navigator.pushNamed(context, RoutesName.covidApiScreen);
                  },
                  title: const Text('Covid Api'),
                ),
                ListTile(
                  onTap: (){
                    Navigator.pushNamed(context, RoutesName.favoriteMovies);
                  },
                  title: const Text('Favorite Movies'),
                ),
              ],
            )
        );
      }
    );
  }
}
