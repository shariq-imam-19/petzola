import 'dart:ui';

import 'package:petzola/common/common_z.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:petzola/common/commons.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/my_pets/add_vaccination.dart';
import 'package:petzola/my_pets/mypets_profile.dart';

//import 'package:bottom_drawer/bottom_drawer.dart';

class MyPetProfile extends StatefulWidget {
  var petDetails;

  MyPetProfile({this.petDetails});

  @override
  _MyPetProfileState createState() => _MyPetProfileState();
}

class _MyPetProfileState extends State<MyPetProfile> with SingleTickerProviderStateMixin /*TickerProviderStateMixin*/{
  TabController tabViewController;
  //BottomDrawerController _controller = BottomDrawerController();
  ScrollController _scrollController;

  bool fixedScroll;

  List<String> tabs = ['lib/assets/icons/myPets_tab1.png',
    'lib/assets/icons/myPets_tab2.png',
    'lib/assets/icons/myPets_tab3.png',
    'lib/assets/icons/myPets_tab4.png',
    'lib/assets/icons/myPets_tab5.png'];

  List<String> shareOptions = ['Main Profile', 'Medical Profile', 'Social Profile'];
  int _selectedIndexShare = 0;

  int _selectedIndex = 0;
  String _groupValue = 'pets';

  onSharePressed(int i){
    setState(() {
      _selectedIndexShare = i;
    });
  }

  onTabPressed(int i){
    setState(() {
      _selectedIndex = i;
      tabViewController.animateTo(i);
    });
  }

