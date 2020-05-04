import 'dart:convert';

import 'package:apod/modals/api_response_model.dart';
import 'package:apod/modals/network_response.dart';
import 'package:http/http.dart' as http;

class NetworkRepo {
  final urlfirst = "https://www.easports.com/fifa/ultimate-team/api/fut/item";

  Future<NetworkResponse> fetchdatafromapi() async {
    try {
      var response = await http.get(urlfirst);
      var parsdresponse = await json.decode(response.body);
      APIResponseModel apiResponseModel =
          APIResponseModel.fromJson(parsdresponse);
      return NetworkData(apiResponseModel);
    } catch (exception) {
      return NetworkException(exception.toString());
    }
  }
}
