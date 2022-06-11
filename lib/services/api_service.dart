import 'dart:convert';

import 'package:http/http.dart' as http;
import '/models/config.dart';
import '/models/loginRequest.dart';
import '/models/loginResponse.dart';
import '/services/shared_service.dart';

class APIService {
  static var client = http.Client();

  static Future<LoginResponse> login(
    LoginRequest model,
    ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.baseUrl,
      Config.authLogin
    );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {

      await SharedService.setLoginDetails(loginResponseJson(response.body));
    }
    return loginResponseJson(
      response.body
    );
  }

  static Future<String> getUserCards() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': '${loginDetails!.payload!.token}'
    };

    var url = Uri.http(Config.baseUrl, Config.fetchCards);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

}
