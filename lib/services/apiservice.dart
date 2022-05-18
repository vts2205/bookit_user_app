import 'dart:convert';

import 'package:bookit_user_app/constants/apiconstants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class APIService {
  final box = GetStorage();

  Future createLogin(String name, contact) async {
    var fcm_token = box.read('token');
    var client = http.Client();
    var completeUrl = APIConstants.baseUrl + APIConstants.login;
    var uri = Uri.parse(completeUrl);
    final response = await client.post(uri,
        body: {'name': name, 'contact': contact, 'fcm_token': '$fcm_token'});
    print(fcm_token);
    print(response.statusCode);
    var convertedDataToJson = jsonDecode(response.body);
    print(convertedDataToJson);
    return convertedDataToJson;
  }
}
