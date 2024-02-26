

import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:with_project_stucture/data/modal/movies_list_modal.dart';




class Utils{

  //List index isodd or iseven
  static bool? listIndex(List<Movies> list){
    for(var i=0;i<list.length;i++){
      if(i%2==0){
       return true;
      }else {
       return false;
      }
    }
  }

  //Average ratting
  static double avgRatting(List<int> ratting){
    var avgRatting=0;
    for(var i=0;i<ratting.length;i++){
      avgRatting=avgRatting+ratting[i];
    }
    return double.parse((avgRatting/ratting.length).toStringAsFixed(1));
  }

  // TextField FocusChanger
  static fieldFocusChanger(
      BuildContext context,
      FocusNode currentFocus,
      FocusNode nextFocus)
  {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);

  }


 static toastMessage(String message){
    Fluttertoast.showToast(msg: message);
  }

  static flushBar(BuildContext context,String message){
   showFlushbar(
       context: context,
       flushbar: Flushbar(
         margin: const EdgeInsets.all(10),
         duration: const Duration(seconds: 2),
        backgroundColor: Colors.black,
        message: message,)..show(context)
   );
  }

  static snackBar(BuildContext context,String message){
   ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         duration: const Duration(seconds: 2),
           content:Text(message) ));
  }
}