// ignore_for_file: unused_local_variable, body_might_complete_normally_nullable

// ignore: unused_import
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/comment_model.dart';

class CommentHelper {
  Future<List<Comment>?> getApi() async {
    http.Response response;
    var url = Uri.parse("https://jsonplaceholder.typicode.com/comments");
    response = await http.get(url);

    if (response.statusCode == 200) {
      var stringResponse = response.body;
      //var jsonDecode = json.decode(stringResponse); //we can also decode like this code
      //for decode json
      return commentFromJson(stringResponse);
      

    }
  }
}
