import 'package:redux/redux.dart';
import 'Actions.dart';
import 'AppState.dart';
import 'middleware.dart';


// These hardcoded values should really be read from an Ajax
// service. We're only providing them here to mock up screens
// so that the code will be simpler to follow.
AppState initialState = new AppState(
  selectedDate: DateTime.now(),
  films: [],
  showings: [
    {"id":1, "film_id":1, "theater_id":1, "showing_time":"2019-04-18T01:45:00.000Z"},
    {"id":1, "film_id":1, "theater_id":1, "showing_time":"2019-04-18T03:45:00.000Z"},
    {"id":1, "film_id":1, "theater_id":1, "showing_time":"2019-04-18T05:45:00.000Z"},
  ],
  showFilmDetails: false,
  );

AppState reducer(AppState oldState, dynamic action) {
  switch (action['type']) {
    case Actions.HIDE_FILM_DETAILS:
      return oldState.copyWith(newShowFilmDetails: false);
    case Actions.SET_SELECTED_DATE:
      return oldState.copyWith(newSelectedDate: action['date']);
    case Actions.SET_SELECTED_FILM:
      return oldState.copyWith(newSelectedFilm: action['film']);
    case Actions.SHOW_FILM_DETAILS:
      return oldState.copyWith(newShowFilmDetails: true);
    case Actions.ADD_FILM:
      List<dynamic> newFilms = oldState.films;
      newFilms.add(action['film']);
      return oldState.copyWith(newFilms: newFilms);
    default:
      return oldState;
  }
}

final store =
    new Store<AppState>(reducer, initialState: initialState, middleware: [FetchFilmsMiddleware()]);

// Actions below?
class AddFilmAction {
  final dynamic film;
  AddFilmAction(this.film);
}

class FetchFilmsAction {}

class SetSelectedDateAction {
  final DateTime date;
  SetSelectedDateAction(this.date);
}
