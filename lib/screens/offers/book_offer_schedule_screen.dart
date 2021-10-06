import 'package:flutter/material.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
import 'package:intl/intl.dart';

class BookOfferScheduleScreen extends StatefulWidget {


  @override
  _BookOfferScheduleScreenState createState() => _BookOfferScheduleScreenState();
}

class _BookOfferScheduleScreenState extends State<BookOfferScheduleScreen> with  TickerProviderStateMixin {


  TabController tabViewController;
  TabController tabViewController2;

  List<String> weekDays = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
  List<String> dailyTime = ['08:00Am', '08:30Am', '09:00Am','09:30Am', '10:00Am', '10:30Am',  ];
  List<String> weekDates1 = ['1', '2', '3', '4', '5', '6', '7'];
  List<String> weekDates2 = ['8', '9', '10', '11', '12', '13', '14'];
  List<String> weekDates3 = ['15', '16', '17', '18', '19', '20', '21'];
  List<String> weekDates4 = ['22', '23', '24', '25', '26', '27', '28'];

  int _selectedIndex = 1;
  int _selectedIndexTime = 2;
  double fSize;

  onDaySelected(int i){
    setState(() {
      _selectedIndex = i;
    });

  }
  onTimeSelected(int i){
    setState(() {
      _selectedIndexTime = i;
    });

  }

  DateFormat dateFormatter = DateFormat('MMMM, yyyy');
  DateTime selectedDate = DateTime.now();

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabViewController = TabController(length: 4,vsync: this);
    tabViewController2 = TabController(length: 2,vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.width;
    double width=MediaQuery.of(context).size.height;
    fSize = height / width;
    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        return Column(
          children: [
            SizedBox(height: height*0.03,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VariableText(
                  text: getTranslated(context, 'Select Date & Time'),
                  fontcolor: Color(0xFF2B3E4F),
                  fontsize: 20,
                  fontFamily: 'sftr',
                ),
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
              ],
            ),
            SizedBox(height: height*0.03,),
            //Calender Scroll
            Container(
                height: height * 0.08,
                width: double.infinity,//widget.cWidth,
                //color: Colors.yellow,

                child: TabBarView(
                    controller: tabViewController,
                    //physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      renderWeeks2(weekDates1, height, width),
                      renderWeeks2(weekDates2, height, width),
                      renderWeeks2(weekDates3, height, width),
                      renderWeeks2(weekDates4, height, width),
                    ]
                )
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

            SizedBox(height: 15),

          ],
        );
      case Orientation.portrait:
        double width=MediaQuery.of(context).size.width;
        double height=MediaQuery.of(context).size.height;
        fSize = height / width;
        return Column(
          children: [
            SizedBox(height: height*0.03,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VariableText(
                  text: getTranslated(context, 'Select Date & Time'),
                  fontcolor: Color(0xFF2B3E4F),
                  fontsize: 20,
                  fontFamily: 'sftr',
                ),
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
              ],
            ),
            SizedBox(height: height*0.03,),
            //Calender Scroll
            Container(
                height: height * 0.08,
                width: double.infinity,//widget.cWidth,
                //color: Colors.yellow,

                child: TabBarView(
                    controller: tabViewController,
                    //physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      renderWeeks2(weekDates1, height, width),
                      renderWeeks2(weekDates2, height, width),
                      renderWeeks2(weekDates3, height, width),
                      renderWeeks2(weekDates4, height, width),
                    ]
                )
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


            SizedBox(height: 15),

          ],
        );
    }

  }
  Widget renderWeeks2(List<String> dates, double cHeight, double cWidth){
    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        return Container(
          width: cWidth,
          //color: Colors.red,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(weekDays.length, (index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: InkWell(
                    onTap: (){
                      onDaySelected(index);
                    },
                    child: Container(
                      width: fSize * 45, //cWidth * 0.09,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: _selectedIndex == index ? Color(0xFF00AEEF) : Colors.white,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          VariableText(
                              text: weekDays[index],
                              fontsize: fSize * 5.5,
                              fontcolor: _selectedIndex == index ? Colors.white : Color(0xFF2B3E4F),
                              fontFamily: 'sftr'),
                          SizedBox(height: 5),
                          VariableText(
                              text: dates[index],
                              fontsize: fSize * 5.5,
                              fontcolor: _selectedIndex == index ? Colors.white : Color(0xFF2B3E4F),
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
              children: List.generate(weekDays.length, (index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: InkWell(
                    onTap: (){
                      onDaySelected(index);
                    },
                    child: Container(
                      width: fSize * 20, //cWidth * 0.09,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: _selectedIndex == index ? Color(0xFF00AEEF) : Colors.white,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          VariableText(
                              text: weekDays[index],
                              fontsize: fSize * 5.5,
                              fontcolor: _selectedIndex == index ? Colors.white : Color(0xFF2B3E4F),
                              fontFamily: 'sftr'),
                          SizedBox(height: 5),
                          VariableText(
                              text: dates[index],
                              fontsize: fSize * 5.5,
                              fontcolor: _selectedIndex == index ? Colors.white : Color(0xFF2B3E4F),
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
                return Padding(
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
}