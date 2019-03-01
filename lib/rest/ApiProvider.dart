import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/model/ItemModel.dart';
import 'package:flutter_app/model/QouteModel.dart';
import 'package:http/http.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class ApiProvider {
  Client client = kiwi.Container().resolve<Client>();

  Future<ItemModel> fetchPosts() async {
    var url = "https://jsonplaceholder.typicode.com/posts/1";
    final response = await client.get(url);
    return ItemModel.fromJson(json.decode(response.body));
  }

  Future<QuoteWrapper> fetchQuoteOfDay() async {
    var url = "https://favqs.com/api/qotd";
    final response = await client.get(url);
    return QuoteWrapper.fromJson(json.decode(response.body));
  }

}
