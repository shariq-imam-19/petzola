import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petzola/common/common_z.dart';
import 'package:location/location.dart';
import 'package:petzola/common/style.dart';
class BookOffeBioScreen extends StatefulWidget {


  @override
  _BookOffeBioScreenState createState() => _BookOffeBioScreenState();
}

class _BookOffeBioScreenState extends State<BookOffeBioScreen> {
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  GoogleMapController _controller;
  Location _location = Location();


  void _onMapCreated(GoogleMapController _cntlr)
  {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude),zoom: 15),
        ),
      );
      void yourFunction() async {
      }
      yourFunction();

    });}
  @override
  Widget build(BuildContext context) {

    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        double height=MediaQuery.of(context).size.width;
        double width=MediaQuery.of(context).size.height;
        return Container(
          child: DelayedDisplay(
            slidingCurve: Curves.fastLinearToSlowEaseIn,
            delay: Duration(milliseconds: 200),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15,),
                    VariableText(text: "About", fontsize: 15, fontcolor: Color(0xff000000),
                      fontFamily: 'sftsb',),
                    SizedBox(height: 10,),
                    VariableText(text: "Pellentesque tincidunt tristique neque, eget venenatis enim gravida quis. Fusce at egestas libero. Cras convallis egestas ullamcorper.", fontsize: 11, fontcolor: Color(0xff2C3E50),
                      fontFamily: 'sftr',),
                    SizedBox(height: 15,),
                    VariableText(text: "Location", fontsize: 15, fontcolor: Color(0xff000000),
                      fontFamily: 'sftsb',),
                    SizedBox(height: 10,),
                    Container(
                        height: height*0.30,
                        width: height,
                        child:
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            children: [
                              GoogleMap(
                                initialCameraPosition: CameraPosition(target: _initialcameraposition),

                                mapType: MapType.normal,
                                onMapCreated: _onMapCreated,

                                myLocationEnabled: true,


                              ),
                            ],
                          ),
                        )

                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );

      case Orientation.portrait:
        double width=MediaQuery.of(context).size.width;
        double height=MediaQuery.of(context).size.height;
      return Container(
        child: DelayedDisplay(
          slidingCurve: Curves.fastLinearToSlowEaseIn,
          delay: Duration(milliseconds: 200),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),
                  VariableText(text: "About", fontsize: 15, fontcolor: Color(0xff000000),
                    fontFamily: 'sftsb',),
                  SizedBox(height: 10,),
                  VariableText(text: "Pellentesque tincidunt tristique neque, eget venenatis enim gravida quis. Fusce at egestas libero. Cras convallis egestas ullamcorper.", fontsize: 11, fontcolor: Color(0xff2C3E50),
                    fontFamily: 'sftr',),
                  SizedBox(height: 15,),
                  VariableText(text: "Location", fontsize: 15, fontcolor: Color(0xff000000),
                    fontFamily: 'sftsb',),
                  SizedBox(height: 10,),
                  Container(
                      height: height*0.30,
                      width: width,


                      child:
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          children: [
                            GoogleMap(
                              initialCameraPosition: CameraPosition(target: _initialcameraposition),

                              mapType: MapType.normal,
                              onMapCreated: _onMapCreated,

                              myLocationEnabled: true,


                            ),
                          ],
                        ),
                      )

                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      );

    }


  }
}
