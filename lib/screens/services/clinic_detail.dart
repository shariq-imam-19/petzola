import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';
import 'dart:ui' as ui;

class ClinicDetails extends StatefulWidget {
  @override
  _ClinicDetailsState createState() => _ClinicDetailsState();
}

class _ClinicDetailsState extends State<ClinicDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPage();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    switch (MediaQuery.of(context).orientation) {
      case Orientation.landscape:
        return Scaffold(
          backgroundColor: themeColor2,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomAppBarHome(
              size: height,
              title: "Clinic Details",
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  renderTop(width, width),
                  SizedBox(height: 10,),
                  renderDetails(width, width),
                ],
              ),
            ),
          ),
        );
      case Orientation.portrait:
        return Scaffold(
          backgroundColor: themeColor2,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomAppBarHome(
              size: height,
              title: "Clinic Details",
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  renderTop(height, width),
                  SizedBox(height: 10,),
                  renderDetails(height, width),
                ],
              ),
            ),
          ),
        );
    }
  }

  Widget renderTop(double height, double width) {
    return Container(
      height: height * 0.28,
      width: width,
      margin: EdgeInsets.only(top: height * 0.03),
      //color: Colors.red,
      child: Stack(
        children: [
          Container(
            height: height * 0.20,
            width: width,
            child: Image.asset(
                'lib/assets/images/clinicDetailsImage.png', fit: BoxFit.fill,),
          ), //Ellipse101.png
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: height * 0.15,
                //color: Colors.yellow,
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Image.asset('lib/assets/icons/Ellipse101.png',
                            scale: 3.5)),
                    Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                            'lib/assets/images/clinicDetailsLogo.png',
                            scale: 3.5)),
                  ],
                )),
          )
        ],
      ),
    );
  }

  Widget renderDetails(double height, double width) {
    return Column(
      children: [
        VariableText(
          text: 'United State Medical College',
          fontsize: height * 0.027,
          fontFamily: 'sfdr',
          fontcolor: Color(0xFF2C3E50),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VariableText(
              text: '4.8',
              fontsize: height * 0.022,
              fontFamily: 'sfdr',
              fontcolor: Color(0xFF2C3E50),
            ),
            SizedBox(
              width: 5,
            ),
            Image.asset(
              'lib/assets/icons/appointment_rating.png',
              scale: 2.2,
            )
          ],
        ),
        SizedBox(height: height * 0.04),
        VariableText(
          textAlign: TextAlign.center,
          text:
              'Pellentesque Tincidunt Tristique Neque, Eget Venenatis Enim Gravida Quis. Fusce At Egestas Libero. Cras Convallis Egestas Ullamcorper.',
          max_lines: 5,
          fontsize: height * 0.018,
          fontFamily: 'sfdr',
          fontcolor: Color(0xFF2C3E50),
        ),
        SizedBox(height: height * 0.03),
        Container(
            height: height * 0.22,
            width: width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition:
                        CameraPosition(target: _initialcameraposition),
                    markers: Set.from(allMarkers),
                    mapType: MapType.normal,
                    onMapCreated: _onMapCreated,
                    zoomControlsEnabled: false,
                    myLocationEnabled: false,
                  ),
                ],
              ),
            )),
        SizedBox(height: height * 0.03),
        Row(
          children: [
            VariableText(
              text: 'Services',
              fontsize: height * 0.026,
              fontFamily: 'sfdr',
              fontcolor: Color(0xFF2C3E50),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    /*Navigator.push(context, MaterialPageRoute(builder: (_)=>SelectServiceScreen()));*/
                  },
                  child: Container(
                    height: height * 0.17,
                    width: height * 0.12,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: Color(0x5000AEEF),
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      'lib/assets/images/service_grooming.png',
                      scale: 2.8,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.008),
                  child: VariableText(
                    text: 'Grooming',
                    fontsize: height * 0.016,
                    fontcolor: Color(0xFF2C3E50),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    /*Navigator.push(context, MaterialPageRoute(builder: (_)=>SelectServiceScreen()));*/
                  },
                  child: Container(
                    height: height * 0.17,
                    width: height * 0.12,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: Color(0x5000AEEF),
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      "lib/assets/images/service_daycare.png",
                      scale: 2.8,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.008),
                  child: VariableText(
                    text: 'Day Care',
                    fontsize: height * 0.016,
                    fontcolor: Color(0xFF2C3E50),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    /*Navigator.push(context, MaterialPageRoute(builder: (_)=>SelectServiceScreen()));*/
                  },
                  child: Container(
                    height: height * 0.17,
                    width: height * 0.12,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: Color(0x5000AEEF),
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      "lib/assets/images/service_dental.png",
                      scale: 2.8,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.008),
                  child: VariableText(
                    text: 'Dental',
                    fontsize: height * 0.016,
                    fontcolor: Color(0xFF2C3E50),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20,)
      ],
    );
  }

  GoogleMapController _controller;
  LatLng _initialcameraposition = LatLng(43.052845, 74.363762);
  List<Marker> allMarkers = [];
  BitmapDescriptor icon;

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    setState(() {
      allMarkers.add(
        Marker(
            markerId: MarkerId('Petzola'),
            draggable: false,
            icon: icon,
            position: _initialcameraposition),
      );
    });

    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: _initialcameraposition, zoom: 12),
      ),
    );
  }

  initPage() async {
    final Uint8List markerIcon = await getBytesFromAsset(
        'lib/assets/icons/clinicDetailsLocation.png', 65);
    icon = BitmapDescriptor.fromBytes(markerIcon);
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }
}
