import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
import 'package:petzola/screens/offers/book_offer_bio_screen.dart';
import 'package:petzola/screens/offers/book_offer_reviews.dart';
import 'package:petzola/screens/offers/book_offer_schedule_screen.dart';
import 'package:petzola/screens/offers/get_offer_payment_screen.dart';
import 'package:petzola/screens/services/service_booking_personal_info_screen.dart';
import 'package:petzola/screens/services/service_booking_personal_info_screen_loggedout.dart';
class PetServiceBookOfferScreen extends StatefulWidget {


  @override
  _PetServiceBookOfferScreenState createState() => _PetServiceBookOfferScreenState();
}

class _PetServiceBookOfferScreenState extends State<PetServiceBookOfferScreen> {
  List<String> profileButton=['Schedule','Bio','Reviews'];
  int _selectedIndex=0;
  bool showContainer=false;
  _onSelected(int i){
    setState(() {
      _selectedIndex=i;
      if(i==0){
        showContainer=false;

      }
      else{
        showContainer=true;
      }
    });

  }
  int _selectedIndexsort = 0;
  Map<String, dynamic> serivicesOption = {'serivicesOption': [
    {
      "details": "15 minutes , Video vet Consultation for Dogs valid for 12 month",
      "price": "AED 250",
      "cutprice": "",
      "status": false,

    },
    {
      "details": "Home Visit Consultation for Dogs.  ",
      "price": "AED 426",
      "cutprice": "AED 500",
      "status": true,

    },



  ]};


