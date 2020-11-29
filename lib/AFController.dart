import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'models/AvailabilityForm.dart';


/// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class AvailabilityFormController {

  // Google App Script Web URL.
  static const String URL = "https://script.google.com/macros/s/AKfycbzHo6Z0pUIe-BVwf-NB_UWWeMKsJg9g1jUNprbr4_bKZ1PKHOY/exec";

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves feedback, parses [availabilityForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(
      AvailabilityForm availabilityForm, void Function(String) callback) async {
    try {
      await http.post(URL, body: availabilityForm.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(url).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future<List<AvailabilityForm>> getFeedbackList() async {
    return await http.get(URL).then((response) {
      var jsonFeedback = convert.jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => AvailabilityForm.fromJson(json)).toList();
    });
  }

}
