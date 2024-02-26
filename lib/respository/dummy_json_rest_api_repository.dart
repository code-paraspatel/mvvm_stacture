

import 'package:with_project_stucture/data/modal/dummy_json_api_modal.dart';
import 'package:with_project_stucture/data/network/base_api_services.dart';
import 'package:with_project_stucture/data/network/network_api_services.dart';
import 'package:with_project_stucture/resources/appurl.dart';

class DummyJsonRepository{

  final BaseApiServices _apiServices=NetworkApiServices();

  Future<List<Data>> dummyJsonRepository()async{
    try{
      Iterable response=await _apiServices.getGetApiResponse(AppUrl.dummyJsonRestApi);
      return response=List<Data>.from(response.map((e) => Data.fromJson(e))).toList();
    }catch(e){
      print(e.toString());
      throw(e.toString());

    }
  }
}