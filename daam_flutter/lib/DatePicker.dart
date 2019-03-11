import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:intl/intl.dart';
import 'store/Actions.dart';
import 'store/AppState.dart';

class DatePicker extends StatelessWidget {
  final DateTime currentDate;
  final Store<AppState> store;
  DatePicker(this.currentDate, this.store);

  @override
  Widget build(BuildContext context) {
    var selectedDateString = new DateFormat.MMMMEEEEd().format(this.store.state.selectedDate);
    return GestureDetector(
        child: 
        Padding(
          padding: EdgeInsets.only(top:10),
        child: Text("I want to watch on $selectedDateString", style: TextStyle(fontSize: 17, color: Colors.blue))
        ),
        onTap: () {
          this.getDate(context, this.store);
        });
  }

  void getDate(BuildContext context, Store<AppState> store) {
    DateTime today = DateTime.now();
    showDatePicker(
      context: context,
      initialDate: today,
      firstDate: today.subtract(new Duration(minutes: 1)),
      lastDate: today.add(new Duration(days: 30)))
    .then((DateTime dateSelected) =>
      store.dispatch({
        'type':Actions.SET_SELECTED_DATE, 
        'date':dateSelected
        })
        );
  }
}