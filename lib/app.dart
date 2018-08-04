import 'package:flutter/material.dart';
import 'package:flutter_redurx/flutter_redurx.dart';
import 'package:geo_tag_diary/actions.dart';
import 'package:geo_tag_diary/diary.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Connect<Diary, String>(
                convert: (diary) => diary.message,
                where: (prev, next) => next != prev,
                builder: (message) {
                  return Text(message, textAlign: TextAlign.center);
                },
              ),
              RaisedButton(
                onPressed: () {
                  Provider
                      /**
                       * Reusing [ChangeMessage] to update about an async execution that might take a while.
                       */
                      .dispatch<Diary>(
                          context, ChangeMessage('Getting quote...'))
                      /**
                       * And the the power of chain pattern to right after call [GetQuote]
                       * When `GetQuote` finishes it will update our State just like `ChangeMessage`
                       * It already returns the `Store` so in this second call to `dispatch` there is no need for `Diary` or `context`
                       */
                      .dispatch(GetQuote());
                },
                child: Text('New Quote'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
