abstract class BaseApiServices {
  Future<dynamic> getAPI(String url);
  Future<dynamic> postAPI(String url, var data);
  Future<dynamic> deleteAPI(String url);
}
