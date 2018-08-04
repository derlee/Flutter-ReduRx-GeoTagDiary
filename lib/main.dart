import 'package:flutter/material.dart';
import 'package:flutter_redurx/flutter_redurx.dart';
import 'package:geo_tag_diary/app.dart';
import 'package:geo_tag_diary/diary.dart';

void main() {
  /**
   * Our initial state (this is your code)
   */
  final state = Diary(message: 'It works from Diary\'s state');

  /**
   * Give the initial state to a Store (this is ReduRx)
   */
  final store = Store(state);

  /**
   * Give the Store to a Provider (this is Flutter-ReduRx)
   * Make the child of the Provider your App
   */
  runApp(Provider(store: store, child: App()));
}
