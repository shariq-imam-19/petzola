import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/global_variables.dart';
import 'package:petzola/common/style.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';

import 'package:petzola/localization/language_constants.dart';
import 'package:petzola/models/reminder.dart';

class MyPetEditReminderScreen extends StatefulWidget {
  var petDetails;
  ReminderModel reminderDetails;

  MyPetEditReminderScreen({this.petDetails, this.reminderDetails});

  @override
  _MyPetEditReminderScreenState createState() => _MyPetEditReminderScreenState();
}

class _MyPetEditReminderScreenState extends State<MyPetEditReminderScreen> with  TickerProviderStateMixin{
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _noteController = new TextEditingController();
  List<String> profileButton=['All','Morning','Night'];
  int _selectedIndex=0;
  bool isSwitched=true;
  List<bool> _selectedIndex1=[];
  bool showAdditional = true;
  _onSelected(int i){
    setState(() {
      _selectedIndex=i;
    });
  }

  _onSelected1(int i){
    if(_selectedIndex1[i] == false) {
      setState(() {
        _selectedIndex1[i] = true;
      });
    }else{
      setState(() {
        _selectedIndex1[i] = false;
      });
    }
  }
  TabController tabViewController;
  TabController tabViewController2;
  ScrollController _scrollController;

  DateFormat dateFormatter = DateFormat('MMMM, yyyy');
  DateFormat monthFormatter = DateFormat('MMMM');

  List<String> weekDays = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
  List<String> weekDates = ['1', '2', '3', '4', '5', '6', '7'];
  List<String> weekDates1 = ['1', '2', '3', '4', '5', '6', '7'];
  List<String> weekDates2 = ['8', '9', '10', '11', '12', '13', '14'];
  List<String> weekDates3 = ['15', '16', '17', '18', '19', '20', '21'];
  List<String> weekDates4 = ['22', '23', '24', '25', '26', '27', '28'];
  List<bool> week1Select = [];
  List<bool> week2Select = [];
  List<bool> week3Select = [];
  List<bool> week4Select = [];

  List<ReminderModel> newReminders = [];

  List<String> dailyTime = ['08:00Am', '08:30Am', '09:00Am','09:30Am', '10:00Am', '10:30Am',  ];

  DateTime selectedDate = DateTime.now();

  int _selectedIndexTime = 1;
  double fSize;
  int datesCount = 0;

  onDaySelected(List<bool> list ,int i){
    if(list[i] == false) {
      setState(() {
        list[i] = true;
        datesCount++;
      });
    }else{
      setState(() {
        list[i] = false;
        datesCount--;
      });
    }
  }
  onTimeSelected(int i){
    setState(() {
      _selectedIndexTime = i;
    });

  }

