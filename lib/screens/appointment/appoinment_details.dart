import 'package:flutter/material.dart';
class AppointmentDetailsScreen extends StatefulWidget {
   var appoinmnetDetailsdata;
  AppointmentDetailsScreen({this.appoinmnetDetailsdata});



  @override
  _AppointmentDetailsScreenState createState() => _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("data is"+widget.appoinmnetDetailsdata["clinic-name"].toString());
  }
  @override
  Widget build(BuildContext context) {
    return AppointmentDetailsScreen();
  }
  Widget AppointmentDetailsScreen(){
    switch(MediaQuery.of(context).orientation){
      case Orientation.landscape:
        return Container();
      case Orientation.portrait:
        return Container();
    }
  }
}
