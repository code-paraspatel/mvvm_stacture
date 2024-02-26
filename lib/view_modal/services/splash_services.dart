
import 'package:flutter/material.dart';
import 'package:with_project_stucture/data/modal/user_account_modal.dart';
import 'package:with_project_stucture/utils/routes/routes_name.dart';
import 'package:with_project_stucture/view_modal/auth_user_account_modal.dart';

class SplashServices{

  Future<UserAccountModal> authUserAccountModal()=>AuthUserAccountModal().getUserData();

  void checkUserLogin(BuildContext context){
    authUserAccountModal().then((value) async {
      if(value.token== 'null'|| value.token==''){
        Navigator.pushReplacementNamed(context, RoutesName.login);
      }else{
        Navigator.pushReplacementNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      throw(error.toString());
    });
  }
}
