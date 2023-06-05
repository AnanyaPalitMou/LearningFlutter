import 'package:mvvm/data/network/baseApiServices.dart';
import 'package:mvvm/data/network/networkApiService.dart';
import 'package:mvvm/resources/app_url.dart';

class AuthRepository{
BaseApiServices _apiServices=NetworkApiService();

Future<dynamic> loginApi(dynamic data) async{
  try{
    dynamic response=await _apiServices.getpostApiResponse(AppUrl.loginUrl, data);
  return response;

  }catch(e){
    throw e;
  }
}

Future<dynamic> registerApi(dynamic data) async{
  try{
    dynamic response=await _apiServices.getpostApiResponse(AppUrl.registerApiEndPoint, data);
    return response;

  }catch(e){
    throw e;
  }
}

}