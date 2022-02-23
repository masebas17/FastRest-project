import 'dart:core';
import 'package:fastrest/page/home_page.dart';
import 'package:fastrest/services/reserva_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fastrest/components/rounded_button.dart';
import 'package:fastrest/constants.dart';




class Reserva extends StatefulWidget {
  const Reserva({Key? key}) : super(key: key);

  @override
  State<Reserva> createState() => _ReservaState();
}

class _ReservaState extends State<Reserva> {
  ReservaService reservaService = ReservaService();
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final email = TextEditingController();
  final person = TextEditingController();


  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _focusedDay=DateTime.now();
    _selectedDay= DateTime.now(); 
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(140, 3, 3, 1),
        title: const Text("Reservas"),
      ),
      body:Stack(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(5),
              height: 750,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(140, 3, 3, 1),
                    width: 3,
                  ),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(2),
                  )),
              child: 
      Column(
        children: [
          TableCalendar(
            selectedDayPredicate: (day) => _selectedDay == day,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
                _selectedDay=selectedDay;
              });
            },
            focusedDay: _focusedDay, 
            firstDay: DateTime.now(), 
            lastDay: DateTime.now().add(const Duration(days: 200)),

            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
            setState(() {
            _calendarFormat = format;
             });
            },
            calendarStyle: const CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Color.fromRGBO(140, 3, 3, 1),
                shape: BoxShape.rectangle
              ),
              todayDecoration: BoxDecoration( 
                color: Color.fromRGBO(140, 3, 3, 80),
                shape: BoxShape.rectangle
              )
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: kSecondColor2,
                borderRadius: BorderRadius.circular(5.0), 
              ),
              formatButtonTextStyle: const TextStyle(
                color: Colors.white,
              )
            ),
          ),
           RoundedButton(
              text: "Reserva",
              color: kSecondColor2,
              textColor: Colors.white,
              press: () async {
                await reservaService.create(FirebaseAuth.instance.currentUser!.uid, _selectedDay);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomePage();
                    },
                  ),
                );
              },
            ),
        ],
      )
      ),
      ],
      )  
  );
  }
}