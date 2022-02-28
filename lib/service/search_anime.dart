import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:watch_anime/constants/constants.dart';
import 'package:watch_anime/model/search_data_model.dart';

class SearchService {
  final String baseUrl = Constants.baseUrl;

  Future<SearchDataModel> getSearchData(String query) async {
    dynamic data;

    try {
      var response = await http.Client().get(
        Uri.parse("$baseUrl/search?searchQuery=$query"),
      );

      var jsonResponse = json.decode(response.body);

      data = SearchDataModel.fromJson(jsonResponse);
    } catch (error) {
      log(error.toString());
    }

    return data;
  }
}
