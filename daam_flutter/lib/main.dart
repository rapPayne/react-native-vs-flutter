import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'store/AppState.dart';
import 'store/store.dart';
import 'Landing.dart';

void main() => runApp(App(store));

class App extends StatelessWidget {
  // This widget is the root of your application.
  final Store<AppState> store;
  App(this.store);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinner and a Movie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dinner and a movie', store: this.store),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.store}) : super(key: key);
  final String title;
  final Store<AppState> store;

  @override
  _MyHomePageState createState() => _MyHomePageState(store: this.store);
}

class _MyHomePageState extends State<MyHomePage> {
  final Store<AppState> store;

  _MyHomePageState({this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Landing(store: this.store)
      ),
    );
  }
}
