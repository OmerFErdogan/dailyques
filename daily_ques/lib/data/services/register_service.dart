import 'package:daily_ques/data/services/dio_manager.dart';
import 'package:daily_ques/data/services/register/model/register_request_model.dart';
import 'package:daily_ques/data/services/register/model/register_response_model.dart';
import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

abstract class RegisterService {
  Future register(RegisterRequestModel registerRequestModel);
}

class RegisterServiceImp extends RegisterService {
  @override
  Future register(RegisterRequestModel registerRequestModel) async {
    const String _baseUrl = 'http://dailyqueswithoe.com/daily_ques/register.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.post(_url, body: registerRequestModel.toJson());

    if (response.statusCode == 200) {
      print('Kayıt başarılı');
      return registerResponseModelFromJson(response.body);
    } else {
      return '';
    }
  }
}