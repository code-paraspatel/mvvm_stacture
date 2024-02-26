

import 'package:with_project_stucture/data/modal/movies_list_modal.dart';
import 'package:with_project_stucture/data/network/base_api_services.dart';
import 'package:with_project_stucture/data/network/network_api_services.dart';
import 'package:with_project_stucture/resources/appurl.dart';

class MoviesListRepository{

  final BaseApiServices _apiServices = NetworkApiServices();
  
  Future<MoviesListModal> moviesList()async{
    try {
     dynamic response =  await _apiServices.getGetApiResponse(AppUrl.moviesListUrl);
         return response = MoviesListModal.fromJson(response);
    }catch(e){
      throw(e.toString());
    }
  }
  
  
}