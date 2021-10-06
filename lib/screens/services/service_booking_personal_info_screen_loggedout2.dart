import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
import 'package:petzola/models/cities_model.dart';
import 'package:petzola/screens/offers/book_offer_bio_screen.dart';
import 'package:petzola/screens/offers/book_offer_reviews.dart';
import 'package:petzola/screens/offers/book_offer_schedule_screen.dart';
import 'package:petzola/screens/offers/get_offer_payment_screen.dart';
import 'package:petzola/screens/onboarding_screens/onboarding_screen3.dart';
import 'package:petzola/screens/services/service_booking_personal_info_screen.dart';
import 'package:petzola/screens/services/service_booking_personal_info_screen2.dart';
class PetServiceBookPersonalInfoScreenLoggedOut2 extends StatefulWidget {


  @override
  _PetServiceBookPersonalInfoScreenLoggedOut2State createState() => _PetServiceBookPersonalInfoScreenLoggedOut2State();
}

class _PetServiceBookPersonalInfoScreenLoggedOut2State extends State<PetServiceBookPersonalInfoScreenLoggedOut2> {

  List<String> gender=["Male","Female"];
  int genderSelected=0;

  _onselected(int i){
    setState(() {
      genderSelected=i;
    });
  }

  TextEditingController dateOfBirth=new TextEditingController();

