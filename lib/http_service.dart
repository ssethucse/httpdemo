import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'milks.dart';
import 'post_model.dart';
import 'package:dio/dio.dart';

class HttpService {
  //String postsURL = 'http://ec2-3-20-206-204.us-east-2.compute.amazonaws.com:8080/consumer/v1/milks/prices';
  //final String postsURL = "https://jsonplaceholder.typicode.com/posts";
  String postsURL = 'http://localhost:8080/consumer/v1/milks/prices';

  Future<List<Milks>> getPosts() async {
    Dio dio = new Dio();
    var res = await dio.get(postsURL);
    print(res.data.toString());

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.data);

      List<Milks> milks = body
          .map(
            (dynamic item) => Milks.fromJson(item),
      )
          .toList();

      return milks;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}