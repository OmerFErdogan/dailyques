import 'package:daily_ques/data/services/login/model/login_request_model.dart';
import 'package:daily_ques/data/services/login/model/login_response_model.dart';
import 'package:http/http.dart' as http;


abstract class LoginService {
  Future login(LoginRequestModel registerRequestModel);
}

class LoginServiceImp extends LoginService {
  @override
  Future login(LoginRequestModel loginRequestModel) async {
    const String _baseUrl = 'http://dailyqueswithoe.com/daily_ques/login.php';

    var _url = Uri.parse(_baseUrl);

    final response = await http.post(_url, body: loginRequestModel.toJson());

    if (response.statusCode == 200) {
      return loginResponseModelFromJson(response.body);
    } else {
      return '';
    }
  }
}