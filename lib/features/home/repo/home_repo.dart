import 'package:bookia_app/core/networking/api_endpoints.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:bookia_app/features/home/models/books_model.dart';

class HomeRepo {
  static Future<BooksModel?>? getBestSellerBooks() async {
    try {
      final response = await DioFactory.dio?.get(ApiEndpoints.bestSeller);
      if (response?.statusCode == 200) {
        BooksModel books = BooksModel.fromJson(response?.data);
        return books;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<List<Products?>?> search(String text) async {
    try {
      final response = await DioFactory.dio?.get(
        ApiEndpoints.search,
        queryParameters: {"name": text},
      );
      if (response?.statusCode == 200) {
        BooksModel booksModel = BooksModel.fromJson(response?.data);
        return booksModel.data?.products;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
