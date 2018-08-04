import 'dart:async';
import 'dart:convert';

import 'package:flutter_redurx/flutter_redurx.dart';
import 'package:geo_tag_diary/diary.dart';
import 'package:http/http.dart' as http;

class ChangeMessage extends Action<Diary> {
  ChangeMessage(this.message);
  final String message;

  @override
  Diary reduce(Diary state) {
    return Diary(message: message);
  }
}

class GetQuote extends AsyncAction<Diary> {
  @override
  Future<Diary> reduce(Diary state) async {
    /**
     * Just calling the API using http package and returning a new State with the Quote.
     */
    final response = await http.get('https://talaikis.com/api/quotes/random/');
    final data = json.decode(response.body);
    return Diary(message: data['quote']);
  }
}
