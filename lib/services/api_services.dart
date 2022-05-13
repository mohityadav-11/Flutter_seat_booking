import 'package:ex_booking/constants/api_names.dart';
import 'package:ex_booking/models/exam.dart';
import 'package:http/http.dart' as http;

class ApiServices{

  /// http client instance
  static var _client = http.Client();

  /// method for fetching the api data
  static Future<Exam> fetchData() async {
    /// fetching the api data
    var apiData = await _client.get(
        Uri.parse(ApiNames.exam_api)
    );
    /// if data fetching is successful then pass the data else pass the empty instance
    if(apiData.statusCode == 200){
      var jsonData = apiData.body;
      return examFromJson(jsonData);
    } else {
      return Exam();
    }
  }
}