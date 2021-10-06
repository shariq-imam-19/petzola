import 'dart:typed_data';

import 'package:clippy_flutter/triangle.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
import 'package:petzola/screens/services/provider_map_view_screen.dart';
import 'package:petzola/screens/services/vet_consultation_screen.dart';

import 'PetConsultationServiceScreen.dart';
class SelectServiceScreen extends StatefulWidget {

  @override
  _SelectServiceScreenState createState() => _SelectServiceScreenState();
}

class _SelectServiceScreenState extends State<SelectServiceScreen> {

  bool showMap = false;
  Map<String, dynamic> serivices = {'serivices': [
    {
      "name": "D&C Clinic",
      "address": "Al Jumairah Branch",
      "image": "lib/assets/images/service1.png",
      "serivicetype": "Vet Consultation",
      "timming": "Sun,Mon,Tue,Wed  (9:00AM To 10:30PM) Thur,Fri   (4:00PM To 10:30PM)",
      "latitude": "36.2048",
      "longitude": "138.2529"
    },

  {
  "name": "Sw-Vet",
  "address": "Financial Center Branch",
  "image": "lib/assets/images/service2.png",
  "serivicetype": "Pet Grooming",
  "timming": "Sun,Mon,Tue,Wed  (9:00AM To 10:30PM) Thur,Fri   (4:00PM To 10:30PM)",
    "latitude": "56.1304",
    "longitude": "106.3468"
  },
  {
  "name": "Pet clinic",
  "address": "JLT Branch",
  "image": "lib/assets/images/service1.png",
  "serivicetype": "Pet Training",
  "timming": "Sun,Mon,Tue,Wed,Thur. (9:00AM To 10:30PM)",
    "latitude": "51.1657",
    "longitude": "10.4515"
  },
  {
  "name": "D&C Clinic",
  "address": "Al Jumeirah Branch",
  "image": "lib/assets/images/service1.png",
  "serivicetype": "Vet Consultation",
  "timming": "Sun,Mon,Tue,Wed  (9:00AM To 10:30PM) Thur,Fri   (4:00PM To 10:30PM)",
    "latitude": "35.8617",
    "longitude": "104.1954"
  },

    {
      "name": "Sw-Vet",
      "address": "Financial Center Branch",
      "image": "lib/assets/images/service2.png",
      "serivicetype": "Pet Grooming",
      "timming": "Sun,Mon,Tue,Wed  (9:00AM To 10:30PM) Thur,Fri   (4:00PM To 10:30PM)",
      "latitude": "61.5240",
      "longitude": "105.3188"
    },
    {
      "name": "Pet clinic",
      "address": "JLT Branch",
      "image": "lib/assets/images/service1.png",
      "serivicetype": "Pet Training",
      "timming": "Sun,Mon,Tue,Wed,Thur. (9:00AM To 10:30PM)",
      "latitude": "37.0902",
      "longitude": "95.7129"
    },
  ]};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPage();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GroomingServiceScreen();
  }
  Widget GroomingServiceScreen() {

    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        double width=MediaQuery.of(context).size.height;
        double height=MediaQuery.of(context).size.width;
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomAppBarHome(size: height,title: "Care Provider",),
          ),

          backgroundColor: themeColor2,
          body:
          SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:height*0.025),
              child: Column(
                children: [
                  SizedBox(height: height*0.02,),
                  Row(
                    children: [
                      Expanded(
                        child: RectangluartextFeildWithStartIcon(
                          heights: height*0.07,
                          fontsize:height*0.019,
                          hinttext: getTranslated(context, "Find your clinic"),
                          imageIconPath: "lib/assets/icons/searchIcon.png",
                          keytype: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.01,),
                  CustomServiceOptions(
                    sortontap: (){
                      sortService(context,height,width);
                      },
                    mapontap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ProviderMapViewScreen()));
                    },
                    filterontap: (){
                      filterService(context,height,width);
                      },
                  ),

                  SizedBox(height: height*0.01,),
                  ListView.builder(
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


                                  if(index==1){
                                    Navigator.push(context, MaterialPageRoute(builder: (_)=>PetConsultationServiceScreen()));
                                  }

                                  else {
                                    Navigator.push(context, MaterialPageRoute(builder: (_)=>VetConsultationServiceScreen()));
                                  }
                                }

                            ),
                            SizedBox(height: height*0.02,),
                          ],
                        );
                      })



                ],
              ),
            ),
          ),
        );
      case Orientation.portrait:
        double height=MediaQuery.of(context).size.height;
        double width=MediaQuery.of(context).size.width;
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomAppBarHome(size: height,title: "Care Provider",),
          ),

          backgroundColor: themeColor2,
          body:
          Column(
            children: [
              SizedBox(height: height*0.02,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:height*0.025),
                child: Row(

                  children: [
                    Expanded(
                      child: RectangluartextFeildWithStartIcon(
                        heights: height*0.07,
                        fontsize:height*0.019,
                        hinttext: getTranslated(context, "Find your clinic"),
                        imageIconPath: "lib/assets/icons/searchIcon.png",
                        keytype: TextInputType.text,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height*0.01,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:height*0.025),
                child: CustomServiceOptions(
                  sortontap: (){
                    sortService(context,height,width);
                  },
                  title2:showMap ? "List" : "Map",
                  image2:showMap ? 'lib/assets/icons/list.png' : 'lib/assets/icons/location.png',
                  mapontap:(){
                    setState(() {
                      if(showMap == true){
                        showMap = false;
                      }else{
                        showMap = true;
                      }
                    });
                    //Navigator.push(context, MaterialPageRoute(builder: (_)=>ProviderMapViewScreen()));
                  },
                  filterontap: (){
                    filterService(context,height,width);
                  },
                ),
              ),

              SizedBox(height: height*0.01,),

              showMap != true ?
              renderList(height, width) :
              renderMapView(height, width)
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

  Widget renderList(double height,double width){
    return Expanded(
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
                      // Navigator.push(context, MaterialPageRoute(builder: (_)=>VetConsultationServiceScreen()));




                      if(index==1){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>PetConsultationServiceScreen()));
                      }

                      else {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>VetConsultationServiceScreen()));
                      }
                    }

                ),
                SizedBox(height: height*0.02,),
              ],
            );
          }),
    );
  }

  CustomInfoWindowController _customInfoWindowController =
  CustomInfoWindowController();
  BitmapDescriptor icon;
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  LatLng _latLng ;
  initPage() async {
    final Uint8List markerIcon = await getBytesFromAsset('lib/assets/icons/marker.png', 50);
    icon=BitmapDescriptor.fromBytes(markerIcon);
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
  }

  List<Marker> allMarkers = [];
  CameraPosition _animateDesitnation;

  void _onMapCreated(GoogleMapController _cntlr)
  {
    _customInfoWindowController.googleMapController = _cntlr;

    setState(() {
      // add marker
      _latLng = LatLng(double.parse(serivices['serivices'][0]['latitude']), double.parse(serivices['serivices'][0]['longitude']));
      allMarkers.add(Marker(
        markerId: MarkerId('Petzola'),
        //  infoWindow: InfoWindow(title:"Pet Clinic" ),
        draggable: false,
        icon: icon,
        position: LatLng(double.parse(serivices['serivices'][0]['latitude']), double.parse(serivices['serivices'][0]['longitude'])),
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
                              VariableText(text: serivices['serivices'][0]['name'], fontsize: 11,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),
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
      _animateDesitnation = CameraPosition(
          bearing: 0.00,
          target: _latLng,
          zoom: 5.00);
      _customInfoWindowController.googleMapController.animateCamera(CameraUpdate.newCameraPosition(_animateDesitnation));

    });

  }


  Widget renderMapView(double height,double width){
    return Flexible(
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
            zoomControlsEnabled: false,
            markers: Set.from(allMarkers),
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 75,
            width: 150,
            offset: 20,
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: height * 0.29,
                child: MapSlider(myPets: serivices['serivices'], cHeight: height, cWidth: width,
                  onChange: (index){
                    _latLng = LatLng(double.parse(serivices['serivices'][index]['latitude']), double.parse(serivices['serivices'][index]['longitude']));
                    _animateDesitnation = CameraPosition(
                        bearing: 0.00,
                        target: _latLng,
                        zoom: 5.00);
                  print(index);
                  allMarkers.clear();
                  _customInfoWindowController.hideInfoWindow();
                  _customInfoWindowController.googleMapController.animateCamera(CameraUpdate.newCameraPosition(_animateDesitnation));
                  setState(() {
                    allMarkers.add(Marker(
                      markerId: MarkerId('Petzola'),
                      //  infoWindow: InfoWindow(title:"Pet Clinic" ),
                      draggable: false,
                      icon: icon,
                      position: LatLng(double.parse(serivices['serivices'][index]['latitude']), double.parse(serivices['serivices'][index]['longitude'])),
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
                                            VariableText(text: serivices['serivices'][index]['name'], fontsize: 11,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),
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
                  },
                ),
                /*ListView.builder(
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount:serivices['serivices'].length,
                    itemBuilder: (BuildContext context, index){
                      return ServiceContainer(
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

                      );
                    }),*/
              ),
            ),
          )
        ],
      ),
    );
  }


}



