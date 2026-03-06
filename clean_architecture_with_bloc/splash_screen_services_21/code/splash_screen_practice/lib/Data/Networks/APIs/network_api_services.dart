import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:splash_screen_practice/Data/Exceptions/app_exceptions%20copy.dart';
import 'package:splash_screen_practice/Data/Networks/APIs/base_api_services.dart';

class BaseAPIServices implements BaseApiServices {
  @override
  Future<dynamic> getAPI(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 10));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    } on TimeoutException {
      throw TimeoutException("Request Timeout");
    }

    return jsonResponse;
  }

  @override
  Future<dynamic> postAPI(String url, var data) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () {
              throw TimeoutException("Request Timeout");
            },
          );

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    } on TimeoutException {
      throw TimeoutException("Request Timeout");
    }

    return jsonResponse;
  }

  @override
  Future deleteAPI(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .delete(Uri.parse(url))
          .timeout(const Duration(seconds: 10));

      jsonResponse = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    } on TimeoutException {
      throw TimeoutException("Request Timeout");
    }

    return jsonResponse;
  }

  // this method is used to handle the response from the server
  dynamic returnResponse(http.Response response) {
    switch (response) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 401:
        throw UnauthorizedException(
          "Unauthorized request: ${response.statusCode}",
        );

      case 403:
        throw ForbiddenException("Forbidden request: ${response.statusCode}");

      case 500:
        throw FetchDataException(
          "Error occurred while communicating with the server: ${response.statusCode}",
        );
      default:
        throw FetchDataException(
          "Error occurred while communicating with the server: ${response.statusCode}",
        );
    }
  }
}
