import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'store/Actions.dart';
import 'store/AppState.dart';

class FilmBrief extends StatelessWidget {
  final dynamic film;
  final Store<AppState> store;
  FilmBrief({this.film, this.store});

  @override
  Widget build(BuildContext context) {
    String rootUrl = "http://localhost:5000";
    return new GestureDetector(
        onTap: () {
          this
              .store
              .dispatch({'type': Actions.SET_SELECTED_FILM, "film": this.film});
          this.store.dispatch({'type': Actions.SHOW_FILM_DETAILS});
        },
        child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network('$rootUrl${this.film['poster_path']}',
                      height: 100, width: 100),
                  Flexible(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        Text(this.film['title'],
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        Text(this.film['tagline']),
                      ]))
                ])));
  }
}