  _scrollListener() {
    if (fixedScroll) {
      _scrollController.jumpTo(0);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabViewController = TabController(length: tabs.length, vsync: this);
    tabViewController.index = _selectedIndex;
    _scrollController = ScrollController();
    //_scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    switch (MediaQuery.of(context).orientation) {
      case Orientation.landscape:
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: renderAppbar(),
          body: NestedScrollView(
            controller: _scrollController,
              headerSliverBuilder: (context, value){
                return [
                    SliverToBoxAdapter(child:renderBasicDetails(size.width, size.width, 0.75)),
                    SliverToBoxAdapter(child:renderCharacteristic(size.width * 0.10, size.width)),
                    SliverToBoxAdapter(child:SizedBox(height: 15)),
                    SliverToBoxAdapter(child:renderTabs(size.width * 0.11, size.width)),
                ];
              },
            body: renderTabView(size.width * 0.11, size.height, size.width, size.height)

          ),
        );
      case Orientation.portrait:
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: renderAppbar(),
            body: NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder: (context, value){
                return [
                  SliverToBoxAdapter(child: renderBasicDetails(size.height, size.width, 0.32)),
                  SliverToBoxAdapter(child: renderCharacteristic(size.height * 0.09, size.width),),
                  SliverToBoxAdapter(child: SizedBox(height: 15),),
                  SliverToBoxAdapter(child: renderTabs(size.height * 0.11, size.width),),
                ];
              },
              body: renderTabView(size.height * 0.11, size.width, size.height, size.width)
              ),
        );
    }
  }

  /*@override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    switch (MediaQuery.of(context).orientation) {
      case Orientation.landscape:
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: renderAppbar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                renderBasicDetails(size.height * 0.60, size.width),
                renderCharacteristic(size.width * 0.10, size.width),
                SizedBox(height: 15),
                renderTabs(size.width * 0.11, size.width),
                renderTabView(size.width * 0.11, size.height),
              ],
            ),
          ),
        );
      case Orientation.portrait:
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: renderAppbar(),
          body: SingleChildScrollView(
              child: Column(
                children: [
                  renderBasicDetails(size.height * 0.20, size.width),
                  renderCharacteristic(size.height * 0.09, size.width),
                  SizedBox(height: 15),
                  renderTabs(size.height * 0.11, size.width),
                  renderTabView(size.height * 0.11, size.width),
                ],
              ),
            )
        );
    }
  }*/

  Widget renderBasicDetails(var cHeight, var cWidth, double size){
    return Container(
      height: cHeight * 0.20,
      width: cWidth,
      //color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Container(
                //height: cHeight,
                width: cHeight * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  image: DecorationImage(
                    image: AssetImage(widget.petDetails['image']),
                    fit: BoxFit.fill,
                  ),
                )
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: VariableText(text: widget.petDetails['name'], fontcolor: Color(0xFF2B3E4F), fontsize: 20, fontFamily: 'sftsb',),
              ),
              VariableText(text: widget.petDetails['characteristic'], fontcolor: Color(0xFF2B3E4F), fontsize: 11, fontFamily: 'sftsb',),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> PetsProfile(petDetails: widget.petDetails)));

                  },
                  child: Container(
                    height: cHeight * 0.04,
                    width: cHeight * 0.12,
                    decoration: BoxDecoration(
                        color: Color(0xFF00AEEF),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: VariableText(text: 'View Profile', fontsize: 15, fontcolor: Colors.white),),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          InkWell(
            onTap: (){
              MediaQuery.of(context).orientation == Orientation.portrait ?
              selectShareOptionsP(cHeight, cWidth, size) : selectShareOptionsL(cWidth, cWidth, size);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Color(0xFFF0F5FC)
                ),
                child: Image.asset('lib/assets/icons/myPets_share.png', scale: 3.2,),
              ),
            ),
          ),
          
        ],
      ),
    );
  }

  Widget renderCharacteristic(var cHeight, var cWidth){
    return Container(
        height: cHeight,
        width: cWidth,
        margin: EdgeInsets.symmetric(horizontal: 16),
        //color: Colors.red,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xffE8E8E8))
        ),
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VariableText(text: widget.petDetails['gender'], fontcolor: Color(0xFF2B3E4F), fontsize: 13, fontFamily: 'sftsb',),
              SizedBox(height: 5),
              VariableText(text: 'Gender', fontcolor: Color(0x603C3C43), fontsize: 11, fontFamily: 'sftsb',),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VariableText(text: widget.petDetails['age'], fontcolor: Color(0xFF2B3E4F), fontsize: 13, fontFamily: 'sftsb',),
              SizedBox(height: 5),
              VariableText(text: 'Age', fontcolor: Color(0x603C3C43), fontsize: 11, fontFamily: 'sftsb',),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VariableText(text: widget.petDetails['color'], fontcolor: Color(0xFF2B3E4F), fontsize: 13, fontFamily: 'sftsb',),
              SizedBox(height: 5),
              VariableText(text: 'Color', fontcolor: Color(0x603C3C43), fontsize: 11, fontFamily: 'sftsb',),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VariableText(text: widget.petDetails['weight'], fontcolor: Color(0xFF2B3E4F), fontsize: 13, fontFamily: 'sftsb',),
              SizedBox(height: 5),
              VariableText(text: 'Weight', fontcolor: Color(0x603C3C43), fontsize: 11, fontFamily: 'sftsb',),
            ],
          )
        ]
        )
    );
  }

  Widget renderTabs(var cHeight, var cWidth){
    return Container(
        height: cHeight,
        width: cWidth,
        //color: Colors.red,
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(tabs.length, (index){
              return InkWell(
                onTap: (){
                  onTabPressed(index);
                },
                child: Container(
                  height: cHeight * 0.72,
                  width: 62,
                  margin: _selectedIndex == index ? EdgeInsets.only(bottom: 10) : EdgeInsets.only(bottom: 0),
                  decoration: BoxDecoration(
                      color: _selectedIndex == index ? Color(0xFF00AEEF) : Color(0xFFF0F5FC),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Image.asset(tabs[index], scale: 3.2,
                    color: _selectedIndex == index ? Colors.white : Color(0xFF646060)),
                ),
              );
            })
        )
    );
  }

  Widget renderTabView(var cHeight, var cWidth, var fHeight, var fWidth){
    return TabBarView(
      controller: tabViewController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
            child: MyPetsReminder(cHeight: cHeight, cWidth: cWidth, fHeight: fHeight, fWidth: fWidth,)),
        SingleChildScrollView(
          //physics: NeverScrollableScrollPhysics(),
          child: MyPetsVaccination(cHeight: cHeight, cWidth: cWidth,
            onAddVacc: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> AddVaccination(petDetails: widget.petDetails, cHeight: cHeight, cWidth: cWidth,)));
            },),
        ),
        SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: MyAppointments(cHeight: cHeight, cWidth: cWidth, onAddAppointment: (){
            selectAppointmentOptions(cHeight, cWidth);
          },),
        ),
        SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: MyMedical(cHeight: cHeight, cWidth: cWidth)),
        SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: MyCare(cHeight: cHeight, cWidth: cWidth)),
      ],
    );

  }

  Widget renderAppbar(){
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      titleSpacing: 0,
      centerTitle: true,
      leadingWidth: 65,
      title: VariableText(text: 'My Pets', fontcolor: Color(0xFF2C3E50), fontsize: 17, fontFamily: 'sftsb',),
      leading: Container(
        margin: EdgeInsets.only(left: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFEAF0F9),
                borderRadius: BorderRadius.circular(60)
            ),
            child: IconButton(icon: Image.asset('lib/assets/icons/appbar_back.png', scale: 3.2,),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ),
      actions: [
        InkWell(
          onTap: (){},
          child: SizedBox(
            width: 26,
            child: Image.asset("lib/assets/icons/notification2x.png"),
          ),
        ),
        SizedBox(width: 12),
        InkWell(
          onTap: () {},
          child: SizedBox(
            width: 26,
            child: Image.asset("lib/assets/icons/chat2x.png"),
          ),
        ),
        SizedBox(width: 16,),
      ],
    );
  }

  selectShareOptionsP(double height,double width, double size){
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context, builder: (context) {

      return DraggableScrollableSheet(
          initialChildSize: 0.32, //set this as you want
          maxChildSize:0.75, //set this as you want
          minChildSize:0.30, //set this as you want
          expand: false,
          builder: (context, scrollController) {
            return ShareBottomSheet(cHeight: height, cWidth: width,);
            //whatever you're returning, does not have to be a Container
          }

      );
    });
  }

  selectShareOptionsL(double height,double width, double size){
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context, builder: (context) {

      return DraggableScrollableSheet(
          initialChildSize: 0.75, //set this as you want
          maxChildSize:0.75, //set this as you want
          minChildSize:0.30, //set this as you want
          expand: false,
          builder: (context, scrollController) {
            return ShareBottomSheet(cHeight: height, cWidth: width,);
            //whatever you're returning, does not have to be a Container
          }

      );
    });
  }


  selectAppointmentOptions(double height,double width){
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context, builder: (context) {

      return DraggableScrollableSheet(
          initialChildSize: MediaQuery.of(context).orientation == Orientation.portrait ? 0.45 : 0.75,
          maxChildSize:0.75,
          minChildSize:0.35,
          expand: false,
          builder: (context, scrollController) {
            return AppointmentBottomSheet(cHeight: height* 0.80, cWidth: width,);
          }

      );
    });
  }

}
