import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:drug_shoppa/models/products.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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

    var url = Uri.https(Config.baseUrl, Config.authLogin);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseJson(response.body));
    }
    return loginResponseJson(response.body);
  }

  static Future<List<Products>> getProducts(String params) async {
    List<Products> data = <Products>[];
    String userName = dotenv.env['CONSUMER_KEY']!;
    String password = dotenv.env['CONSUMER_SECRET']!;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$userName:$password'));
    try {
      String url = Config.baseUrl + Config.getProducts + params;
      var response = await Dio().get(
        url,
        options: Options(headers: {
          HttpHeaders.authorizationHeader: basicAuth,
        }),
      );
      if (response.statusCode == 200) {
        data = (response.data as List)
            .map(
              (e) => Products.fromJson(e),
            )
            .toList();
        //  await SharedService.saveRecentlyArrivedProducts(productsJson((response.data)));
        // return data;
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
    return data;
  }
}
