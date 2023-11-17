import 'package:flutter/foundation.dart';
import 'package:onlayn_magazin_app/services/networcin_service.dart';
import 'package:test/test.dart';

void main() {
  group('Models Test', () {
    test('Login test', () async {
      final json = {"username": "johnd", "password": "m38rmF\$"};

      String? data = await Networc.loginPost(
        data: json,
      );

      if (data != null) {
        final token = Networc.parseLogin(data);
        debugPrint(token.token);
      } else {
        debugPrint("Username yoki passwor xato.");
      }
    });

    test('Products test', () async {
      String? data = await Networc.productsGet();
      final products = Networc.parseProducts(data!);
      debugPrint(products[4].rating.rate.toString());
    });

    test('Category test', () async {
      String? data = await Networc.categoryGet(category: 'jewelery');
      final products = Networc.parseProducts(data!);
      debugPrint(products[0].title);
    });

    test('Categories test', () async {
      String? data = await Networc.categoriesGet();
      final categories = Networc.parseCategories(data!);
      debugPrint(categories[0]);
    });

    test('One Product test', () async {
      String? data = await Networc.oneProductGet(id: 1);
      final oneProduct = Networc.parseOneProduct(data!);
      debugPrint(oneProduct.title);
    });

    test('Carts test', () async {
      String? data = await Networc.cartsGet();
      final carts = Networc.parseCarts(data!);
      debugPrint(carts[2].userId.toString());
    });

    test('One Cart test', () async {
      String? data = await Networc.oneCartGet(id: 2);
      final carts = Networc.parseOneCart(data!);
      debugPrint(carts.userId.toString());
    });

    test('Users test', () async {
      String? data = await Networc.usersGet();
      final users = Networc.parseUsers(data!);
      debugPrint(users[0].name.toString());
    });
  });
}
