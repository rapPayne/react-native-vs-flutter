import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'store/Actions.dart'; 
import 'store/AppState.dart';
import 'FilmBrief.dart';
import 'FilmDetails.dart';
import 'DatePicker.dart';
import 'ShowingTimes.dart';
import 'Title.dart' as DaamTitle;

class Landing extends StatefulWidget {
  final Store<AppState> store;
  Landing({this.store}) {
    this.store.dispatch({'type': Actions.FETCH_FILMS});
  }

  @override
  _Landing createState() {
    return _Landing(store: this.store);
  }
}

class _Landing extends State<Landing> {
  final Store<AppState> store;
  _Landing({this.store});

  @override
  Widget build(BuildContext context) {
    /*
    The StoreProvider provides the store to all ancestors who need it, namely StoreConnectors. They look up in the heirarchy until they find this guy. One StoreProvider to many StoreConnectors.
    */
    return StoreProvider<AppState>(
        store: this.store,
        /*
        This StoreConnector says to redraw this any time a dispatch is called from any descendant.
        */
        child: StoreConnector<AppState, AppState>(converter: (store) {
          return store.state;
        }, builder: (context, callback) {
          if (store.state.showFilmDetails)
            return showFilmDetails(this.store.state.selectedFilm);

          return SingleChildScrollView(
              child: Column(children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset("images/daam.png", height: 75, fit: BoxFit.cover),
                DaamTitle.Title(title: "Dinner and a Movie"),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            Text(
                "Tap a movie below to see its details. Then pick a date to see showtimes."),
            DatePicker(store.state.selectedDate, this.store),
            // If there's a selectedDate and a selectedFilm, show this. If not, don't.
            store.state.selectedDate == null || store.state.selectedFilm == null
                ? Text("")
                : ShowingTimes(
                    showings: store.state.showings,
                    selectedDate: store.state.selectedDate,
                    film: this.store.state.selectedFilm),
            Column(
                children: this
                    .store
                    .state
                    .films
                    .map<Widget>(
                        (film) => new FilmBrief(film: film, store: this.store))
                    .toList()),
          ]));
        }));
  }

  Widget showFilmDetails(film) {
    return SingleChildScrollView(child: Column(
      children: <Widget>[
      FilmDetails(film: this.store.state.selectedFilm, selectedDate: this.store.state.selectedDate, showings: this.store.state.showings),
      RaisedButton(
        child:Text("Done"), 
        onPressed: () => store.dispatch({'type': Actions.HIDE_FILM_DETAILS })
        ),
      ]
      ));
  }
}