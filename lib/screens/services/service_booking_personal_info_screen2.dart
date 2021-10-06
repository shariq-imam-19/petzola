import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
import 'package:petzola/models/cities_model.dart';
import 'package:petzola/screens/offers/book_offer_bio_screen.dart';
import 'package:petzola/screens/offers/book_offer_reviews.dart';
import 'package:petzola/screens/offers/book_offer_schedule_screen.dart';
import 'package:petzola/screens/offers/get_offer_payment_after_discount_screen.dart';
import 'package:petzola/screens/offers/get_offer_payment_screen.dart';
import 'package:petzola/screens/services/pet_service_payment_after_discount_screen.dart';
import 'package:petzola/screens/services/service_booking_personal_info_screen.dart';
class PetServiceBookPersonalInfoScreen2 extends StatefulWidget {


  @override
  _PetServiceBookPersonalInfoScreen2State createState() => _PetServiceBookPersonalInfoScreen2State();
}

class _PetServiceBookPersonalInfoScreen2State extends State<PetServiceBookPersonalInfoScreen2> {

  TextEditingController dateOfBirth=new TextEditingController();
  DateTime selectedDate = DateTime.now();


  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,

        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dateOfBirth.text=getFormatedDate(selectedDate.toString());
      });
  }
  getFormatedDate(_date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(_date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
  }

  TextEditingController dateOfBirth2=new TextEditingController();
  DateTime selectedDate2 = DateTime.now();


  Future<void> _selectDate2(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,

        initialDate: selectedDate2,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate2)
      setState(() {
        selectedDate2 = picked;
        dateOfBirth2.text=getFormatedDate(selectedDate2.toString());

      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  TimeOfDay timeSelected;
  DateTime dd;
  var pickupStartTime;
  var returnTime;

  launchStartTimePicker()async {
    timeSelected = await showTimePicker(
        context: context,
        //initialTime: _time,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData(
              primaryColor: Color(0xFFC41A3B),
              accentColor: Color(0xFFC41A3B),
              //    primarySwatch: _buttonTextColor,
            ),
            child: MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(alwaysUse24HourFormat: false),
              child: child,
            ),
          );
        });
    if (timeSelected != null)
      setState(() {
      dd = new DateTime(0, 0, 0, timeSelected.hour, timeSelected.minute);
      pickupStartTime = '${dd.hour}:${dd.minute}'.toString();
    });
  }

  launchReturnTimePicker()async {
    timeSelected = await showTimePicker(
        context: context,
        //initialTime: _time,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData(
              primaryColor: Color(0xFFC41A3B),
              accentColor: Color(0xFFC41A3B),
              //    primarySwatch: _buttonTextColor,
            ),
            child: MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(alwaysUse24HourFormat: true),
              child: child,
            ),
          );
        });
    if (timeSelected != null)
      setState(() {
        dd = new DateTime(0, 0, 0, timeSelected.hour, timeSelected.minute);
        returnTime = '${dd.hour}:${dd.minute}'.toString();
      });
  }


  @override
  Widget build(BuildContext context) {
    return BookOfferScreen();
  }

  Widget BookOfferScreen() {

    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        double width=MediaQuery.of(context).size.height;
        double height=MediaQuery.of(context).size.width;
        return Scaffold(
            backgroundColor: themeColor2,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: CustomAppBarHome(size: height,title: "Booking Information",),
            ),
            body:LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child:
                  ConstrainedBox(
                      constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: height*0.025),
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(height: height*0.03,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    VariableText(text: getTranslated(context, "Account Information"),
                                      fontsize: 22,
                                      fontcolor: textColor,
                                      fontFamily: 'sfdb',),
                                  ],
                                ),
                                SizedBox(height: height*0.01,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    VariableText(text: getTranslated(context, "Booking Steps"),
                                      fontsize: 15,
                                      fontcolor: textColor,
                                      fontFamily: 'sftr',),
                                  ],
                                ),
                                SizedBox(height: height*0.02,),
                                Stack(
                                  children: [
                                    Center(
                                      child: Container(
                                        height: height*0.12,
                                        width: height*0.95,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Color(0xffF0F5FC)
                                        ),
                                        child: Column(
                                          children: [
                                            //upper
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 16),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  //image
                                                  Padding(
                                                    padding: EdgeInsets.only(top: 15.0),
                                                    child: Image.asset(
                                                        'lib/assets/images/service2.png',
                                                        scale: 5.3),
                                                  ),
                                                  //name address
                                                  Container(
                                                    margin: EdgeInsets.only(top: height * 0.033),
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          //name & rating
                                                          Row(
                                                            children: [
                                                              VariableText(
                                                                text: 'El Nour',
                                                                fontsize: 17,
                                                                fontcolor: Color(0xFF2C3E50),
                                                              ),
                                                              SizedBox(width: 10,),
                                                              VariableText(
                                                                text: '4.8',
                                                                fontsize: 11,
                                                                fontcolor: Color(0xFF2C3E50),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(
                                                                    top: 0,
                                                                    left: 2.0,
                                                                    right: 2.0,
                                                                    bottom: 5.0),
                                                                child: Image.asset(
                                                                  'lib/assets/icons/appointment_rating.png',
                                                                  scale: 3.2,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          VariableText(
                                                            text: 'Sun, Jan 19, At 08:00Am',
                                                            fontsize: 12,
                                                            fontcolor: Color(0xFF2C3E50),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  //home icon
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(top: height * 0.02,),
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                        color: themeColor2,
                                                        borderRadius: BorderRadius.circular(50),
                                                      ),
                                                      child: Image.asset(
                                                        'lib/assets/icons/appointment_home.png',
                                                        scale: 3.2,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),

                                            //lower

                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(top: height*0.10),
                                      child: Align(alignment: Alignment.bottomCenter,
                                        child: InkWell(
                                          onTap:(){
                                            PersonalBookingMoreInfo( height, height);
                                          },
                                          child: Container(
                                            height: height*0.04,
                                            width:height*0.12,
                                            decoration: BoxDecoration(
                                                color:themeColor1,
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                            child: Center(
                                              child: VariableText(text: getTranslated(context, "More"),
                                                fontsize: 11,
                                                fontcolor: themeColor2,
                                                fontFamily: 'sftsb',),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: height*0.01,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    VariableText(text: getTranslated(context, "Service timing"),
                                      fontsize: 15,
                                      fontcolor: hinttextColor,
                                      fontFamily: 'sftr',),
                                  ],
                                ),
                                SizedBox(height: height*0.01,),
                                Container(
                                  width: height*0.95,
                                  //height: height*0.22,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex:1,
                                            child: Container(
                                              //color: Colors.blue,
                                              child: Padding(
                                                padding:  EdgeInsets.symmetric(horizontal: height*0.025),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    VariableText(text: getTranslated(context, "Pickup Starting Date"),
                                                      fontsize: 12,
                                                      fontcolor: hinttextColor,
                                                      fontFamily: 'sftr',),
                                                    SizedBox(height: height*0.01,),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child:
                                                          RectangluartextFeildWithIcon(
                                                            heights: height*0.06,
                                                            fontsize:height*0.018,
                                                            cont: dateOfBirth,
                                                            enable: false,
                                                            hinttext: "12/01/2021",
                                                            imageIconPath: "lib/assets/icons/calendericon.png",
                                                            keytype: TextInputType.text,
                                                            onTap: (){
                                                              _selectDate(context);



                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: height*0.01,),
                                                    VariableText(text: getTranslated(context, "Return Date"),
                                                      fontsize: 12,
                                                      fontcolor: hinttextColor,
                                                      fontFamily: 'sftr',),
                                                    SizedBox(height: height*0.01,),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child:     RectangluartextFeildWithIcon(

                                                            heights: height*0.06,


                                                            fontsize:height*0.018,
                                                            cont: dateOfBirth2,
                                                            enable: false,
                                                            hinttext: "15/01/2021",
                                                            imageIconPath: "lib/assets/icons/calendericon.png",
                                                            keytype: TextInputType.text,
                                                            onTap: (){
                                                              _selectDate2(context);



                                                            },
                                                          ),

                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: height*0.01,),
                                                    VariableText(text: getTranslated(context, "Number of Days: 3"),
                                                      fontsize: 12,
                                                      fontcolor: Color(0xff666666),
                                                      fontFamily: 'sftr',),

                                                  ],
                                                ),
                                              ),


                                            ),
                                          ),
                                          Expanded(
                                            flex:1,
                                            child: Container(
                                              //color: Colors.blue,
                                              child: Padding(
                                                padding:  EdgeInsets.symmetric(horizontal: height*0.025),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    VariableText(text: getTranslated(context, "Pickup Starting Time"),
                                                      fontsize: 12,
                                                      fontcolor: hinttextColor,
                                                      fontFamily: 'sftr',),
                                                    SizedBox(height: height*0.01,),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: GestureDetector(
                                                            onTap: (){
                                                              launchStartTimePicker();
                                                            },
                                                            child: RectangluartextFeild(
                                                              heights: height*0.06,
                                                              hinttext: pickupStartTime != null ? pickupStartTime.toString() :"-:-- -",
                                                              textlength: 11,
                                                              fontsize: height*0.019,
                                                              keytype: TextInputType.text,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: height*0.01,),
                                                    VariableText(text: getTranslated(context, "Return Time"),
                                                      fontsize: 12,
                                                      fontcolor: hinttextColor,
                                                      fontFamily: 'sftr',),
                                                    SizedBox(height: height*0.01,),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: GestureDetector(
                                                            onTap: (){
                                                              launchReturnTimePicker();
                                                            },
                                                            child: RectangluartextFeild(
                                                              heights: height*0.06,
                                                              hinttext: returnTime != null ? returnTime.toString() :"-:-- -",                                                  textlength: 11,
                                                              fontsize: height*0.019,
                                                              keytype: TextInputType.text,

                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: height*0.01,),
                                                    VariableText(text: getTranslated(context, "Number of Pets: 2"),
                                                      fontsize: 12,
                                                      fontcolor: Color(0xff666666),
                                                      fontFamily: 'sftr',),

                                                  ],
                                                ),
                                              ),


                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),

                                SizedBox(height: height*0.01,),
                                Container(
                                  height: 1,
                                  color: Color(0xff707070),
                                ),

                                SizedBox(height: height*0.01,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    VariableText(text: getTranslated(context, "Pick up Address Details"),
                                      fontsize: 15,
                                      fontcolor: hinttextColor,
                                      fontFamily: 'sftr',),
                                  ],
                                ),
                                SizedBox(height: height*0.0055,),
                                RectangluartextFeild(
                                  heights: height*0.07,
                                  widths: height*0.95,
                                  fontsize: height*0.019,
                                  enable: true,
                                  hinttext: "",
                                  keytype: TextInputType.text,

                                ),

                                SizedBox(height: height*0.02,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    VariableText(text: getTranslated(context, "Destination Address (For Taxi Service)"),
                                      fontsize: 15,
                                      fontcolor: hinttextColor,
                                      fontFamily: 'sftr',),
                                  ],
                                ),
                                SizedBox(height: height*0.0055 ,),
                                RectangluartextFeild(
                                  heights: height*0.07,
                                  widths: height*0.95,
                                  fontsize: height*0.019,
                                  enable: true,
                                  hinttext: "",
                                  keytype: TextInputType.text,

                                ),



                                SizedBox(height: height*0.04,),
                                Padding(
                                  padding:  EdgeInsets.only(bottom: height*0.03),
                                  child:
                                  CustomButton(
                                      buttonHeight: height*0.07,
                                      buttonWidth:height*0.95,
                                      buttonBorderRadius:8,
                                      buttonFontSize:height*0.025,
                                      buttonColor:themeColor1,
                                      buttonTextColor:themeColor2,
                                      buttonText: "Next: Payment ( AED 246)",
                                      buttonFontFamily:'sfdm',
                                      buttonOnTap:(){
                                        Navigator.push(context, MaterialPageRoute(builder: (_)=>PetServicePaymentAfterDiscountScreen()));
                                      }
                                  ),
                                )
                              ]
                          ),
                        ),
                      )
                  )
              );
            })

        );
      case Orientation.portrait:
        double height=MediaQuery.of(context).size.height;
        double width=MediaQuery.of(context).size.width;
        return Scaffold(
            backgroundColor: themeColor2,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: CustomAppBarHome(size: height,title: "Booking Information",),
            ),
            body:LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child:
                  ConstrainedBox(
                      constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: height*0.025),
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(height: height*0.03,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    VariableText(text: getTranslated(context, "Account Information"),
                                      fontsize: 22,
                                      fontcolor: textColor,
                                      fontFamily: 'sfdb',),
                                  ],
                                ),
                                SizedBox(height: height*0.01,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    VariableText(text: getTranslated(context, "Booking Steps"),
                                      fontsize: 15,
                                      fontcolor: textColor,
                                      fontFamily: 'sftr',),
                                  ],
                                ),
                                SizedBox(height: height*0.02,),
                                Stack(
                                  children: [
                                    Center(
                                      child: Container(
                                        height: height*0.12,
                                        width: width*0.90,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Color(0xffF0F5FC)
                                        ),
                                        child: Column(
                                          children: [
                                            //upper
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 16),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  //image
                                                  Padding(
                                                    padding: EdgeInsets.only(top: height * 0.022),
                                                    child: Image.asset(
                                                        'lib/assets/images/service2.png',
                                                        scale: 5.3),
                                                  ),
                                                  //name address
                                                  Container(
                                                    margin: EdgeInsets.only(top: height * 0.038),
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          //name & rating
                                                          Row(
                                                            children: [
                                                              VariableText(
                                                                text: 'El Nour',
                                                                fontsize: 17,
                                                                fontcolor: Color(0xFF2C3E50),
                                                              ),
                                                              SizedBox(width: 10,),
                                                              VariableText(
                                                                text: '4.8',
                                                                fontsize: 11,
                                                                fontcolor: Color(0xFF2C3E50),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.only(
                                                                    top: 0,
                                                                    left: 2.0,
                                                                    right: 2.0,
                                                                    bottom: 5.0),
                                                                child: Image.asset(
                                                                  'lib/assets/icons/appointment_rating.png',
                                                                  scale: 3.2,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          VariableText(
                                                            text: 'Sun, Jan 19, At 08:00Am',
                                                            fontsize: 12,
                                                            fontcolor: Color(0xFF2C3E50),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  //home icon
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.only(top: height * 0.02),
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                        color: themeColor2,
                                                        borderRadius: BorderRadius.circular(50),
                                                      ),
                                                      child: Image.asset(
                                                        'lib/assets/icons/appointment_home.png',
                                                        scale: 3.2,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            //lower
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(top: height*0.10),
                                      child: Align(alignment: Alignment.bottomCenter,
                                        child: InkWell(
                                          onTap:(){
                                            PersonalBookingMoreInfo( height, height);
                                          },
                                          child: Container(
                                            height: height*0.04,
                                            width:height*0.10,
                                            decoration: BoxDecoration(
                                                color:themeColor1,
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Center(
                                              child: VariableText(text: getTranslated(context, "More"),
                                                fontsize: 11,
                                                fontcolor: themeColor2,
                                                fontFamily: 'sftsb',),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: height*0.01,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    VariableText(text: getTranslated(context, "Service timing"),
                                      fontsize: 15,
                                      fontcolor: hinttextColor,
                                      fontFamily: 'sftr',),
                                  ],
                                ),
                                SizedBox(height: height*0.01,),
                                Container(
                                  width: width*0.90,
                                  //height: height*0.24,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex:1,
                                            child: Container(
                                              //color: Colors.blue,
                                              child: Padding(
                                                padding:  EdgeInsets.symmetric(horizontal: height*0.025),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    VariableText(text: getTranslated(context, "Pickup Starting Date"),
                                                      fontsize: 12,
                                                      fontcolor: hinttextColor,
                                                      fontFamily: 'sftr',),
                                                    SizedBox(height: height*0.01,),
                                                    Row(
                                                     // crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Expanded(
                                                          child:
                                                          RectangluartextFeildWithIcon(
                                                            heights: height*0.06,
                                                            fontsize:height*0.017,
                                                            cont: dateOfBirth,
                                                            enable: false,
                                                            hinttext: "12/01/2021",
                                                            imageIconPath: "lib/assets/icons/calendericon.png",
                                                            keytype: TextInputType.text,
                                                            onTap: (){
                                                              _selectDate(context);
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: height*0.01,),
                                                    VariableText(text: getTranslated(context, "Return Date"),
                                                      fontsize: 12,
                                                      fontcolor: hinttextColor,
                                                      fontFamily: 'sftr',),
                                                    SizedBox(height: height*0.01,),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child:     RectangluartextFeildWithIcon(
                                                            heights: height*0.06,
                                                            fontsize:height*0.017, cont: dateOfBirth2,
                                                            enable: false,
                                                            hinttext: "15/01/2021",
                                                            imageIconPath: "lib/assets/icons/calendericon.png",
                                                            keytype: TextInputType.text,
                                                            onTap: (){
                                                              _selectDate2(context);



                                                            },
                                                          ),

                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: height*0.01,),
                                                    VariableText(text: getTranslated(context, "Number of Days: 3"),
                                                      fontsize: 12,
                                                      fontcolor: Color(0xff666666),
                                                      fontFamily: 'sftr',),

                                                  ],
                                                ),
                                              ),


                                            ),
                                          ),
                                          Expanded(
                                            flex:1,
                                            child: Container(
                                              //color: Colors.blue,
                                              child: Padding(
                                                padding:  EdgeInsets.symmetric(horizontal: height*0.025),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    VariableText(text: getTranslated(context, "Pickup Starting Time"),
                                                      fontsize: 12,
                                                      fontcolor: hinttextColor,
                                                      fontFamily: 'sftr',),
                                                    SizedBox(height: height*0.01,),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: GestureDetector(
                                                            onTap: (){
                                                              launchStartTimePicker();
                                                            },
                                                            child: RectangluartextFeild(
                                                              heights: height*0.06,
                                                              hinttext: pickupStartTime != null ? pickupStartTime.toString() :"-:-- -",
                                                              textlength: 11,
                                                              enable: false,
                                                              fontsize: height*0.019,
                                                              keytype: TextInputType.text,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: height*0.01,),
                                                    VariableText(text: getTranslated(context, "Return Time"),
                                                      fontsize: 12,
                                                      fontcolor: hinttextColor,
                                                      fontFamily: 'sftr',),
                                                    SizedBox(height: height*0.01,),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: GestureDetector(
                                                            onTap: (){
                                                              launchReturnTimePicker();
                                                            },
                                                            child: RectangluartextFeild(
                                                              heights: height*0.06,
                                                              hinttext: returnTime != null ? returnTime.toString() :"-:-- -",
                                                              textlength: 11,
                                                              enable: false,
                                                              fontsize: height*0.019,
                                                              keytype: TextInputType.text,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: height*0.01,),
                                                    VariableText(text: getTranslated(context, "Number of Pets: 2"),
                                                      fontsize: 12,
                                                      fontcolor: Color(0xff666666),
                                                      fontFamily: 'sftr',),

                                                  ],
                                                ),
                                              ),


                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),

                                SizedBox(height: height*0.01,),
                                Container(
                                  height: 1,
                                  color: Color(0xff707070),
                                ),

                                SizedBox(height: height*0.01,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    VariableText(text: getTranslated(context, "Pick up Address Details"),
                                      fontsize: 15,
                                      fontcolor: hinttextColor,
                                      fontFamily: 'sftr',),
                                  ],
                                ),
                                SizedBox(height: height*0.0055,),
                                RectangluartextFeild(
                                  heights: height*0.07,
                                  widths: width*0.90,
                                  fontsize: height*0.019,
                                  enable: true,
                                  hinttext: "",
                                  keytype: TextInputType.text,

                                ),

                                SizedBox(height: height*0.02,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    VariableText(text: getTranslated(context, "Destination Address (For Taxi Service)"),
                                      fontsize: 15,
                                      fontcolor: hinttextColor,
                                      fontFamily: 'sftr',),
                                  ],
                                ),
                                SizedBox(height: height*0.0055 ,),
                                RectangluartextFeild(
                                  heights: height*0.07,
                                  widths: width*0.90,
                                  fontsize: height*0.019,
                                  enable: true,
                                  hinttext: "",
                                  keytype: TextInputType.text,
                                ),



                                SizedBox(height: height*0.02,),
                                Padding(
                                  padding:  EdgeInsets.only(bottom: height*0.03),
                                  child:
                                  CustomButton(
                                      buttonHeight: height*0.07,
                                      buttonWidth:width*0.90,
                                      buttonBorderRadius:8,
                                      buttonFontSize:height*0.025,
                                      buttonColor:themeColor1,
                                      buttonTextColor:themeColor2,
                                      buttonText: "Next: Payment ( AED 246)",
                                      buttonFontFamily:'sfdm',
                                      buttonOnTap:(){
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=>PetServicePaymentAfterDiscountScreen()));
                                      }
                                  ),
                                )
                              ]
                          ),
                        ),
                      )
                  )
              );
            })

        );
    }
  }
  void PersonalBookingMoreInfo(double height,double width){
    showModalBottomSheet(
        isScrollControlled: true,
        //transitionAnimationController: controller,
        backgroundColor: Colors.transparent,
        context: context, builder: (context) {

      return DraggableScrollableSheet(
          initialChildSize: 0.75, //set this as you want
          maxChildSize:0.75, //set this as you want
          minChildSize:0.75, //set this as you want
          expand: false,
          builder: (context, scrollController) {
            return PersonalBookingMoreInfoClass(height:height,width:width
              ,onSelect: (temp){
                Navigator.of(context).pop();

              },);
            //whatever you're returning, does not have to be a Container
          }

      );
    });

  }
}