  DateTime selectedDate = DateTime.now();
  var tempdate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,

        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        tempdate=selectedDate.toString().split(" ")[0];
        dateOfBirth.text=tempdate;
      });
  }

  List<City> cities=[];
  City sel_cities;
  String selectedCityCode="002";
  Map<String, dynamic> citiesJson =
  {
    "cities": [
      {"image": "lib/assets/icons/egypt.png",
        "code": "110",
      },
      {"image":  "lib/assets/icons/united-arab-emirates.png",
        "code": "111",},
      {"image": "lib/assets/icons/egypt.png",
        "code": "110",
      },
      {"image":  "lib/assets/icons/united-arab-emirates.png",
        "code": "111",}
    ]

  };


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(var item in citiesJson["cities"]){
      cities.add(City.fromJson(item));

    }
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
        return Scaffold
          (
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
                                SizedBox(height: height*0.02,),
                                renderAddPetDetails(height, width),
                                SizedBox(height: height*0.02,),
                                Spacer(),
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
                                      buttonText: "Next : Service Details (AED426)",
                                      buttonFontFamily:'sfdm',
                                      buttonOnTap:(){
                                        Navigator.push(context, MaterialPageRoute(builder: (_)=>PetServiceBookPersonalInfoScreen()));
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
                          padding:  EdgeInsets.symmetric(horizontal: 16),
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
                                SizedBox(height: height*0.02,),
                                renderAddPetDetails(height, width),
                                Spacer(),
                                Padding(
                                  padding:  EdgeInsets.only(bottom: height*0.02),
                                  child:
                                  CustomButton(
                                      buttonHeight: height*0.07,
                                      buttonWidth:width*0.90,
                                      buttonBorderRadius:8,
                                      buttonFontSize:height*0.025,
                                      buttonColor:themeColor1,
                                      buttonTextColor:themeColor2,
                                      buttonText: "Next",
                                      buttonFontFamily:'sfdm',
                                      buttonOnTap:(){
                                        Navigator.push(context, MaterialPageRoute(builder: (_)=>PetServiceBookPersonalInfoScreen()));
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

  Widget renderNotLoggedIn(var height){
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: height * 0.08,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Color(0x60F47920),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 3,
                        child: VariableText(text:'Log In To The Petzola Account For Faster Booking!',fontcolor: Color(0xFFF47920), max_lines: 2, fontFamily: "sftr",fontsize: height*0.018,)),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.white
                            ),
                            child: Image.asset('lib/assets/icons/forward_arrow.png', scale: 3.8),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: height*0.03,),
        Row(
          children: [
            Expanded(
              child: RectangluartextFeild(
                //cont: _nameController,
                heights: 60,
                maxLines: 1,
                hinttext: "Your Name",
              ),
            ),
          ],
        ),
        SizedBox(height: height*0.01,),
        Row(
          children: [
            Expanded(
              child: RectangluartextFeild(
                //cont: _nameController,
                heights: 60,
                maxLines: 1,
                hinttext: "Your Email",
              ),
            ),
          ],
        ),

        /*
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      VariableText(text: "Mobile Number *",
                                        fontsize: 15,
                                        fontcolor: hinttextColor,
                                        fontFamily: 'sftr',),
                                    ],
                                  ),
                                  SizedBox(height: height*0.01,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // SizedBox(width: height*0.015,),
                                      Container(
                                        height: height*0.07,
                                        width: width*0.15,
                                        decoration: BoxDecoration(
                                          color: Color(0xffF5F8FA),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child:  DropdownButtonHideUnderline(
                                            child: DropdownButton<City>(
                                                value: sel_cities,
                                                icon: Visibility (visible:false, child: Icon(Icons.arrow_downward)),

                                                hint: Padding(
                                                  padding:  EdgeInsets.only(left:height*0.015),
                                                  child: Image.asset("lib/assets/icons/egypt.png",scale: 4.5,),
                                                ) ,
                                                isExpanded: true,
                                                onChanged: (City city) async{
                                                  setState(() {
                                                    sel_cities=city;
                                                    selectedCityCode=city.code;
                                                  });
                                                },
                                                items: cities.map<DropdownMenuItem<City>>((City item) {
                                                  return DropdownMenuItem<City>(
                                                    value: item,
                                                    child: Padding(
                                                      padding:  EdgeInsets.only(left:height*0.015),
                                                      child: Image.asset(item.toString(),scale: 4.5,) ,


                                                    ),
                                                  );
                                                }).toList()
                                            )),


                                      ),
                                      SizedBox(width: height*0.02,),

                                      Expanded(
                                        child: Container(
                                          height: height*0.07,
                                          //width: width*0.60,
                                          decoration: BoxDecoration(
                                            color: Color(0xffF5F8FA),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child:
                                          Padding(
                                            padding:  EdgeInsets.symmetric(horizontal:height*0.015),
                                            child: TextFormField(
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(10),
                                              ],
                                              style:        TextStyle(
                                                fontSize: height*0.019,
                                                fontFamily: 'sftr',

                                                color:  Color(0xff3C3C43,),),
                                              // onChanged: enableBtn ,
                                              // controller: _numController2,
                                              keyboardType: TextInputType.number,
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return 'Please enter Number';
                                                } else {
                                                  return null;
                                                }
                                              },
                                              decoration: InputDecoration(
                                                fillColor: Color(0xffF5F8FA),
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,

                                                hintText: '01030891060',
                                                contentPadding: EdgeInsets.only(top: height*0.0050, bottom: 0, left: height*0.1),
                                                hintStyle:
                                                TextStyle(
                                                    fontSize: height*0.019,
                                                    fontFamily: 'sftr',

                                                    color: Color(
                                                      0x6c3C3C43,
                                                    )),
                                                prefixIcon:
                                                Padding(
                                                  padding:  EdgeInsets.only(left: height*0.01,right: height*0.01),
                                                  child: Text(

                                                    '+$selectedCityCode',
                                                    style:
                                                    TextStyle(
                                                        fontSize: height*0.019,
                                                        fontFamily: 'sftr',

                                                        color: Color(
                                                          0xff2B3E4F,

                                                        )),
                                                  ),
                                                ),
                                                prefixIconConstraints:
                                                BoxConstraints(minWidth: 0, minHeight: 0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height*0.02,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      VariableText(text: "Pick up Address Details",
                                        fontsize: 15,
                                        fontcolor: hinttextColor,
                                        fontFamily: 'sftr',),
                                    ],
                                  ),
                                  SizedBox(height: height*0.01,),
                                  RectangluartextFeildWithIcon(
                                    heights: height*0.075,
                                    widths: width*0.90,

                                    fontsize: height*0.019,
                                    enable: true,
                                    hinttext: "12 wasat  street",
                                    imageIconPath: "lib/assets/icons/gotomap.png",
                                    keytype: TextInputType.text,

                                  ),

                                  SizedBox(height: height*0.02,),
                                  Container(
                                    height: height*0.12,
                                    width: width*0.95,
                                    decoration: BoxDecoration(
                                      color: Color(0xffF5F8FA),
                                      borderRadius: BorderRadius.circular(8),

                                    ),
                                    child:  Padding(
                                      padding: const EdgeInsets.only(right: 8.0,top: 8,bottom: 8,left: 20),
                                      child: TextFormField(

                                        style: TextStyle(
                                          fontSize:  height*0.018,
                                          color: Color(0xff3C3C43,),
                                          fontFamily: 'sftr',

                                        ),
                                        // onChanged: onChanged,
                                        //   controller: cont,
                                        keyboardType: TextInputType.text,

                                        decoration: InputDecoration(
                                          fillColor: Color(0xffF5F8FA),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none, hintText: "notes",
                                          hintStyle: TextStyle(
                                              fontSize:  height*0.018,
                                              fontFamily: 'sftr',

                                              color: Color(
                                                0x6c3C3C43,
                                              )),
                                        ),
                                      ),
                                    ) ,


                                  ),
                                  SizedBox(height: height*0.01,),*/
      ],
    );
  }


  Widget renderAddPetDetails(var height, var width){
    return Column(
      children: [
        VariableText(text: getTranslated(context, 'One Step For Ordering'), textAlign: TextAlign.center, fontcolor: Colors.black, max_lines: 2, fontFamily: "sftr",fontsize: height*0.026,),
        SizedBox(height: height*0.02,),
        Center(
          child: Container(
            child: CircleAvatar(
              radius: height*0.08,
              backgroundColor: Color(0xffEAF0F9),
              backgroundImage: AssetImage('lib/assets/icons/dog.png'),
            ),
          ),
        ),
        SizedBox(height: height*0.02,),
        VariableText(text:'Hello Senba', textAlign: TextAlign.center, fontcolor: Colors.black, max_lines: 1, fontFamily: "sftr",fontsize: height*0.022,),

        SizedBox(height: height*0.02,),
        Row(
          children:
          List.generate(gender.length, (index){
            return Expanded(
              child: Row(
                children: [
                  index == 1 ? SizedBox(width: width*0.02,) : Container(),

                  Expanded(
                    child: CustomButton(
                        buttonHeight: height*0.07,
                        buttonBorderRadius:4,
                        buttonFontSize:height*0.020,
                        buttonColor: genderSelected==index?themeColor1:Color(0xffF5F8FA),
                        buttonTextColor: genderSelected==index?themeColor2:Color(0xff2B3E4F),
                        buttonText: getTranslated(context, gender[index].toString()),
                        buttonFontFamily:'sftr',
                        buttonOnTap:(){
                          _onselected(index);
                        }
                    ),
                  ),
                  index == 0 ? SizedBox(width: width*0.02,) : Container()
                  //SizedBox(width: width*0.03,),
                ],
              ),
            );

          }
          ),
        ),
        SizedBox(height: height*0.01,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: RectangluartextFeildWithIcon(
                heights: height*0.07,
                //widths:width*0.40,
                fontsize:height*0.020,
                cont: dateOfBirth,
                enable: false,
                hinttext: getTranslated(context, "Birthdate"),
                imageIconPath: "lib/assets/icons/calendericon.png",
                keytype: TextInputType.text,
                onTap: (){
                  _selectDate(context);
                },
              ),
            ),
            SizedBox(width: width*0.04,),
            Expanded(
              child: RectangluartextFeildWithIcon(
                heights: height*0.07,
                //widths: width*0.40,
                fontsize: height*0.019,
                enable: true,
                hinttext: getTranslated(context, "Weight"),
                imageIconPath: "lib/assets/icons/kgicon.png",
                keytype: TextInputType.number,
                onTap: (){


                },
              ),
            ),



          ],
        ),

      ],
    );
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
class PersonalBookingMoreInfoClass extends StatefulWidget {
  final double height,width;

