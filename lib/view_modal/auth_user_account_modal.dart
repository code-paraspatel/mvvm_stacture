
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:with_project_stucture/data/modal/single_user_data_modal.dart';
import 'package:with_project_stucture/data/modal/user_account_modal.dart';

class AuthUserAccountModal extends ChangeNotifier{

  Future saveSingleUserData(SingleUserDataModal singleUserDataModal)async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setString('singleUser', singleUserDataModal.toJson().toString());
    notifyListeners();
  }

  Future<SingleUserDataModal> getSingleUserData()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    Object? data=sp.getString('singleUser');
    notifyListeners();
    return SingleUserDataModal(data: jsonDecode(data.toString()));
  }



  Future saveUserData(UserAccountModal userAccountModal) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', userAccountModal.toJson().toString());
    notifyListeners();
  }

  Future<UserAccountModal> getUserData () async {
    SharedPreferences sp =await SharedPreferences.getInstance();
    String? token=sp.getString('token');
    notifyListeners();
    return UserAccountModal(
      token: token.toString(),
    );
  }

  Future removeUserData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    notifyListeners();
    return sp.remove('token');
  }
}