  onSharePressed(int i) {
    setState(() {
      _selectedIndexsort = i;
    });
  }
  Widget showSelected(){
    if(_selectedIndex==0){

      return BookOfferScheduleScreen();


    }
    else  if(_selectedIndex==1){

       return BookOffeBioScreen();

    }
    else  if(_selectedIndex==2){
 return BookOfferReviewScreen();


    }


  }

  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return BookOfferScreen();
  }

  Widget BookOfferScreen() {

    switch (MediaQuery.of(context).orientation) {
      case Orientation.landscape:
        double width=MediaQuery.of(context).size.height;
        double height=MediaQuery.of(context).size.width;
        return Scaffold(
          backgroundColor: themeColor2,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomAppBarHome(size: height,title: "Pet Clinic",),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: height*0.025),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height:height*0.02,),

                  VetServiceBookOfferContainer(
                     title1:'Bobby Clark',
                     title2:'Senior Cordiologist And Surgeon',
                     image:'lib/assets/icons/doctoricon.png',
                     title3:'United States Medical College',
                     title4:'426',
                     image2:'lib/assets/icons/appointment_clinic.png',
                      cWidth:width,
                      cHeight: height),
                  SizedBox(height:height*0.03,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height:height*0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0x2000AEEF),

                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(8),
                            child: VariableText(text: getTranslated(context, 'Service Options'), fontsize: 17, fontcolor:themeColor1,),

                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height:height*0.03,),
                  showContainer==true?DelayedDisplay(
                    slidingCurve: Curves.fastLinearToSlowEaseIn,
                    delay: Duration(milliseconds: 200),
                    child:  Row(
                      children: [
                        Expanded(
                          child: Container(
                            height:height*0.13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0x2000AEEF),

                            ),
                            child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start ,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.all(8),
                                  child: VariableText(text: 'Booking Information', fontsize: 17, fontcolor:themeColor1,),

                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex:1,
                                        child: Container(
                                          height: height*0.05,
                                          decoration: BoxDecoration(
                                            color: themeColor2,
                                            border: Border.all(color: themeColor1),
                                            borderRadius:
                                            BorderRadius.circular(10),),
                                          child: Center(child: VariableText(text: 'Cat', fontsize: 11,fontFamily: 'sftr', fontcolor:themeColor1,)),

                                        ),
                                      ),
                                      SizedBox(width: height*0.01,),
                                      Expanded(
                                        flex:3,
                                        child: Container(
                                          height: height*0.05,
                                          decoration: BoxDecoration(
                                            color: themeColor2,
                                            border: Border.all(color: themeColor1),
                                            borderRadius:
                                            BorderRadius.circular(10),),
                                          child: Center(child: VariableText(text: 'General Consultation', fontsize: 11,fontFamily: 'sftr', fontcolor:themeColor1,)),

                                        ),
                                      ),
                                      SizedBox(width: height*0.01,),
                                      Expanded(
                                        flex:2,
                                        child: Container(
                                          height: height*0.05,
                                          decoration: BoxDecoration(
                                            color: themeColor2,
                                            border: Border.all(color: themeColor1),
                                            borderRadius:
                                            BorderRadius.circular(10),),
                                          child: Center(child: VariableText(text: 'Physical Visit ', fontsize: 11,fontFamily: 'sftr', fontcolor:themeColor1,)),

                                        ),
                                      ),

                                    ],
                                  ),
                                )


                              ],
                            ),
                          ),
                        ),
                      ],
                    ),):
                  DelayedDisplay(
                    slidingCurve: Curves.fastLinearToSlowEaseIn,
                    delay: Duration(milliseconds: 200),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: serivicesOption['serivicesOption'].length,
                        itemBuilder: (BuildContext context, index) {
                          return InkWell(
                            onTap: () => onSharePressed(index),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 18,
                                        width: 18,
                                        decoration: BoxDecoration(
                                            color: _selectedIndexsort == index
                                                ? Theme.of(context).primaryColor
                                                : Colors.white,
                                            borderRadius: BorderRadius.circular(50),
                                            border: _selectedIndexsort == index ? Border.all(color: Theme.of(context).primaryColor) : Border.all(color: Color(0xFFB6B6B6))),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                height: 6,
                                                width: 6,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(50),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: height*0.02,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width:width*0.70,                                     child: VariableText(
                                            text: serivicesOption['serivicesOption'][index]['details'],
                                            fontcolor: Color(0xFF2C3E50),
                                            fontsize: 15,
                                            fontFamily: 'sftr',

                                          ),
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              serivicesOption['serivicesOption'][index]['cutprice']!=""? VariableText(
                                                text: serivicesOption['serivicesOption'][index]['cutprice'],
                                                fontcolor: Color(0xFF2C3E50),
                                                fontsize: 15,
                                                fontFamily: 'sftr',
                                                linethrough: true,

                                              ):Container(width: width*0.18,),
                                              SizedBox(width: height*0.01,),

                                              VariableText(
                                                text: serivicesOption['serivicesOption'][index]['price'],
                                                fontcolor: themeColor1,
                                                fontsize: 15,
                                                fontFamily: 'sftr',
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: height*0.02,),

                                  Container(
                                    height: 1,
                                    color: Color(0xff707070),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),

                  SizedBox(height:height*0.03,),
                  Container(
                    child: Row(
                      children: List.generate(profileButton.length, (index) =>
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _onSelected(index);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF8F7F7),
                                    borderRadius:
                                    BorderRadius.circular(15),
                                  ),
                                  child: Container(
                                    height: height*0.06,
                                    width: width*0.62,
                                    decoration: BoxDecoration(
                                        color: _selectedIndex == index
                                            ? Color(0xFF00AEEF)
                                            : Color(0xFFF8F7F7),
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Center(
                                      child: VariableText(
                                          text: getTranslated(context, profileButton[index]),
                                          fontsize: 15,
                                          fontcolor: _selectedIndex == index
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
                  showSelected(),




                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(

            child: Container(
              height: height * 0.10,

              color: themeColor2,

              child: GestureDetector(
                  onTap: () {

                  },
                  child:   Padding(
                    padding:  EdgeInsets.symmetric(vertical: 8,horizontal: 16),

                    child:
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                              buttonHeight: height*0.07,

                              buttonBorderRadius:8,
                              buttonFontSize:height*0.025,
                              buttonColor:themeColor1,
                              buttonTextColor:themeColor2,
                              buttonText: "Book Now ! ( AED 426)",
                              buttonFontFamily:'sfdm',
                              buttonOnTap:(){
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>PetServiceBookPersonalInfoScreen()));  }
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ),
        );
      case Orientation.portrait:
        double height=MediaQuery.of(context).size.height;
        double width=MediaQuery.of(context).size.width;
        return Scaffold(
          backgroundColor: themeColor2,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomAppBarHome(size: height,title: "Pet Clinic",),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: height*0.025),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height:height*0.02,),
                  VetServiceBookOfferContainer(
                      cWidth:width,
                      cHeight: height,
                    title1:'Bobby Clark',
                    title2:'Senior Cordiologist And Surgeon',
                    image:'lib/assets/icons/doctoricon.png',
                    title3:'United States Medical College',
                    title4:'426',
                    image2:'lib/assets/icons/appointment_clinic.png',),
                  SizedBox(height:height*0.03,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height:height*0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0x2000AEEF),

                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(8),
                            child: VariableText(text: getTranslated(context, 'Service Options'), fontsize: 17, fontcolor:themeColor1,),

                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height:height*0.03,),
                  showContainer==true?DelayedDisplay(
                      slidingCurve: Curves.fastLinearToSlowEaseIn,
                      delay: Duration(milliseconds: 200),
                      child:  Row(
                        children: [
                          Expanded(
                            child: Container(
                              height:height*0.13,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0x2000AEEF),

                              ),
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start ,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.all(8),
                                    child: VariableText(text: 'Booking Information', fontsize: 17, fontcolor:themeColor1,),

                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex:1,
                                          child: Container(
                                            height: height*0.05,
                                            decoration: BoxDecoration(
                                              color: themeColor2,
                                              border: Border.all(color: themeColor1),
                                              borderRadius:
                                              BorderRadius.circular(10),),
                                            child: Center(child: VariableText(text: 'Cat', fontsize: 11,fontFamily: 'sftr', fontcolor:themeColor1,)),

                                          ),
                                        ),
                                        SizedBox(width: height*0.01,),
                                        Expanded(
                                          flex:3,
                                          child: Container(
                                            height: height*0.05,
                                            decoration: BoxDecoration(
                                              color: themeColor2,
                                              border: Border.all(color: themeColor1),
                                              borderRadius:
                                              BorderRadius.circular(10),),
                                            child: Center(child: VariableText(text: 'General Consultation', fontsize: 11,fontFamily: 'sftr', fontcolor:themeColor1,)),

                                          ),
                                        ),
                                        SizedBox(width: height*0.01,),
                                        Expanded(
                                          flex:2,
                                          child: Container(
                                            height: height*0.05,
                                            decoration: BoxDecoration(
                                              color: themeColor2,
                                              border: Border.all(color: themeColor1),
                                              borderRadius:
                                              BorderRadius.circular(10),),
                                            child: Center(child: VariableText(text: 'Physical Visit ', fontsize: 11,fontFamily: 'sftr', fontcolor:themeColor1,)),

                                          ),
                                        ),

                                      ],
                                    ),
                                  )


                                ],
                              ),
                            ),
                          ),
                        ],
                      ),):
                  DelayedDisplay(
                    slidingCurve: Curves.fastLinearToSlowEaseIn,
                    delay: Duration(milliseconds: 200),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: serivicesOption['serivicesOption'].length,
                        itemBuilder: (BuildContext context, index) {
                          return InkWell(
                            onTap: () => onSharePressed(index),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 18,
                                        width: 18,
                                        decoration: BoxDecoration(
                                            color: _selectedIndexsort == index
                                                ? Theme.of(context).primaryColor
                                                : Colors.white,
                                            borderRadius: BorderRadius.circular(50),
                                            border: _selectedIndexsort == index ? Border.all(color: Theme.of(context).primaryColor) : Border.all(color: Color(0xFFB6B6B6))),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                height: 6,
                                                width: 6,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(50),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: height*0.02,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width:width*0.70,                                     child: VariableText(
                                              text: serivicesOption['serivicesOption'][index]['details'],
                                              fontcolor: Color(0xFF2C3E50),
                                              fontsize: 15,
                                              fontFamily: 'sftr',

                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              serivicesOption['serivicesOption'][index]['cutprice']!=""? VariableText(
                                                text: serivicesOption['serivicesOption'][index]['cutprice'],
                                                fontcolor: Color(0xFF2C3E50),
                                                fontsize: 15,
                                                fontFamily: 'sftr',
                                                linethrough: true,

                                              ):Container(width: width*0.18,),
                                              SizedBox(width: height*0.01,),

                                              VariableText(
                                                text: serivicesOption['serivicesOption'][index]['price'],
                                                fontcolor: themeColor1,
                                                fontsize: 15,
                                                fontFamily: 'sftr',
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: height*0.02,),

                                  Container(
                                    height: 1,
                                    color: Color(0xff707070),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),

                  SizedBox(height:height*0.03,),
                  Container(
                    child: Row(
                      children: List.generate(profileButton.length, (index) =>
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _onSelected(index);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF8F7F7),
                                    borderRadius:
                                    BorderRadius.circular(15),
                                  ),
                                  child: Container(
                                    height: height*0.06,
                                    decoration: BoxDecoration(
                                        color: _selectedIndex == index
                                            ? Color(0xFF00AEEF)
                                            : Color(0xFFF8F7F7),
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Center(
                                      child: VariableText(
                                          text: getTranslated(context, profileButton[index]),
                                          fontsize: 15,
                                          fontcolor: _selectedIndex == index
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
                  showSelected(),




                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(

            child: Container(
              height: height * 0.10,

              color: themeColor2,

              child: GestureDetector(
                  onTap: () {

                  },
                  child:   Padding(
                    padding:  EdgeInsets.symmetric(vertical: 8,horizontal: 16),

                    child:
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                              buttonHeight: height*0.07,

                              buttonBorderRadius:8,
                              buttonFontSize:height*0.025,
                              buttonColor:themeColor1,
                              buttonTextColor:themeColor2,
                              buttonText: "Book Now! (AED 426)",
                              buttonFontFamily:'sfdm',
                              buttonOnTap:(){
                                isLoggedIn == true ?
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>PetServiceBookPersonalInfoScreen())):
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>PetServiceBookPersonalInfoScreenLoggedOut()));
                              }
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ),
        );
    }
  }


}