  Function onSelect;
  PersonalBookingMoreInfoClass({this.height,this.width,this.onSelect});


  @override
  _PersonalBookingMoreInfoClassState createState() => _PersonalBookingMoreInfoClassState();
}

class _PersonalBookingMoreInfoClassState extends State<PersonalBookingMoreInfoClass> {

  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft:Radius.circular(widget.height*0.05) ,
              topRight: Radius.circular(widget.height*0.05)
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: widget.height*0.025),
            child: Column(
              children: [
                SizedBox(height: widget.height*0.03,),
                VariableText(text: "Booking Information",
                  fontsize: widget.height*0.028,
                  fontcolor: Color(0xff2B3E4F),
                  fontFamily: 'sfdr',),
                SizedBox(height: widget.height*0.03,),
                Center(
                  child: Container(
                    child: CircleAvatar(
                      radius: widget.height*0.08,
                      backgroundColor: Color(0xffEAF0F9),
                      backgroundImage: AssetImage('lib/assets/icons/dog.png'),
                    ),
                  ),
                ),
                SizedBox(height: widget.height*0.01,),
                VariableText(text: "Senba",
                  fontsize:20,
                  fontcolor: Color(0xff2B3E4F),
                  fontFamily: 'sftr',),

                SizedBox(height: widget.height*0.02,),
                Row(
                  children: [
                    Expanded(
                      flex:1,
                      child: Padding(
                        padding:  EdgeInsets.only(left: widget.height*0.025),
                        child:   Container(

                          // padding: EdgeInsets.only(top: 16, bottom: 16),

                          decoration: BoxDecoration(
                            // color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //upper
                              Container(


                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //image
                                    Padding(
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: Image.asset(
                                          'lib/assets/images/service2.png',
                                          scale: 3.3),
                                    ),
                                    //name address
                                    Container(

                                      child: Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(top: widget.height * 0.038),
                                                  child: VariableText(
                                                    text: 'El Nour',
                                                    fontsize: 17,
                                                    fontcolor: Color(0xFF2C3E50),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: widget.height * 0.038, left: 10.0),
                                                  child: VariableText(
                                                    text: '4.8',
                                                    fontsize: 11,
                                                    fontcolor: Color(0xFF2C3E50),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: widget.height * 0.038,
                                                      left: 2.0,
                                                      bottom: 5.0),
                                                  child: Image.asset(
                                                    'lib/assets/icons/appointment_rating.png',
                                                    scale: 3.2,
                                                    color: Color(0xff707070),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox( height: widget.height*0.0055,),
                                            VariableText(text: 'Senior Cordiologist And Surgeon', fontsize: widget.height*0.015, fontFamily:'sftr',fontcolor: Color(0x3c3C3C43),),
                                            SizedBox( height: widget.height*0.0055,),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only( right:  widget.height*0.01),

                                                  child:  VariableText(text: 'Perth:', fontsize:  widget.height*0.017,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),
                                                ),
                                                VariableText(text: 'El Metro', fontsize:  widget.height*0.017,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Spacer(),
                                                VariableText(text: '351', fontsize: widget.height*0.030,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                                                SizedBox(width: widget.height*0.0050,),
                                                Column(
                                                  children: [
                                                    SizedBox(height: widget.height*0.03,),
                                                    VariableText(text: 'Eg', fontsize: widget.height*0.017,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                                  ],
                                                )

                                              ],
                                            ),


                                          ],
                                        ),
                                      ),
                                    ),
                                    //home icon

                                  ],
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),),
                  ],
                ),
                SizedBox(height: widget.height*0.02,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:widget.height*0.025 ),
                  child: Row(
                    children: [
                      Expanded(
                        flex:1,
                        child: Container(
                          height: widget.height*0.05,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: themeColor2,
                              border: Border.all(color: Color(0xffE8E8E8))
                          ),
                          child: Center(
                            child:    VariableText(text: "Dog",
                              fontsize: 11,
                              fontcolor:textColor,
                              fontFamily: 'sfdm',),
                          ),
                        ),),
                      SizedBox(width: widget.height*0.01,),
                      Expanded(
                        flex:2,
                        child: Container(
                          height: widget.height*0.05,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: themeColor2,
                              border: Border.all(color: Color(0xffE8E8E8))
                          ),
                          child: Center(
                            child:    VariableText(text: "Consulation",
                              fontsize: 11,
                              fontcolor:textColor,
                              fontFamily: 'sfdm',),
                          ),
                        ),),
                      SizedBox(width: widget.height*0.01,),
                      Expanded(
                        flex:2,
                        child: Container(
                          height: widget.height*0.05,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: themeColor2,
                              border: Border.all(color: Color(0xffE8E8E8))
                          ),
                          child: Center(
                            child:    VariableText(text: "Physical Visit ",
                              fontsize: 11,
                              fontcolor:textColor,
                              fontFamily: 'sfdm',),
                          ),
                        ),),

                    ],
                  ),
                ),

                SizedBox(height: widget.height*0.02,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:widget.height*0.025 ),
                  child: Row(
                    children: [
                      Expanded(
                        flex:2,
                        child: Container(
                          height: widget.height*0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffF0F5FC),

                          ),
                          child: Center(
                            child:    VariableText(text: "Sun, Jan 19, At 08:00Am",
                              fontsize: 13,
                              fontcolor:textColor,
                              fontFamily: 'sfdm',),
                          ),
                        ),),
                    ],
                  ),
                ),
                SizedBox(height: widget.height*0.03,),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: widget.height*0.06,
                    width: widget.width*0.20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: themeColor2,
                        border: Border.all(color: Color(0xffE8E8E8))
                    ),
                    child: Center(
                      child:    VariableText(text: "Close",
                        fontsize: 18,
                        fontcolor:textColor,
                        fontFamily: 'sfdm',),
                    ),
                  ),
                ),
                SizedBox(height: widget.height*0.05,),

              ],
            ),
          ),
        ),
      );
  }

}
