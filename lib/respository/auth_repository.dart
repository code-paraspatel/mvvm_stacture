
import 'package:with_project_stucture/data/network/base_api_services.dart';
import 'package:with_project_stucture/data/network/network_api_services.dart';
import 'package:with_project_stucture/resources/appurl.dart';

class AuthRepository{

  BaseApiServices _apiServices = NetworkApiServices();

Future<dynamic> loginApi(dynamic data)async{
  try{
    dynamic response=await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
    return response;
  }catch(e){
   throw e;
  }
}

  Future<dynamic> regiserApi(dynamic data)async{
    try{
      dynamic response=await _apiServices.getPostApiResponse(AppUrl.registerUrl, data);
      return response;
    }catch(e){
      throw (e.toString());
    }
  }

}