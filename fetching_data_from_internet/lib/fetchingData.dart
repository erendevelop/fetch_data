import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future fetchData() async {
  var url;
  // Getting the datas from website

  url = await http.get(Uri.parse(
      "https://developers.themoviedb.org/3/movies/get-movie-details?api_key=**"));
  // Decoding as map

  return json.decode(url.body["results"]);
}
