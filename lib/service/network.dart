import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:navigation_watchlist/src/string.dart';

import 'exception.dart';

class ApiNetwork {
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException(Strings.noInternet);
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    if (response.body.isEmpty) {
      throw Exception(Strings.noData);
    }
    switch (response.statusCode) {
      case 445:
      case 200:
        var responseJson = response.body;
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            Strings.dataException + (response.statusCode).toString());
    }
  }
}
