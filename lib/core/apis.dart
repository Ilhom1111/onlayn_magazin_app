sealed class Api {
  /// Tizimga kirish uchun url.
  static const String loginUrl = "https://fakestoreapi.com/auth/login";

  /// Barcha mahsulotlar uchun url.
  static const String productsUrl = "https://fakestoreapi.com/products";

  /// Bita mahsulot uchun url.
  static const String productUrl = "https://fakestoreapi.com/products/";

  /// Categoriyalar uchun url.
  static const String categoriesUrl =
      "https://fakestoreapi.com/products/categories";

  /// Tanlangan category uchun url.
  static const String categoryUrl =
      "https://fakestoreapi.com/products/category/";

  /// Barcha foydalanuvchilar savati uchun url.
  static const String cartsUrl = "https://fakestoreapi.com/carts";

  /// Bita foydalanuvchi savati uchun url.
  static const String cartUrl = "https://fakestoreapi.com/carts/";

  /// Barcha foydalanuvchilar malumotimi olish uchun url.
  static const String usersUrl = "https://fakestoreapi.com/users";

  /// headers
  static const Map<String, String> headers = {
    "Content-Type": "application/json",
  };
}
