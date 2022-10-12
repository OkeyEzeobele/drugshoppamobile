// ignore_for_file: body_might_complete_normally_nullable

import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:drug_shoppa/models/products.dart';
import 'package:flutter/material.dart';
import '/models/loginResponse.dart';
import '/ui/export.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist('login_details');
    return isKeyExist;
  }

  static Future<LoginResponse?> loginDetails() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist('login_details');

    if (isKeyExist) {
      var cacheData = await APICacheManager().getCacheData('login_details');

      return loginResponseJson(cacheData.syncData);
    }
  }

  static Future<void> setLoginDetails(
    LoginResponse model,
  ) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: 'login_details',
      syncData: jsonEncode(model.toJson()),
    );

    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<bool> isRecentlyArrivedProductsSaved() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist('recently_arrived_products');
    return isKeyExist;
  }

  static Future<List<Products>> recentlyArrivedProducts() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist('recently_arrived_products');
    List<Products> data = <Products>[];

    if (isKeyExist) {
      var cacheData =
          await APICacheManager().getCacheData('recently_arrived_products');

      data = (cacheData.syncData as List)
          .map((e) => Products.fromJson(e))
          .toList();
    }
    return data;
  }

  static Future<void> saveRecentlyArrivedProducts(
    Products model,
  ) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: 'recently_arrived_products',
      syncData: jsonEncode(model.toJson()),
    );

    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache('login_details');
    await APICacheManager().deleteCache('recently_arrived_products');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Loginscreen()));
  }
}
