import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:onlayn_magazin_app/models/login_model/login_model.dart';
import 'package:onlayn_magazin_app/models/user_model/user_model.dart';

import '../core/apis.dart';
import '../models/carts_model/cart_model.dart';
import '../models/products_model/products_model.dart';

sealed class Networc {
  /// Tizimga kirish uchun.
  static Future<String?> loginPost({
    required Map<String, Object?> data,
  }) async {
    try {
      final url = Uri.parse(Api.loginUrl);
      final response = await http.post(url, body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body);
        return response.body.toString();
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }

  /// Barcha mahsulotlarni Get qilish.
  static Future<String?> productsGet() async {
    try {
      final url = Uri.parse(Api.productsUrl);
      final response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('productsGet');
        return utf8.decoder.convert(response.bodyBytes).toString();
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

  /// Categoriyalarni Get qilish.
  static Future<String?> categoriesGet() async {
    try {
      final url = Uri.parse(Api.categoriesUrl);
      final response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('categoriesGet');
        return utf8.decoder.convert(response.bodyBytes).toString();
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

  /// Tanlangan category Get qilish.
  static Future<String?> categoryGet({required String category}) async {
    try {
      final url = Uri.parse("${Api.categoryUrl}$category");
      final response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('categoryGet');
        return utf8.decoder.convert(response.bodyBytes).toString();
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

  /// Bita mahsulotni Get qilish.
  static Future<String?> oneProductGet({required int id}) async {
    try {
      final url = Uri.parse("${Api.productUrl}$id");
      final response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('oneProductGet');
        return utf8.decoder.convert(response.bodyBytes).toString();
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

  /// Barcha foydalanuvchilar savatini Get qilish.
  static Future<String?> cartsGet() async {
    try {
      final url = Uri.parse(Api.cartsUrl);
      final response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('cartsGet');
        return utf8.decoder.convert(response.bodyBytes).toString();
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

  /// Bita mahsulotni Get qilish.
  static Future<String?> oneCartGet({required int id}) async {
    try {
      final url = Uri.parse("${Api.cartUrl}$id");
      final response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('oneProductGet');
        return utf8.decoder.convert(response.bodyBytes).toString();
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

  /// Barcha foydalanuvchilar malumotini Get qilish.
  static Future<String?> usersGet() async {
    try {
      final url = Uri.parse(Api.usersUrl);
      final response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('usersGet');
        return utf8.decoder.convert(response.bodyBytes).toString();
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

//!-----------------------------------------------------------------------------

  /// Tizimga kirganda tokeni olish uchun.
  static LoginMadel parseLogin(String data) {
    final json = jsonDecode(data);
    final loginData = LoginMadel.fromJson(json);
    return loginData;
  }

  /// Barcha mahsulotlarni parse qilish.
  static List<ProductsModel> parseProducts(String data) {
    List<dynamic> json = jsonDecode(data);

    List<ProductsModel> products =
        json.map((json) => ProductsModel.fromJson(json)).toList();

    return products;
  }

  /// Categoriyalarni parse qilish.
  static List<String> parseCategories(String data) {
    final json = jsonDecode(data);
    final categories = List<String>.from(json);
    return categories;
  }

  /// Bita mahsulotni parse qilish.
  static ProductsModel parseOneProduct(String data) {
    final json = jsonDecode(data);

    final product = ProductsModel.fromJson(json);

    return product;
  }

  /// Barcha foydalanuvchilar savatchasini parse qilish.
  static List<CartModel> parseCarts(String data) {
    List<dynamic> json = jsonDecode(data);
    List<CartModel> carts =
        json.map((json) => CartModel.fromJson(json)).toList();

    return carts;
  }

  /// Bita foydalanuvchi savatini parse qilish.
  static CartModel parseOneCart(String data) {
    final json = jsonDecode(data);
    final cart = CartModel.fromJson(json);
    return cart;
  }

  /// Barcha foydalanuvchilar malumotini parse qilish.
  static List<UserModel> parseUsers(String data) {
    List<dynamic> json = jsonDecode(data);
    List<UserModel> users =
        json.map((json) => UserModel.fromJson(json)).toList();
    return users;
  }
}
