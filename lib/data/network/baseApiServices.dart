abstract class BaseApiServices{
  Future<dynamic> getGetResponse(String url);
  Future<dynamic> getpostApiResponse(String url, dynamic data);
}