import 'dart:convert';
import 'dart:io';

import 'package:mvvm/data/app_expcetions.dart';
import 'package:mvvm/data/network/baseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices{
  @override
  Future getGetResponse(String url) async{

    dynamic responseJson;
    try{
      final response= await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson=returnResponse(response);

    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getpostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try{
      final response= await http.post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));
      responseJson=returnResponse(response);

    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response){
    switch(response){
      case 200:
        dynamic responseJson= jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException('Error occured while communicating with server' + 'with status code' + response.statusCode.toString());
    }
  }

}