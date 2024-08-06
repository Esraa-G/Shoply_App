import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:abc/dio/models.dart';

class ApiProvider {
  final String baseURL = "https://dummyjson.com";
  Dio dio = Dio();

  Future<String> login({required String username, required String password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      FormData userData = FormData.fromMap({"username": username, "password": password});

      Response response = await dio.post(
        "$baseURL/auth/login",
        data: userData,
      );

      await prefs.setString("userToken", response.data["token"]);

      String? userToken = prefs.getString("userToken");
      print("User Token => $userToken");

      return "Login success";
    } catch (e) {
      if (e is DioException) {
        print(e.response?.data["message"]);
        return e.response?.data["message"];
      } else {
        print(e);
        return "An unknown error occurred";
      }
    }
  }

  Future<ProductsOfCategoryModel?> getProductsByCategory(String category) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("userToken");

    try {
      Response response = await dio.get(
        "$baseURL/products/category/$category",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      print("Response data: ${response.data}");
      ProductsOfCategoryModel productsOfCategoryModel = ProductsOfCategoryModel.fromJson(response.data);
      return productsOfCategoryModel;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<String>> getCategories() async {
    try {
      Response response = await dio.get("$baseURL/products/categories");
      print("Categories response data: ${response.data}");


      List<String> categories = List<String>.from(
          response.data.map((category) => category['name'].toString())
      );

      return categories;
    } catch (e) {
      print(e);
      return [];
    }
  }


}