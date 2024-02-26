

import 'package:with_project_stucture/data/modal/single_user_data_modal.dart';
import 'package:with_project_stucture/data/network/base_api_services.dart';
import 'package:with_project_stucture/data/network/network_api_services.dart';
import 'package:with_project_stucture/resources/appurl.dart';

class SingleUserDataRepository{
  final BaseApiServices _apiServices=NetworkApiServices();

  Future<SingleUserDataModal> getSingleDataRepo()async{
    try{
      dynamic response= await _apiServices.getGetApiResponse(AppUrl.singleUserDataUrl);
      return response=SingleUserDataModal.fromJson(response);
    }catch(e){
      throw (e.toString());
    }
  }
}