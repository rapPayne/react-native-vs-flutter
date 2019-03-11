import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShowingTimes extends StatelessWidget {
  final DateTime selectedDate;
  final List<dynamic> showings;
  final dynamic film;
  ShowingTimes({this.showings, this.selectedDate, this.film});

  List<Widget> makeShowingWidgets(showings) {
    List<Widget> textWidgets = new List<Widget>();
    for (int i=0 ; i<showings.length ; i++) {
      DateTime showingTime = DateTime.parse(showings[i]['showing_time']);
      String timeString = new DateFormat.jm().format(showingTime.toLocal());
      var textWidget = Text(timeString,
          style: TextStyle(fontSize: 20));
      textWidgets.add(textWidget);
    }
    return textWidgets;
  }

  @override
  Widget build(context) {
    var selectedDateString =
        new DateFormat.MMMMEEEEd().format(this.selectedDate);

    return Padding(
        padding: EdgeInsets.only(top: 30, bottom: 30),
        child: Column(
          children: <Widget>[
            Text("Showing times for $selectedDateString for ${film['title']}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: this.makeShowingWidgets(this.showings))),
          ],
        ));
  }
}
