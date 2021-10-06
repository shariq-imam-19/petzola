import 'package:clippy_flutter/triangle.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
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
import 'package:petzola/screens/services/vet_consultation_screen.dart';
//import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
class ProviderMapViewScreen extends StatefulWidget {

  @override
  _ProviderMapViewScreenState createState() => _ProviderMapViewScreenState();
}

class _ProviderMapViewScreenState extends State<ProviderMapViewScreen> {
  CustomInfoWindowController _customInfoWindowController =
  CustomInfoWindowController();

  Map<String, dynamic> serivices = {'serivices': [
    {
      "name": "D&C Clinic",
      "address": "Al Jumeirah Branch",
      "image": "lib/assets/images/service1.png",
      "serivicetype": "Vet Consultation  ",
      "timming": "Sun,Mon,Tue,Wed  (9:00AM To 10:30PM) Thur,Fri   (4:00PM To 10:30PM)",

    },
/*
    {
      "name": "Sw-Vet",
      "address": "Financial Center Branch",
      "image": "lib/assets/images/service2.png",
      "serivicetype": "Pet Grooming  ",
      "timming": "Sun,Mon,Tue,Wed  (9:00AM To 10:30PM) Thur,Fri   (4:00PM To 10:30PM)",

    },
   {
      "name": "Petclinic",
      "address": "JLT Branch",
      "image": "lib/assets/images/service1.png",
      "serivicetype": "Pet Trainning",
      "timming": "Sun,Mon,Tue,Wed,Thur. (9:00AM To 10:30PM)",

    },
    {
      "name": "D&C Clinic",
      "address": "Al Jumeirah Branch",
      "image": "lib/assets/images/service1.png",
      "serivicetype": "Vet Consultation  ",
      "timming": "Sun,Mon,Tue,Wed  (9:00AM To 10:30PM) Thur,Fri   (4:00PM To 10:30PM)",

    },

    {
      "name": "Sw-Vet",
      "address": "Financial Center Branch",
      "image": "lib/assets/images/service2.png",
      "serivicetype": "Pet Grooming  ",
      "timming": "Sun,Mon,Tue,Wed  (9:00AM To 10:30PM) Thur,Fri   (4:00PM To 10:30PM)",

    },
    {
      "name": "Petclinic",
      "address": "JLT Branch",
      "image": "lib/assets/images/service1.png",
      "serivicetype": "Pet Trainning",
      "timming": "Sun,Mon,Tue,Wed,Thur. (9:00AM To 10:30PM)",

    },*/
  ]};

  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  final LatLng _latLng = LatLng(24.9196427,67.0950946);
  GoogleMapController _controller;
  Location _location = Location();
  String lat,long,add1,add2="";
  dynamic currentTime,endTime;
  BitmapDescriptor icon;
  @override
   initState()  {
    super.initState();
    initPage();


  }
  initPage() async {
    final Uint8List markerIcon = await getBytesFromAsset('lib/assets/icons/marker.png', 50);
    icon=BitmapDescriptor.fromBytes(markerIcon);
  }
  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }



  // List for storing markers
  List<Marker> allMarkers = [];
  void _onMapCreated(GoogleMapController _cntlr)
  {
    _customInfoWindowController.googleMapController = _cntlr;

    setState(() {
      // add marker
      allMarkers.add(Marker(
          markerId: MarkerId('Petzola'),
        //  infoWindow: InfoWindow(title:"Pet Clinic" ),
          draggable: false,
          icon: icon,
          position: LatLng(24.9196427,67.0950946),
        onTap: () {
          _customInfoWindowController.addInfoWindow(
            Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('lib/assets/icons/appointment_clinic.png', scale: 2.2),

                          SizedBox(
                            width: 8.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              VariableText(text: 'El Nour', fontsize: 11,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),
                              VariableText(text: '3Min From You', fontsize: 8,fontFamily: 'sftr', fontcolor:hinttextColor,),

                            ],
                          )
                        ],
                      ),
                    ),

                  ),
                ),
                Triangle.isosceles(
                  edge: Edge.BOTTOM,
                  child: Container(
                    color: Colors.white,
                    width: 20.0,
                    height: 10.0,
                  ),
                ),
              ],
            ),
            _latLng,
          );
        },

      ));
    });

    }


  @override
  Widget build(BuildContext context) {
    return ProviderMapViewScreen();
  }
  Widget ProviderMapViewScreen() {

    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        double width=MediaQuery.of(context).size.height;
        double height=MediaQuery.of(context).size.width;
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomMenuAppBar(size: height,title: "Care Provider",),
          ),

          backgroundColor: themeColor2,
          body:
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height*0.02,),
                Padding(padding:EdgeInsets.symmetric(horizontal: height*0.025) ,
                  child:    Row(
                    children: [
                      Expanded(
                        child: RectangluartextFeildWithStartIcon(
                          heights: height*0.07,
                          fontsize:height*0.019,
                          hinttext: "Find your clinic",
                          imageIconPath: "lib/assets/icons/searchIcon.png",
                          keytype: TextInputType.text,
                        ),
                      ),
                    ],
                  ),),
                SizedBox(height: height*0.01,),
                CustomServiceOptions(
                  title2:"List",
                  image2:'lib/assets/icons/list.png',
                  sortontap: (){
                    sortService(context,height,width);
                    },
                  filterontap: (){
                    filterService(context,height,width);
                  },
                ),

                SizedBox(height: height*0.01,),
                Container(
                  height: width,
                  child:  Stack(
                    children: [
                      GoogleMap(
                        onTap: (position) {
                          _customInfoWindowController.hideInfoWindow();
                        },
                        onCameraMove: (position) {
                          _customInfoWindowController.onCameraMove();
                        },
                        initialCameraPosition: CameraPosition(target: _initialcameraposition),
                        mapType: MapType.normal,
                        onMapCreated: _onMapCreated,
                        myLocationEnabled: true,
                        markers: Set.from(allMarkers),







                      ),
                      CustomInfoWindow(
                        controller: _customInfoWindowController,
                        height: 75,
                        width: 150,
                        offset: 50,
                      ),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: height*0.025,vertical: 8),
                          child: ListView.builder(
                              physics: ScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount:serivices['serivices'].length,
                              itemBuilder: (BuildContext context, index){
                                return  Column(
                                  children: [
                                    ServiceContainer(
                                        cWidth:width,
                                        cHeight: height,
                                        name:serivices['serivices'][index]['name'],
                                        address:serivices['serivices'][index]['address'],
                                        image:serivices['serivices'][index]['image'],
                                        serivicetype:serivices['serivices'][index]['serivicetype'],
                                        timming:serivices['serivices'][index]['timming'],
                                        ontapBookNow:(){
                                          Navigator.push(context, MaterialPageRoute(builder: (_)=>VetConsultationServiceScreen()));

                                          if(index==0){
                                            Navigator.push(context, MaterialPageRoute(builder: (_)=>VetConsultationServiceScreen()));
                                          }

                                          if(index==1){
                                            print("Ali");}

                                          else if(index==2){
                                            print("Ali aslam");}
                                        }

                                    ),
                                    SizedBox(height: height*0.02,),
                                  ],
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                ),




              ],
            ),
          ),
        );
      case Orientation.portrait:
        double height=MediaQuery.of(context).size.height;
        double width=MediaQuery.of(context).size.width;
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomMenuAppBar(size: height,title: "Care Provider",),
          ),

          backgroundColor: themeColor2,
          body:
          Column(
            children: [
              SizedBox(height: height*0.02,),
           Padding(padding:EdgeInsets.symmetric(horizontal: height*0.025) ,
           child:    Row(
             children: [
               Expanded(
                 child: RectangluartextFeildWithStartIcon(
                   heights: height*0.07,
                   fontsize:height*0.019,
                   hinttext: "Find your clinic",
                   imageIconPath: "lib/assets/icons/searchIcon.png",
                   keytype: TextInputType.text,
                 ),
               ),
             ],
           ),),
              SizedBox(height: height*0.01,),
              CustomServiceOptions(
                title2:"List",
               image2:'lib/assets/icons/list.png',
                sortontap: (){
                  sortService(context,height,width);
                  },
                filterontap: (){
                  filterService(context,height,width);
                },
              ),

              SizedBox(height: height*0.01,),
              Flexible(
                child: Stack(
                  children: [
                    GoogleMap(
                      onTap: (position) {
                        _customInfoWindowController.hideInfoWindow();
                      },
                      onCameraMove: (position) {
                        _customInfoWindowController.onCameraMove();
                      },
                      initialCameraPosition: CameraPosition(target: _initialcameraposition),
                      mapType: MapType.normal,
                      onMapCreated: _onMapCreated,
                      myLocationEnabled: true,
                      markers: Set.from(allMarkers),




                    ),
                    CustomInfoWindow(
                      controller: _customInfoWindowController,
                      height: 75,
                      width: 150,
                      offset: 50,
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: height*0.025,vertical: 8),
                        child: MapSlider(myPets: serivices['serivices'], cHeight: height, cWidth: width),
                        /*child: ListView.builder(
                            physics: ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount:serivices['serivices'].length,
                            itemBuilder: (BuildContext context, index){
                              return  Column(
                                children: [
                                  ServiceContainer(
                                      cWidth:width,
                                      cHeight: height,
                                      name:serivices['serivices'][index]['name'],
                                      address:serivices['serivices'][index]['address'],
                                      image:serivices['serivices'][index]['image'],
                                      serivicetype:serivices['serivices'][index]['serivicetype'],
                                      timming:serivices['serivices'][index]['timming'],
                                      ontapBookNow:(){
                                        Navigator.push(context, MaterialPageRoute(builder: (_)=>VetConsultationServiceScreen()));

                                        if(index==0){
                                          Navigator.push(context, MaterialPageRoute(builder: (_)=>VetConsultationServiceScreen()));
                                        }

                                        if(index==1){
                                          print("Ali");}

                                        else if(index==2){
                                          print("Ali aslam");}
                                      }

                                  ),
                                  SizedBox(height: height*0.02,),
                                ],
                              );
                            }),*/
                      ),
                    )
                  ],
                ),
              ),




            ],
          ),
        );
    }
  }

  sortService(BuildContext context, double height,double width){
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (BuildContext context) {
          return SortServiceSheet(cHeight: height, cWidth: width, onNext: (){Navigator.of(context).pop();});
        });
  }
  filterService(BuildContext context, double height,double width){
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (BuildContext context) {
          return FilterServiceSheet(cHeight: height, cWidth: width, onNext: (){Navigator.of(context).pop();});
        });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
  }



}



