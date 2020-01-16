import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/main.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ChangeTheme changeTheme = ChangeTheme.of(context);

    return new Scaffold(
      appBar: AppBar(
        leading: Center(
          child: InkWell(
            child: Text('Light'),
            onTap: changeTheme.switchToLight,
          ),
        ),
        title: Text(
          'Change Theme',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          Center(
              child: InkWell(
            child: Text('Dark'),
            onTap: changeTheme.switchToDark,
          ))
        ],
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          new GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(12.0),
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            children: new List<Widget>.generate(16, (index) {
              return new Container(
                color: Theme.of(context).primaryColor,
              );
            }),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).accentColor,
    );
  }
}
