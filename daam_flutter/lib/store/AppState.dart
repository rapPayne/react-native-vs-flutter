class AppState {
  DateTime selectedDate;
  dynamic films;
  dynamic selectedFilm;
  List<dynamic> showings;
  bool showFilmDetails;

  AppState({this.selectedDate, this.films, this.showings, this.selectedFilm, this.showFilmDetails});

  copyWith({DateTime newSelectedDate, dynamic newFilms, dynamic newSelectedFilm, bool newShowFilmDetails}) {
    AppState newAppState =
        new AppState(
          selectedDate: newSelectedDate ?? this.selectedDate,
          films: newFilms ?? this.films,
          showings: this.showings,
          selectedFilm: newSelectedFilm ?? this.selectedFilm,
          showFilmDetails: newShowFilmDetails ?? this.showFilmDetails,
          );
    return newAppState;
  }

  String toString() {
    return "{selectedDate:" + this.selectedDate.toString() + "}";
  }
}
