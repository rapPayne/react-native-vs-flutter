import 'package:flutter/material.dart';
import 'Title.dart' as DaamTitle;
import 'ShowingTimes.dart';

class FilmDetails extends StatelessWidget {
  final dynamic film;
  final dynamic selectedDate;
  final List<dynamic> showings;

  FilmDetails({this.film, this.selectedDate, this.showings});

  @override
  Widget build(BuildContext context) {
    String rootUrl = "http://localhost:5000";

    return SafeArea(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: <Widget>[
              Center(
                child: Image.network('$rootUrl${this.film['poster_path']}',
                    height: 400, width: 400, fit: BoxFit.contain),
              ),
              selectedDate == null || film == null
                  ? Text("")
                  : ShowingTimes(
                      showings: this.showings,
                      selectedDate: this.selectedDate,
                      film: this.film),
              DaamTitle.Title(title: film["title"]),
              Text(film["tagline"], style: TextStyle(fontSize: 20)),
              Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(film["homepage"])),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(film["overview"], style: TextStyle(fontSize: 15)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text('Release date: ${film["release_date"]}'),
              ),
              Text('Running time: ${film["runtime"]} minutes'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Spacer(),
                  Text('Rating: ${film["vote_average"]}/',
                      style: TextStyle(fontSize: 20)),
                  Text('10', style: TextStyle(fontSize: 10)),
                  Spacer(),
                  Text('${film["vote_count"]} votes'),
                  Spacer(),
                ],
              )
            ])));
  }
}

/*
x    <SafeAreaView>
        <View style={styles.container}>
          <View style={styles.posterContainer}>
x            <Image source={{ uri: `http://localhost:5000/${props.film.poster_path}` }} style={styles.poster} />
          </View>
x          {props.showings && props.selected_date &&
x            <ShowingTimes selected_date={props.selected_date} showings={props.showings} chooseTime={props.chooseTime} film={props.film} />}
x          <Title>{props.film.title}</Title>
          <Text style={styles.tagline}>{props.film.tagline}</Text>
          <Text style={styles.homepage}>{props.film.homepage}</Text>
          <Text style={styles.overview}>{props.film.overview}</Text>
          <Text style={styles.release_date}>Release date: {formatReleaseDate(props.film.release_date)}</Text>
          <Text style={styles.runtime}>Running time: {props.film.runtime} minutes</Text>
          <View style={styles.ratingsRow}>
            <Text style={styles.bigRating}>Rating: {props.film.vote_average}/<Text style={styles.smallRating}>10</Text></Text>
            <Text>{props.film.vote_count} votes</Text>
          </View>
        </View>
x    </SafeAreaView>
*/
