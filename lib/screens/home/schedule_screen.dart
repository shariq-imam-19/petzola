import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/common/commons.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';

class ScheduleScreen extends StatefulWidget {

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {

  Map<String, dynamic> appointments = {'appointments': [{
    'January': [
      {
        "doctor-name": "Benjamin Hudson",
        "specilaist":"Senior Cordiologist And Surgeon",
        "clinic-name": "United States Medical College",
        "rating": "4.8",
        "date": "Sun, Jan 19, At 08:00Am",
        "image": "lib/assets/images/appointment_doctor.png"
      },
      {
        "doctor-name": "Clarke Kent",
        "clinic-name": "California Medical College",
        "rating": "3.7",
        "date": "Fri, Jan 02, At 12:00Pm",
        "image": "lib/assets/images/appointment_doctor2.png"
      },
    ]
  },
    {
      'February': [
        {
          "doctor-name": "Peter Max",

          "clinic-name": "LA Medical College",
          "rating": "4.9",
          "date": "Sat, Jan 18, At 07:45Am",
          "image": "lib/assets/images/appointment_doctor2.png"
        },
        {
          "doctor-name": "John Wick",
          "clinic-name": "Ghotki Medical College",
          "rating": "3.7",
          "date": "Wed, Feb 02, At 05:30",
          "image": "lib/assets/images/appointment_doctor.png"
        },
      ]
    }
  ]};
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    switch (MediaQuery.of(context).orientation) {
      case Orientation.landscape:
        return SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(height: 10,),
                  AppointmentsAll(appointmentList: appointments['appointments'],
                      cWidth: size.width,
                      cHeight: size.width),
                ]
            )
        );
      case Orientation.portrait:
        return SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(height: 10,),
                  AppointmentsAll(appointmentList: appointments['appointments'],
                      cWidth: size.width,
                      cHeight: size.height),
                ]
            )
        );
    }
  }
}