  saveReminders(){
    for(int i=0; i < week1Select.length; i++){
      if(week1Select[i] == true){
        newReminders.add(ReminderModel(
            date: weekDates1[i],
            time: dailyTime[_selectedIndexTime],
            title: _titleController.text,
            month: monthFormatter.format(selectedDate),
            note: _noteController.text
        ));
      }
    }
    for(int i=0; i < week2Select.length; i++){
      if(week2Select[i] == true){
        newReminders.add(ReminderModel(
            date: weekDates2[i],
            time: dailyTime[_selectedIndexTime],
            title: _titleController.text,
            month: monthFormatter.format(selectedDate),
            note: _noteController.text
        ));
      }
    }
    for(int i=0; i < week3Select.length; i++){
      if(week3Select[i] == true){
        newReminders.add(ReminderModel(
            date: weekDates3[i],
            time: dailyTime[_selectedIndexTime],
            title: _titleController.text,
            month: monthFormatter.format(selectedDate),
            note: _noteController.text
        ));
      }
    }
    for(int i=0; i < week4Select.length; i++){
      if(week4Select[i] == true){
        newReminders.add(ReminderModel(
            date: weekDates4[i],
            time: dailyTime[_selectedIndexTime],
            title: _titleController.text,
            month: monthFormatter.format(selectedDate),
            note: _noteController.text
        ));
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabViewController = TabController(length: 4,vsync: this);
    tabViewController2 = TabController(length: 2,vsync: this);
    _scrollController = ScrollController();
    _selectedIndex1 = List.filled(profileButton.length, false);
    week1Select = List.filled(weekDays.length, false);
    week2Select = List.filled(weekDays.length, false);
    week3Select = List.filled(weekDays.length, false);
    week4Select = List.filled(weekDays.length, false);
    if(weekDates1.contains(widget.reminderDetails.date)){
      for(int i=0; i < weekDates1.length; i++){
        if(weekDates1[i] == widget.reminderDetails.date){
          setState(() {
            week1Select[i] = true;
          });
        }
      }
    }
    if(weekDates2.contains(widget.reminderDetails.date)){
      for(int i=0; i < weekDates2.length; i++){
        if(weekDates2[i] == widget.reminderDetails.date){
          setState(() {
            week2Select[i] = true;
          });
        }
      }
    }
    if(weekDates3.contains(widget.reminderDetails.date)){
      for(int i=0; i < weekDates3.length; i++){
        if(weekDates3[i] == widget.reminderDetails.date){
          setState(() {
            week3Select[i] = true;
          });
        }
      }
    }
    if(weekDates4.contains(widget.reminderDetails.date)){
      for(int i=0; i < weekDates4.length; i++){
        if(weekDates4[i] == widget.reminderDetails.date){
          setState(() {
            week4Select[i] = true;
          });
        }
      }
    }

    _titleController.text = widget.reminderDetails.title;
    _noteController.text = widget.reminderDetails.note;
    if(dailyTime.contains(widget.reminderDetails.time)){
      for(int i=0; i < dailyTime.length; i++){
        if(dailyTime[i] == widget.reminderDetails.time){
          setState(() {
            _selectedIndexTime = i;
          });
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return MyPetAddReminderScreen();
  }


  Widget MyPetAddReminderScreen() {

    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        double width=MediaQuery.of(context).size.height;
        double height=MediaQuery.of(context).size.width;
        fSize = height / width;
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar:renderAppbar(),
          backgroundColor: themeColor2,
          body: Padding(
              padding:  EdgeInsets.symmetric(horizontal:height*0.025),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height*0.03,),
                    VariableText(
                      text: 'Select Date & Time',
                      fontcolor: Color(0xFF2B3E4F),
                      fontsize: 20,
                      fontFamily: 'sftr',
                    ),
                    SizedBox(height: height*0.03,),
                    GestureDetector(
                      onTap: (){
                        _selectDate(context);
                      },
                      child: VariableText(
                        text: dateFormatter.format(selectedDate),
                        fontcolor: Color(0xFF2B3E4F),
                        fontsize: fSize * 7,
                        fontFamily: 'sftr',
                      ),
                    ),
                    SizedBox(height: height*0.03,),
                    //Calender Scroll
                    Container(
                        height: height * 0.08,
                        width: double.infinity,//widget.cWidth,
                        child: TabBarView(
                            controller: tabViewController,
                            //physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              renderWeeks(weekDays, weekDates1, week1Select, height, width),
                              renderWeeks(weekDays, weekDates2, week2Select, height, width),
                              renderWeeks(weekDays, weekDates3, week3Select, height, width),
                              renderWeeks(weekDays, weekDates4, week4Select, height, width),
                            ]
                        )
                    ),
                    SizedBox(height: height*0.03,),
                    Container(
                      child: Row(
                        children: List.generate(profileButton.length, (index) =>
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _onSelected1(index);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF8F7F7),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      height: height*0.06,

                                      decoration: BoxDecoration(
                                          color: _selectedIndex1[index] == true
                                              ? Color(0xFF00AEEF)
                                              : Color(0xFFF8F7F7),
                                          borderRadius: BorderRadius.circular(15)),
                                      child: Center(
                                        child: VariableText(
                                            text: profileButton[index],
                                            fontsize: 15,
                                            fontcolor: _selectedIndex1[index] == true
                                                ? Colors.white
                                                : Color(0xFF2C3E50)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),),
                      ),
                    ),
                    SizedBox(height: height*0.03,),
                    Container(
                      height: height * 0.06,

                      child: ListView.builder(
                          itemCount: dailyTime.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, index) {
                            return  InkWell(
                              onTap: (){
                                onTimeSelected(index);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 0),
                                child:
                                Row(
                                  children: [
                                    Container(

                                      width: fSize * 60,


                                      decoration: BoxDecoration(
                                          color: _selectedIndexTime == index ? Color(0xFF00AEEF) : Colors.white,
                                          border: Border.all(color: _selectedIndexTime == index ? themeColor2:themeColor1 ),
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      child:     Center(
                                        child: VariableText(
                                            text: dailyTime[index],
                                            fontsize: fSize * 5.5,
                                            fontcolor: _selectedIndexTime == index ? Colors.white : themeColor1,
                                            fontFamily: 'sftr'),
                                      ),
                                    ),
                                    SizedBox(width: 6,),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(height: height*0.03,),
                    RectangluartextFeild(
                      heights: height * 0.07,
                      widths: height,
                      cont: _titleController,
                      maxLines: 1,
                      hinttext: getTranslated(context, 'Title'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric( vertical: 10),
                          child: VariableText(
                            text: 'Additional Information',
                            fontcolor: Color(0xFF2B3E4F),
                            fontsize: 20,
                            fontFamily: 'sftr',
                          ),
                        ),
                        InkWell(
                            onTap: (){
                              if(showAdditional == true){
                                setState(() {
                                  showAdditional = false;
                                });
                              }else{
                                setState(() {
                                  showAdditional = true;
                                });
                              }
                            },
                            child: Padding(
                                padding: EdgeInsets.symmetric( vertical: 10),
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF8F9FA),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: showAdditional == true ? Image.asset('lib/assets/icons/vaccination_minus.png', scale: 3.2):
                                  Icon(Icons.add, size: 24,),
                                )
                            )
                        )
                      ],
                    ),
                    showAdditional ?
                    DelayedDisplay(
                      slidingCurve: Curves.fastLinearToSlowEaseIn,
                      delay: Duration(milliseconds: 100),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: RectangluartextFeild(
                              heights: height * 0.14,
                              widths: height,
                              cont: _noteController,
                              maxLines: 4,
                              hinttext: 'Note',
                            ),
                          ),

                        ],
                      ),
                    ): Container(),
                    SizedBox(height: height*0.02,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                              print(isSwitched);
                            });
                          },
                          activeTrackColor: Color(0xff34C759),
                          activeColor:  themeColor2,
                        ),
                        VariableText(text: "Repeat",
                          fontsize: 15,
                          fontcolor: Color(0xff2B3E4F),
                          weight: FontWeight.normal,
                          fontFamily: 'sftr',),

                      ],
                    ),
                    SizedBox(height: height*0.03,),
                    CustomButton(
                        buttonHeight: height*0.07,
                        buttonWidth:height*0.95,
                        buttonBorderRadius:8,
                        buttonFontSize:height*0.025,
                        buttonColor:themeColor1,
                        buttonTextColor:themeColor2,
                        buttonText: "Save Reminder",
                        buttonFontFamily:'sfdm',
                        buttonOnTap:(){
                          //saveReminders();
                          //widget.onSave(newReminders);
                          Navigator.pop(context);
                        }
                    ),
                    SizedBox(height:height*0.01),
                  ],
                ),
              )
          ),
        );
      case Orientation.portrait:
        double height=MediaQuery.of(context).size.height;
        double width=MediaQuery.of(context).size.width;
        fSize = height / width;
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar:renderAppbar(),
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height*0.03,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:16),
                  child: VariableText(
                    text: getTranslated(context, 'Select Date & Time'),
                    fontcolor: Color(0xFF2B3E4F),
                    fontsize: 20,
                    fontFamily: 'sftr',
                  ),
                ),
                SizedBox(height: height*0.03,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:16),
                  child: GestureDetector(
                    onTap: (){
                      _selectDate(context);
                    },
                    child: VariableText(
                      text: dateFormatter.format(selectedDate),
                      fontcolor: Color(0xFF2B3E4F),
                      fontsize: fSize * 7,
                      fontFamily: 'sftr',
                    ),
                  ),
                ),
                SizedBox(height: height*0.03,),
                //Calender Scroll
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:16),
                  child: Container(
                      height: height * 0.08,
                      width: double.infinity,
                      child: TabBarView(
                          controller: tabViewController,
                          children: <Widget>[
                            renderWeeks(weekDays, weekDates1, week1Select, height, width),
                            renderWeeks(weekDays, weekDates2, week2Select, height, width),
                            renderWeeks(weekDays, weekDates3, week3Select, height, width),
                            renderWeeks(weekDays, weekDates4, week4Select, height, width),
                          ]
                      )
                  ),
                ),
                SizedBox(height: height*0.03,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:16),
                  child: Container(
                    child: Row(
                      children: List.generate(profileButton.length, (index) =>
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _onSelected1(index);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Container(
                                  height: height*0.06,
                                  //width: width*0.295,
                                  decoration: BoxDecoration(
                                      color: _selectedIndex1[index] == true
                                          ? Color(0xFF00AEEF)
                                          : Color(0xFFF8F7F7),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: VariableText(
                                        text: getTranslated(context, profileButton[index].toString()),
                                        fontsize: 15,
                                        fontcolor: _selectedIndex1[index] == true
                                            ? Colors.white
                                            : Color(0xFF2C3E50)),
                                  ),
                                ),
                              ),
                            ),
                          ),),
                    ),
                  ),
                ),
                SizedBox(height: height*0.03,),
                Padding(
                  padding: currLang == 'ar' ? EdgeInsets.only(right: 16) : EdgeInsets.only(left: 16),
                  child: Container(
                    height: height * 0.06,
                    child: ListView.builder(
                        itemCount: dailyTime.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          return  InkWell(
                            onTap: (){
                              onTimeSelected(index);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 0),
                              child:
                              Row(
                                children: [
                                  Container(
                                    width: fSize * 60,
                                    decoration: BoxDecoration(
                                        color: _selectedIndexTime == index ? Color(0xFF00AEEF) : Colors.white,
                                        border: Border.all(color: _selectedIndexTime == index ? themeColor2:themeColor1 ),
                                        borderRadius: BorderRadius.circular(12)
                                    ),
                                    child:     Center(
                                      child: VariableText(
                                          text: dailyTime[index],
                                          fontsize: fSize * 5.5,
                                          fontcolor: _selectedIndexTime == index ? Colors.white : themeColor1,
                                          fontFamily: 'sftr'),
                                    ),
                                  ),
                                  SizedBox(width: 6,),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(height: height*0.02,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: RectangluartextFeild(
                    heights: height * 0.07,
                    widths: width,
                    cont: _titleController,
                    maxLines: 1,
                    hinttext: getTranslated(context, 'Title'),
                  ),
                ),
                SizedBox(height: height*0.02,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric( vertical: 10),
                        child: VariableText(
                          text: getTranslated(context, 'Additional Information'),
                          fontcolor: Color(0xFF2B3E4F),
                          fontsize: 20,
                          fontFamily: 'sftr',
                        ),
                      ),
                      InkWell(
                          onTap: (){
                            if(showAdditional == true){
                              setState(() {
                                showAdditional = false;
                              });
                            }else{
                              setState(() {
                                showAdditional = true;
                              });
                            }
                          },
                          child: Padding(
                              padding: EdgeInsets.symmetric( vertical: 10),
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: Color(0xFFF8F9FA),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: showAdditional == true ? Image.asset('lib/assets/icons/vaccination_minus.png', scale: 3.2):
                                Icon(Icons.add, size: 24,),
                              )
                          )
                      )
                    ],
                  ),
                ),
                showAdditional ?
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:16),
                  child: DelayedDisplay(
                    slidingCurve: Curves.fastLinearToSlowEaseIn,
                    delay: Duration(milliseconds: 100),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: RectangluartextFeild(
                            heights: height * 0.14,
                            widths: width,
                            cont: _noteController,
                            maxLines: 4,
                            hinttext: getTranslated(context, 'Note'),
                          ),
                        ),

                      ],
                    ),
                  ),
                ): Container(),
                //SizedBox(height: height*0.01,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      },
                      activeTrackColor: Color(0xff34C759),
                      activeColor:  themeColor2,
                    ),
                    VariableText(text: getTranslated(context, "Repeat"),
                      fontsize: 15,
                      fontcolor: Color(0xff2B3E4F),
                      weight: FontWeight.normal,
                      fontFamily: 'sftr',),

                  ],
                ),

                SizedBox(height:height*0.01),
              ],
            ),
          ),
          /*NestedScrollView(
            controller: _scrollController,
              headerSliverBuilder: (context, value){
                return [
                  SliverToBoxAdapter(child: SizedBox(height: height*0.03,)),
                  SliverToBoxAdapter(child: Padding(
                    padding: EdgeInsets.symmetric(horizontal:16),
                    child: VariableText(
                      text: getTranslated(context, 'Select Date & Time'),
                      fontcolor: Color(0xFF2B3E4F),
                      fontsize: 20,
                      fontFamily: 'sftr',
                    ),
                  )),
                  SliverToBoxAdapter(child: SizedBox(height: height*0.03,)),
                  SliverToBoxAdapter(child: Padding(
                    padding: EdgeInsets.symmetric(horizontal:16),
                    child: GestureDetector(
                      onTap: (){
                        _selectDate(context);
                      },
                      child: VariableText(
                        text: dateFormatter.format(selectedDate),
                        fontcolor: Color(0xFF2B3E4F),
                        fontsize: fSize * 7,
                        fontFamily: 'sftr',
                      ),
                    ),
                  )),
                  SliverToBoxAdapter(child: SizedBox(height: height*0.03,)),
                  SliverToBoxAdapter(child: Padding(
                    padding: EdgeInsets.symmetric(horizontal:16),
                    child: Container(
                        height: height * 0.08,
                        width: double.infinity,
                        child: TabBarView(
                            controller: tabViewController,
                            children: <Widget>[
                              renderWeeks(weekDays, weekDates, week1Select, height, width),
                              renderWeeks(weekDays, weekDates, week2Select, height, width),
                              renderWeeks(weekDays, weekDates, week3Select, height, width),
                              renderWeeks(weekDays, weekDates, week4Select, height, width),
                            ]
                        )
                    ),
                  )),
                  SliverToBoxAdapter(child: SizedBox(height: height*0.03,)),
                  SliverToBoxAdapter(child: Padding(
                    padding: EdgeInsets.symmetric(horizontal:16),
                    child: Container(
                      child: Row(
                        children: List.generate(profileButton.length, (index) =>
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _onSelected1(index);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    height: height*0.06,
                                    //width: width*0.295,
                                    decoration: BoxDecoration(
                                        color: _selectedIndex1[index] == true
                                            ? Color(0xFF00AEEF)
                                            : Color(0xFFF8F7F7),
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Center(
                                      child: VariableText(
                                          text: getTranslated(context, profileButton[index].toString()),
                                          fontsize: 15,
                                          fontcolor: _selectedIndex1[index] == true
                                              ? Colors.white
                                              : Color(0xFF2C3E50)),
                                    ),
                                  ),
                                ),
                              ),
                            ),),
                      ),
                    ),
                  ),),

                ];
              },
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: height*0.03,),
                  Padding(
                    padding: currLang == 'ar' ? EdgeInsets.only(right: 16) : EdgeInsets.only(left: 16),
                    child: Container(
                      height: height * 0.06,
                      child: ListView.builder(
                          itemCount: dailyTime.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, index) {
                            return  InkWell(
                              onTap: (){
                                onTimeSelected(index);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 0),
                                child:
                                Row(
                                  children: [
                                    Container(
                                      width: fSize * 60,
                                      decoration: BoxDecoration(
                                          color: _selectedIndexTime == index ? Color(0xFF00AEEF) : Colors.white,
                                          border: Border.all(color: _selectedIndexTime == index ? themeColor2:themeColor1 ),
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      child:     Center(
                                        child: VariableText(
                                            text: dailyTime[index],
                                            fontsize: fSize * 5.5,
                                            fontcolor: _selectedIndexTime == index ? Colors.white : themeColor1,
                                            fontFamily: 'sftr'),
                                      ),
                                    ),
                                    SizedBox(width: 6,),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(height: height*0.03,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: RectangluartextFeild(
                      heights: height * 0.07,
                      widths: width,
                      maxLines: 1,
                      hinttext: getTranslated(context, 'Title'),
                    ),
                  ),
                  SizedBox(height: height*0.02,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric( vertical: 10),
                          child: VariableText(
                            text: getTranslated(context, 'Additional Information'),
                            fontcolor: Color(0xFF2B3E4F),
                            fontsize: 20,
                            fontFamily: 'sftr',
                          ),
                        ),
                        InkWell(
                            onTap: (){
                              if(showAdditional == true){
                                setState(() {
                                  showAdditional = false;
                                });
                              }else{
                                setState(() {
                                  showAdditional = true;
                                });
                              }
                            },
                            child: Padding(
                                padding: EdgeInsets.symmetric( vertical: 10),
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF8F9FA),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: showAdditional == true ? Image.asset('lib/assets/icons/vaccination_minus.png', scale: 3.2):
                                  Icon(Icons.add, size: 24,),
                                )
                            )
                        )
                      ],
                    ),
                  ),
                  showAdditional ?
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:16),
                    child: DelayedDisplay(
                      slidingCurve: Curves.fastLinearToSlowEaseIn,
                      delay: Duration(milliseconds: 100),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: RectangluartextFeild(
                              heights: height * 0.14,
                              widths: width,
                              maxLines: 4,
                              hinttext: getTranslated(context, 'Note'),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ): Container(),
                  //SizedBox(height: height*0.01,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            print(isSwitched);
                          });
                        },
                        activeTrackColor: Color(0xff34C759),
                        activeColor:  themeColor2,
                      ),
                      VariableText(text: getTranslated(context, "Repeat"),
                        fontsize: 15,
                        fontcolor: Color(0xff2B3E4F),
                        weight: FontWeight.normal,
                        fontFamily: 'sftr',),

                    ],
                  ),
                ],
              ),
            ),
          ),*/
          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:16, vertical: 10),
              child: CustomButton(
                  buttonHeight: height*0.07,
                  //buttonWidth:width*0.90,
                  buttonBorderRadius:8,
                  buttonFontSize:height*0.025,
                  buttonColor:themeColor1,
                  buttonTextColor:themeColor2,
                  buttonText: getTranslated(context, "Save Reminder"),
                  buttonFontFamily:'sfdm',
                  buttonOnTap:(){
                    //saveReminders();
                    //widget.onSave(newReminders);
                    Navigator.pop(context);
                  }
              ),
            ),
          ),
          /*Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.03,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:16),
                child: VariableText(
                  text: getTranslated(context, 'Select Date & Time'),
                  fontcolor: Color(0xFF2B3E4F),
                  fontsize: 20,
                  fontFamily: 'sftr',
                ),
              ),
              SizedBox(height: height*0.03,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:16),
                child: GestureDetector(
                  onTap: (){
                    _selectDate(context);
                  },
                  child: VariableText(
                    text: dateFormatter.format(selectedDate),
                    fontcolor: Color(0xFF2B3E4F),
                    fontsize: fSize * 7,
                    fontFamily: 'sftr',
                  ),
                ),
              ),
              SizedBox(height: height*0.03,),
              //Calender Scroll
              Padding(
                padding: EdgeInsets.symmetric(horizontal:16),
                child: Container(
                    height: height * 0.08,
                    width: double.infinity,
                    child: TabBarView(
                        controller: tabViewController,
                        children: <Widget>[
                          renderWeeks(weekDays, weekDates, week1Select, height, width),
                          renderWeeks(weekDays, weekDates, week2Select, height, width),
                          renderWeeks(weekDays, weekDates, week3Select, height, width),
                          renderWeeks(weekDays, weekDates, week4Select, height, width),
                        ]
                    )
                ),
              ),
              SizedBox(height: height*0.03,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:16),
                child: Container(
                  child: Row(
                    children: List.generate(profileButton.length, (index) =>
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _onSelected1(index);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                height: height*0.06,
                                //width: width*0.295,
                                decoration: BoxDecoration(
                                    color: _selectedIndex1[index] == true
                                        ? Color(0xFF00AEEF)
                                        : Color(0xFFF8F7F7),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: VariableText(
                                      text: getTranslated(context, profileButton[index].toString()),
                                      fontsize: 15,
                                      fontcolor: _selectedIndex1[index] == true
                                          ? Colors.white
                                          : Color(0xFF2C3E50)),
                                ),
                              ),
                            ),
                          ),
                        ),),
                  ),
                ),
              ),
              SizedBox(height: height*0.03,),
              Padding(
                padding: currLang == 'ar' ? EdgeInsets.only(right: 16) : EdgeInsets.only(left: 16),
                child: Container(
                  height: height * 0.06,
                  child: ListView.builder(
                      itemCount: dailyTime.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return  InkWell(
                          onTap: (){
                            onTimeSelected(index);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child:
                            Row(
                              children: [
                                Container(
                                  width: fSize * 60,
                                  decoration: BoxDecoration(
                                      color: _selectedIndexTime == index ? Color(0xFF00AEEF) : Colors.white,
                                      border: Border.all(color: _selectedIndexTime == index ? themeColor2:themeColor1 ),
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  child:     Center(
                                    child: VariableText(
                                        text: dailyTime[index],
                                        fontsize: fSize * 5.5,
                                        fontcolor: _selectedIndexTime == index ? Colors.white : themeColor1,
                                        fontFamily: 'sftr'),
                                  ),
                                ),
                                SizedBox(width: 6,),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
              SizedBox(height: height*0.02,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: RectangluartextFeild(
                  heights: height * 0.07,
                  widths: width,
                  maxLines: 1,
                  hinttext: getTranslated(context, 'Title'),
                ),
              ),
              SizedBox(height: height*0.02,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric( vertical: 10),
                      child: VariableText(
                        text: getTranslated(context, 'Additional Information'),
                        fontcolor: Color(0xFF2B3E4F),
                        fontsize: 20,
                        fontFamily: 'sftr',
                      ),
                    ),
                    InkWell(
                        onTap: (){
                          if(showAdditional == true){
                            setState(() {
                              showAdditional = false;
                            });
                          }else{
                            setState(() {
                              showAdditional = true;
                            });
                          }
                        },
                        child: Padding(
                            padding: EdgeInsets.symmetric( vertical: 10),
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Color(0xFFF8F9FA),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: showAdditional == true ? Image.asset('lib/assets/icons/vaccination_minus.png', scale: 3.2):
                              Icon(Icons.add, size: 24,),
                            )
                        )
                    )
                  ],
                ),
              ),
              showAdditional ?
              Padding(
                padding: EdgeInsets.symmetric(horizontal:16),
                child: DelayedDisplay(
                  slidingCurve: Curves.fastLinearToSlowEaseIn,
                  delay: Duration(milliseconds: 100),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: RectangluartextFeild(
                          heights: height * 0.14,
                          widths: width,
                          maxLines: 4,
                          hinttext: getTranslated(context, 'Note'),
                        ),
                      ),

                    ],
                  ),
                ),
              ): Container(),
              //SizedBox(height: height*0.01,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                      });
                    },
                    activeTrackColor: Color(0xff34C759),
                    activeColor:  themeColor2,
                  ),
                  VariableText(text: getTranslated(context, "Repeat"),
                    fontsize: 15,
                    fontcolor: Color(0xff2B3E4F),
                    weight: FontWeight.normal,
                    fontFamily: 'sftr',),

                ],
              ),

              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:16),
                child: CustomButton(
                    buttonHeight: height*0.07,
                    //buttonWidth:width*0.90,
                    buttonBorderRadius:8,
                    buttonFontSize:height*0.025,
                    buttonColor:themeColor1,
                    buttonTextColor:themeColor2,
                    buttonText: getTranslated(context, "Save Reminder"),
                    buttonFontFamily:'sfdm',
                    buttonOnTap:(){
                      Navigator.pop(context);
                    }
                ),
              ),
              SizedBox(height:height*0.01),
            ],
          ),*/
        );
    }
  }
  Widget renderWeeks(List<String> cDaysList, List<String> cDateList, List<bool> onSelect, double cHeight, double cWidth){
    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        return Container(
          width: cWidth,
          //color: Colors.red,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(cDaysList.length, (index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: InkWell(
                    onTap: (){
                      onDaySelected(onSelect, index);
                    },
                    child: Container(
                      width: fSize * 45, //cWidth * 0.09,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: onSelect[index] == true ? Color(0xFF00AEEF) : Colors.white,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          VariableText(
                              text: cDaysList[index],
                              fontsize: fSize * 5.5,
                              fontcolor: onSelect[index] == true ? Colors.white : Color(0xFF2B3E4F),
                              fontFamily: 'sftr'),
                          SizedBox(height: 5),
                          VariableText(
                              text: cDateList[index],
                              fontsize: fSize * 5.5,
                              fontcolor: onSelect[index] == true ? Colors.white : Color(0xFF2B3E4F),
                              fontFamily: 'sftr'),
                        ],
                      ),
                    ),
                  ),
                );
              })
          ),
        );
      case Orientation.portrait:
        return Container(
          width: cWidth,
          //color: Colors.red,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(cDaysList.length, (index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: InkWell(
                    onTap: (){
                      onDaySelected(onSelect, index);
                    },
                    child: Container(
                      width: fSize * 20, //cWidth * 0.09,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: onSelect[index] == true ? Color(0xFF00AEEF) : Colors.white,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          VariableText(
                              text: cDaysList[index],
                              fontsize: fSize * 5.5,
                              fontcolor: onSelect[index] == true ? Colors.white : Color(0xFF2B3E4F),
                              fontFamily: 'sftr'),
                          SizedBox(height: 5),
                          VariableText(
                              text: cDateList[index],
                              fontsize: fSize * 5.5,
                              fontcolor: onSelect[index] == true ? Colors.white : Color(0xFF2B3E4F),
                              fontFamily: 'sftr'),
                        ],
                      ),
                    ),
                  ),
                );
              })
          ),
        );
    }

  }
  Widget renderScheduleTime(double cHeight, double cWidth){
    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        return Container(
          width: cWidth,

          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(dailyTime.length, (index){
                return
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: InkWell(
                      onTap: (){
                        onTimeSelected(index);
                      },
                      child:
                      Container(

                        width: fSize * 110,

                        decoration: BoxDecoration(
                            color: _selectedIndexTime == index ? Color(0xFF00AEEF) : Colors.white,
                            border: Border.all(color: _selectedIndexTime == index ? themeColor2:themeColor1 ),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child:     Center(
                          child: VariableText(
                              text: dailyTime[index],
                              fontsize: fSize * 5.5,
                              fontcolor: _selectedIndexTime == index ? Colors.white : themeColor1,
                              fontFamily: 'sftr'),
                        ),
                      ),
                    ),
                  );
              })
          ),
        );

      case Orientation.portrait:
        return Container(
          width: cWidth,
          //color: Colors.red,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(dailyTime.length, (index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: InkWell(
                    onTap: (){
                      onTimeSelected(index);
                    },
                    child:
                    Container(

                      width: fSize * 48,

                      decoration: BoxDecoration(
                          color: _selectedIndexTime == index ? Color(0xFF00AEEF) : Colors.white,
                          border: Border.all(color: _selectedIndexTime == index ? themeColor2:themeColor1 ),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child:     Center(
                        child: VariableText(
                            text: dailyTime[index],
                            fontsize: fSize * 5.5,
                            fontcolor: _selectedIndexTime == index ? Colors.white : themeColor1,
                            fontFamily: 'sftr'),
                      ),
                    ),
                  ),
                );
              })
          ),
        );
    }

  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  Widget renderAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      titleSpacing: 0,
      centerTitle: true,
      title: Container(
        child: Wrap(
          children: [
            Image.asset(
              'lib/assets/icons/notification2x.png',
              scale: 2,
            ),
            VariableText(
              text: widget.petDetails['name'],
              fontcolor: Color(0xFF2C3E50),
              fontsize: 17,
              fontFamily: 'sftsb',
            ),
          ],
        ),
      ),
      leading:
      currLang == 'ar' ?
      Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(math.pi),
        child: IconButton(
          icon: Image.asset(
            'lib/assets/icons/appbar_back.png',
            scale: 2.5,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ) :
      IconButton(
        icon: Image.asset(
          'lib/assets/icons/appbar_back.png',
          scale: 2.5,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
