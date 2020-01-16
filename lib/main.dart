import 'package:flutter/material.dart';
import 'package:flutter_sample/HomePage.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class ChangeTheme extends Model {
  final ThemeData darkTheme =
  ThemeData(accentColor: Colors.black87, primaryColor: Colors.blueGrey );
  final ThemeData lightTheme =
  ThemeData(accentColor: Colors.white30, primaryColor: Colors.lightBlue);
  ThemeData currentTheme =
  ThemeData(accentColor: Colors.white30, primaryColor: Colors.lightBlue);

  static ChangeTheme of(BuildContext context) =>
      ScopedModel.of<ChangeTheme>(context);

  void switchToDark() {
    currentTheme = darkTheme;
    notifyListeners();
  }

  void switchToLight() {
    currentTheme = lightTheme;
    notifyListeners();
  }
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
  static MyAppState of(BuildContext context) {
    return context.ancestorStateOfType(const TypeMatcher<MyAppState>());
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new ScopedModel<ChangeTheme>(
        model: new ChangeTheme(),
        child: new ScopedModelDescendant<ChangeTheme>(
          builder: (context, child, model) =>
              MaterialApp(theme: model.currentTheme,

                  routes: {
                    '/': (context) => new HomePage(),
                  }),
        ));
  }
}
