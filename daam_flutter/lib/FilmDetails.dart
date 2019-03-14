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
                child: Image.network('$rootUrl${film['poster_path']}',
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