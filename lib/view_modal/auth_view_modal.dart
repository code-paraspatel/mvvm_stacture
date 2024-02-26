
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:with_project_stucture/data/modal/user_account_modal.dart';
import 'package:with_project_stucture/respository/auth_repository.dart';
import 'package:with_project_stucture/utils/routes/routes_name.dart';
import 'package:with_project_stucture/utils/utils.dart';
import 'package:with_project_stucture/view_modal/auth_user_account_modal.dart';

class AuthViewModal extends ChangeNotifier{

  final _myRepo=AuthRepository();
   bool _loading=false;
   bool get loading=>_loading;
   setLoading(bool value){
     _loading=value;
     notifyListeners();
   }



  Future loginApi(dynamic data,BuildContext context)async{
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.flushBar(context, 'Login Successfully');
      final userpref=Provider.of<AuthUserAccountModal>(context,listen: false);
      userpref.saveUserData(
        UserAccountModal(
          token: value['token'].toString()
        ),
      );
      userpref.getUserData();
      notifyListeners();
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBar(context, error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future sigUpApi(dynamic data,BuildContext context)async{
    setLoading(true);
        _myRepo.regiserApi(data).then((value) {
          setLoading(false);
          Utils.flushBar(context, 'Sign Up SuccessFully');
          Navigator.pushNamed(context, RoutesName.home);
         if (kDebugMode) {
           print(value);
         }
       }).onError((error, stackTrace) {
         setLoading(false);
         Utils.flushBar(context, error.toString());
         if (kDebugMode) {
           print(error.toString());
         }
        });
  }
}