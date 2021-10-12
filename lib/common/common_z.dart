import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/global_variables.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
import 'package:petzola/models/reminder.dart';
import 'package:petzola/my_pets/add_medical_lab_result.dart';
import 'package:petzola/my_pets/add_reminder_screen.dart';
import 'package:petzola/my_pets/edit_reminder_screen.dart';
import 'package:petzola/my_pets/mypets_main.dart';
import 'package:petzola/screens/appointment/appoinment_details.dart';
import 'package:petzola/screens/appointment/appointmentrate_screen.dart';
import 'package:petzola/screens/services/PetConsultationServiceScreen.dart';
import 'package:petzola/screens/services/all_services.dart';
import 'package:petzola/screens/onboarding_screens/onboarding_screen2.dart';
import 'package:petzola/screens/services/payment_credit_card_screen.dart';
import 'package:petzola/screens/services/select_service_screen.dart';
import 'package:petzola/screens/services/vet_consultation_screen.dart';
import 'package:intl/intl.dart';

import 'package:translator/translator.dart';

class VariableText extends StatelessWidget {
  final String text;
  final Color fontcolor;
  final TextAlign textAlign;
  final FontWeight weight;
  final bool underlined, linethrough;
  final String fontFamily;
  final double fontsize, line_spacing, letter_spacing;
  final int max_lines;
  final TextOverflow overflow;
  //final double minfontsize,scalefactor,fontsize;

  const VariableText({
    this.text,
    this.fontcolor = Colors.black,
    this.fontsize = 15,
    this.textAlign,
    this.weight = FontWeight.normal,
    this.underlined = false,
    this.line_spacing,
    this.letter_spacing,
    this.max_lines, //double line_spacing=1.2,
    this.fontFamily,
    this.overflow,
    this.linethrough = false,
    // this.minfontsize=10,//this.scalefactor,
  });

  @override
  Widget build(BuildContext context) {
    //var media=MediaQuery.of(context);
    return Text(
      text,
      maxLines: max_lines,
      overflow: max_lines != null ? TextOverflow.ellipsis : overflow,
      textAlign: textAlign,
      style: TextStyle(
        color: fontcolor,
        fontWeight: weight,
        height: line_spacing,
        letterSpacing: letter_spacing,
        fontSize: fontsize,
        //  fontSize: fontsize,
        fontFamily: fontFamily,
        decorationThickness: 2.0,
        decoration: underlined
            ? TextDecoration.underline
            : (linethrough ? TextDecoration.lineThrough : TextDecoration.none),
      ),
    );
  }
}

class RectangluartextFeildWithStartIconZ extends StatelessWidget {
  final String text, imageIconPath;
  final Function onTap;
  final double heights;
  final double widths;
  final bool enable;
  final Function onChanged;
  final TextEditingController cont;
  final String hinttext;

  //FieldIcon icon;
  final bool texthidden, readonly, expands;
  final double radius;
  final String fontFamily;

  final Widget icon;
  final TextInputType keytype;

  // final FocusNode focusNode;

  final Color color;
  final int length;
  final int textlength;

  //final Array inputFormatter;

  final double fontsize;
  final String obscuringCharacter;

  const RectangluartextFeildWithStartIconZ({
    /*this.inputFormatter,*/ this.textlength,
    this.imageIconPath,
    this.text,
    this.onTap,
    this.enable,
    this.onChanged,
    this.keytype = TextInputType.text,
    this.color ,
    this.hinttext,
    this.cont,
    this.texthidden = false,
    this.readonly = false,
    this.heights,
    this.expands = false,
    this.fontFamily ,
    this.radius = 0,
    this.icon,
    this.length,
    this.widths,
    this.obscuringCharacter = "*",
    this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    double height = media.height;
    double width = media.width;
    double radius = 10;
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            color: Color(0xffF5F8FA),
            borderRadius: BorderRadius.circular(8),
          ),
          height: heights,
          width: widths,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(height * 0.020),
                child: TextFormField(
                  enabled: enable,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(textlength),
                  ],
                  style: TextStyle(
                    fontSize:  fontsize,
                    color: Color(0xff3C3C43,),
                    fontFamily: 'sftr',

                  ),
                  onChanged: onChanged,
                  controller: cont,
                  keyboardType: keytype,
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
                    disabledBorder: InputBorder.none, hintText: hinttext,
                    hintStyle: TextStyle(
                        fontSize: fontsize,
                        fontFamily: 'sftr',

                        color:hinttextColor),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(height * 0.020),
                child:
                Align(
                    alignment: Alignment.topLeft,
                    child: ImageIcon(AssetImage(imageIconPath),size: height*0.055,)),
              ),
            ],
          )),
    );
  }
}

class TextFieldWithStartIcon extends StatelessWidget {
  final String text, imageIconPath;
  final Function onTap;
  final double heights;
  final double widths;
  final bool enable;
  final Function onChanged;
  final TextEditingController cont;
  final String hinttext;

  //FieldIcon icon;
  final bool texthidden, readonly, expands;
  final double radius;
  final String fontFamily;

  final Widget icon;
  final TextInputType keytype;

  // final FocusNode focusNode;

  final Color color;
  final int length;
  final int textlength;

  //final Array inputFormatter;

  final double fontsize;
  final String obscuringCharacter;

  TextFieldWithStartIcon({
    this.textlength,
    this.imageIconPath,
    this.text,
    this.onTap,
    this.enable,
    this.onChanged,
    this.keytype = TextInputType.text,
    this.color ,
    this.hinttext,
    this.cont,
    this.texthidden = false,
    this.readonly = false,
    this.heights,
    this.expands = false,
    this.fontFamily ,
    this.radius = 0,
    this.icon,
    this.length,
    this.widths,
    this.obscuringCharacter = "*",
    this.fontsize,
});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            color: Color(0xffF5F8FA),
            borderRadius: BorderRadius.circular(8),
          ),
          height: heights,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: widths * 0.04,),
              Container(
                //color: Colors.red,
                //margin: EdgeInsets.only(top: heights * 0.08),
                child: ImageIcon(AssetImage(imageIconPath),size: 24),
              ),
              SizedBox(width: widths * 0.02,),
              Expanded(
                child: TextFormField(
                  enabled: enable,
                  style: TextStyle(
                    fontSize:  fontsize,
                    color: Color(0xff3C3C43,),
                    fontFamily: 'sftr',
                  ),
                  onChanged: onChanged,
                  controller: cont,
                  keyboardType: keytype,
                  decoration: InputDecoration(
                    fillColor: Color(0xffF5F8FA),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none, hintText: hinttext,
                    hintStyle: TextStyle(
                        fontSize: fontsize,
                        fontFamily: 'sftr',
                        color:hinttextColor),
                  ),
                ),
              ),

            ],
          )),
    );
  }
}


class HomeSliderSpecialOffer extends StatefulWidget {
  List offers;
  static var indexx = 0;
  var title;
  var subTitle;
  double cHeight;
  double cWidth;
  Function onTap;
  HomeSliderSpecialOffer(
      {this.offers, this.title, this.subTitle, this.cHeight, this.cWidth,this.onTap});

  @override
  _HomeSliderSpecialOfferState createState() => _HomeSliderSpecialOfferState();
}

class _HomeSliderSpecialOfferState extends State<HomeSliderSpecialOffer> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<Offset> _offsetFloat;

  int offerCount = 1;

  final translator = GoogleTranslator();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeSliderSpecialOffer.indexx = 1;
    _controller = AnimationController(
      vsync: this,
      //  reverseDuration: Duration(seconds: 6),
      duration: const Duration(milliseconds: 500),
    );
    _offsetFloat = Tween(begin: Offset(5.0, 0.0), end: Offset(0.0, 0.0))
        .animate(CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _controller,
    ));

    _offsetFloat.addListener(() {
      setState(() {});
    });
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: VariableText(
                text: getTranslated(context, widget.title.toString()),
                fontsize: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: VariableText(
                text: offerCount.toString()+ "/" + widget.offers.length.toString(),
                fontsize: 13,
                fontcolor: Color(0xFFF47920),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 7),
          height: widget.cHeight,
          //alignment: Alignment.center,
          child: SlideTransition(
            position: _offsetFloat,
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              reverse: false,
              itemCount: widget.offers.length,
              controller: PageController(
                  viewportFraction: 0.93, keepPage: true, initialPage: 0),
              onPageChanged: (int index) => setState(() {

                HomeSliderSpecialOffer.indexx = index;
                setState(() {
                  offerCount = index + 1;
                });

                //widget.onChange(index);

              }),
              itemBuilder: (_, i) {
                return InkWell(
                  onTap: (){
                    widget.onTap();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(35, 244, 121, 32),//Color(0x30F47920),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: widget.cWidth * 0.05),
                                child: VariableText(
                                  text: getTranslated(context, widget.offers[i]['title'].toString()) ,
                                  fontsize: 17,
                                  fontcolor: Color(0xFFF47920),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: widget.cWidth * 0.05, vertical: widget.cHeight * 0.06),
                                child: VariableText(
                                  text: getTranslated(context, widget.offers[i]['detail'].toString()) ,
                                  fontsize: 11,
                                  fontcolor: Color(0xFFF47920),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: widget.cWidth * 0.05),
                                  child: Container(
                                    height: widget.cHeight * 0.20,
                                    width: widget.cWidth * 0.33,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF47920),
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    child: Center(
                                      child: VariableText(
                                        text: getTranslated(context, 'Get Offer') ,
                                        fontsize: 13,
                                        fontcolor: Colors.white,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            widget.offers[i]['image'],
                            scale: 2.4,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );

    /*return Row(
      children: [
        Container(
          height: widget.cHeight,
          width: widget.cWidth,
          padding: EdgeInsets.only(left: 11, right: 0),
          //color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 05) ,
                    child: VariableText(
                      text: widget.title,
                      fontsize: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16) ,
                    child: VariableText(
                      text: widget.subTitle,
                      fontsize: 13,
                      fontcolor: Color(0xFFF47920),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: widget.onTap,
                        child: Container(
                          width: widget.cWidth * 0.85,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Color(0x10F47920),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                      EdgeInsets.only(left: widget.cWidth * 0.05),
                                      child: VariableText(
                                        text: '30% Offers',
                                        fontsize: 17,
                                        fontcolor: Color(0xFFF47920),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: widget.cWidth * 0.05,
                                          top: widget.cHeight * 0.05),
                                      child: VariableText(
                                        text: 'Check For Deals For Today',
                                        fontsize: 11,
                                        fontcolor: Color(0xFFF47920),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: widget.cWidth * 0.05,
                                            top: widget.cHeight * 0.05),
                                        child: Container(
                                          height: widget.cHeight * 0.15,
                                          width: widget.cWidth * 0.33,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFF47920),
                                              borderRadius:
                                              BorderRadius.circular(22)),
                                          child: Center(
                                            child: VariableText(
                                              text: 'Get Offer',
                                              fontsize: 13,
                                              fontcolor: Colors.white,
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                child: Image.asset(
                                  'lib/assets/images/home_bandAid.png',
                                  scale: 2.4,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );*/
  }
}

class HomeSliderService extends StatelessWidget {
  List serviceList;
  var title;
  var subTitle;
  double cHeight;
  double cWidth;
  HomeSliderService(
      {this.serviceList, this.title, this.subTitle, this.cHeight, this.cWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          //height: cHeight,
          width: cWidth,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: VariableText(
                      text: getTranslated(context, title.toString()) ,
                      fontsize: 20,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => AllServices(serviceList: serviceList)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFE8E8E8)),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: VariableText(
                            text: getTranslated(context, subTitle.toString()) ,
                            fontsize: 13,
                            fontcolor: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              currLang == 'ar' ?
              Container(
                height: cHeight * 0.70,
                padding: EdgeInsets.only(right: 16),
                child: ListView.builder(
                    itemCount: serviceList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>SelectServiceScreen()));

                            },
                            child: Container(
                              height: cHeight * 0.50,
                              width: cHeight * 0.55,
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  color: Color(0x5000AEEF),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                serviceList[index]['image'],
                                scale: 2.8,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: cHeight * 0.05),
                            child: VariableText(
                              text: serviceList[index]['name'],
                              fontsize: 13,
                              fontcolor: Color(0xFF2C3E50),
                            ),
                          ),
                        ],
                      );
                    }),
              ) :
              Container(
                height: cHeight * 0.70,
                padding: EdgeInsets.only(left: 16),
                child: ListView.builder(
                    itemCount: serviceList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>SelectServiceScreen()));

                            },
                            child: Container(
                              height: cHeight * 0.50,
                              width: cHeight * 0.55,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: Color(0x5000AEEF),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                serviceList[index]['image'],
                                scale: 2.8,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: cHeight * 0.05),
                            child: VariableText(
                              text: serviceList[index]['name'],
                              fontsize: 13,
                              fontcolor: Color(0xFF2C3E50),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class HomeFindVet extends StatefulWidget {
  List myVets;
  var title;
  var subTitle;
  double cHeight;
  double cWidth;
  HomeFindVet({this.myVets, this.title, this.subTitle, this.cHeight, this.cWidth});

  @override
  _HomeFindVetState createState() => _HomeFindVetState();
}

class _HomeFindVetState extends State<HomeFindVet> {
  List<String> yourVets = ['Book A Vet', 'Nearby Vets'];
  int _selectedIndex = 0;

  _onSelected(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: widget.cHeight,
          width: widget.cWidth,
          //color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: VariableText(
                      text: getTranslated(context, widget.title.toString()) ,
                      fontsize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFE8E8E8)),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: VariableText(
                          text: getTranslated(context, widget.subTitle.toString()),
                          fontsize: 13,
                          fontcolor: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              currLang == 'ar' ?
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: List.generate(yourVets.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        _onSelected(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFF8F7F7),
                            borderRadius: index == 0 ? BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)):
                            BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
                        ),
                        child: Container(
                          height: widget.cHeight * 0.16,
                          width: widget.cWidth * 0.42,
                          decoration: BoxDecoration(color: _selectedIndex == index
                                  ? Color(0xFF00AEEF)
                                  : Color(0xFFF8F7F7),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: VariableText(
                                text: getTranslated(context, yourVets[index].toString()),
                                fontsize: 15,
                                fontcolor: _selectedIndex == index
                                    ? Colors.white
                                    : Color(0xFF2C3E50)),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ) :
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: List.generate(yourVets.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        _onSelected(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFF8F7F7),
                            borderRadius: index == 0 ? BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)):
                            BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))
                        ),
                        child: Container(
                          height: widget.cHeight * 0.16,
                          width: widget.cWidth * 0.40,
                          decoration: BoxDecoration(
                              color: _selectedIndex == index
                                  ? Color(0xFF00AEEF)
                                  : Color(0xFFF8F7F7),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: VariableText(
                                text: getTranslated(context, yourVets[index].toString()),
                                fontsize: 15,
                                fontcolor: _selectedIndex == index
                                    ? Colors.white
                                    : Color(0xFF2C3E50)),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              SizedBox(
                height: 15,
              ),
              Container(
                height: widget.cHeight * 0.55,
                //padding: EdgeInsets.only(top: 10, bottom: 10),
                color: Color(0xFFF8F7F7),

                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.myVets.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        //height:  widget.cHeight * 0.40,
                        width: widget.cWidth * 0.65,
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Image.asset(
                                widget.myVets[index]['image'],
                                scale: 3.8,
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                    EdgeInsets.only(left: 0),
                                    child: VariableText(
                                      text: getTranslated(context, widget.myVets[index]['name'].toString()) ,
                                      fontsize: 15,
                                      fontcolor: Color(0xFF2B3E4F),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
             // SizedBox(height: 10,),
            ],
          ),
        ),
      ],
    );
  }
}

class HomeSliderMyPets extends StatefulWidget {
  var title;
  var subTitle;
  double cHeight;
  double cWidth;
  HomeSliderMyPets({this.title, this.subTitle, this.cHeight, this.cWidth});

  @override
  _HomeSliderMyPetsState createState() => _HomeSliderMyPetsState();
}

class _HomeSliderMyPetsState extends State<HomeSliderMyPets> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          //height: cHeight * 0.90,
          width: widget.cWidth,
          //color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: VariableText(
                      text: getTranslated(context, widget.title.toString()),
                      fontsize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: VariableText(
                      text: widget.subTitle,
                      fontsize: 13,
                      fontcolor: Color(0xFFF47920),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: widget.cWidth,
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: Color(0xFFEAF0F9),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: widget.cWidth * 0.05),
                            child: VariableText(
                                text: getTranslated(context, 'Time To Add Your Best'),
                                fontsize: 13,
                                fontcolor: Color(0xFF2C3E50)),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: widget.cWidth * 0.05, vertical: widget.cHeight * 0.02),
                            child: VariableText(
                                text: getTranslated(context, 'Friend (Your Pet)!') ,
                                fontsize: 13,
                                fontcolor: Color(0xFF2C3E50)),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: widget.cWidth * 0.05),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => OnboardingScreen2()));
                                },
                                child: Container(
                                  height: widget.cHeight * 0.15,
                                  width: widget.cWidth * 0.31,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: VariableText(
                                      text: getTranslated(context, 'Add One'),
                                      fontsize: 13,
                                      fontcolor: Colors.white,
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: Image.asset(
                          'lib/assets/images/home_mypets.png',
                          scale: 3.2,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HomeUpcomingAppointments extends StatelessWidget {
  var title;
  var subTitle;
  double cHeight;
  double cWidth;
  HomeUpcomingAppointments(
      {this.title, this.subTitle, this.cHeight, this.cWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: cWidth,
          padding: EdgeInsets.symmetric(horizontal: 16),
          //color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: VariableText(
                      text: getTranslated(context, title.toString()) ,
                      fontsize: 20,
                    ),
                  )
                ],
              ),
              AppointmentCard(cHeight: cHeight, cWidth: cWidth, vetName: subTitle, college: 'United States Medical Colllege',)
              /*Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: cWidth,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      //upper
                      Container(
                        //color: Colors.yellow,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //image
                            Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Image.asset(
                                  'lib/assets/images/appointment_doctor.png',
                                  scale: 3.3),
                            ),
                            //name address
                            Container(
                              //color: Colors.red,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //name & rating
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: cHeight * 0.035),
                                          child: VariableText(
                                            text: 'Benjamin Hudson',
                                            fontsize: 17,
                                            fontcolor: Color(
                                                0xFF2C3E50),
                                          ),
                                        ),
                                        SizedBox(width: cHeight * 0.02,),
                                        Padding(
                                          padding: EdgeInsets.only(top: cHeight * 0.035),
                                          child: Row(
                                            children: [
                                              VariableText(
                                                text:
                                                '4.8',
                                                fontsize: 11,
                                                fontcolor: Color(
                                                    0xFF2C3E50),
                                              ),

                                            ],
                                          ),
                                        ),SizedBox(width: 5),

                                        Padding(
                                          padding: EdgeInsets.only(top: cHeight * 0.032),
                                          child: Image.asset(
                                            'lib/assets/icons/appointment_rating.png',
                                            scale: 3.2,
                                          ),
                                        )

                                      ],
                                    ),
                                    //address
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 8.0),
                                      child: Row(
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'lib/assets/icons/appointment_clinic.png',
                                            scale: 3.2,
                                          ),
                                          SizedBox(width: cHeight * 0.01,),
                                          VariableText(
                                            text: 'United States Medical College',
                                            fontsize: 12,
                                            fontcolor:
                                            Color(0xFF2C3E50),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //home icon
                            Padding(
                              padding: EdgeInsets.only(
                                  top: cHeight * 0.025),
                              child: Image.asset(
                                'lib/assets/icons/appointment_home.png',
                                scale: 3.2,
                              ),
                            )
                          ],
                        ),
                      ),

                      //lower
                      Container(
                        padding: EdgeInsets.symmetric(vertical: cHeight * 0.02, horizontal: 16),
                        //color: Colors.red,
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: cHeight * 0.06,
                                      //width: cWidth * 0.75,
                                      decoration: BoxDecoration(
                                        color: Color(0x70ECF1FA),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        //mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                            child: VariableText(
                                              text: 'Sun, Jan 19, AT 08:00Am',
                                              fontsize: 11,
                                              fontcolor: Color(0xFF2C3E50),
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(left: cWidth * 0, right: cHeight * 0),
                                              child: Container(
                                                height:
                                                cHeight * 0.04,
                                                width: cWidth * 0.24,
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(10)),
                                                child: Center(
                                                  child: VariableText(
                                                    text: 'Confirmed',
                                                    fontsize: 11,
                                                    fontcolor: Colors.white,
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            currLang == 'ar' ?
                            Positioned(
                              left: 0,
                              child: Container(
                                height: cHeight * 0.06,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xFFEAF0F9),
                                    border: Border.all(color: Colors.white, width: 3)
                                ),
                                child: Image.asset(
                                  'lib/assets/images/appointment_pet.png',
                                  scale: 3.2,
                                ),
                              ),
                            ) :
                            Positioned(
                              right: 0,
                              child: Container(
                                height: cHeight * 0.06,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xFFEAF0F9),
                                    border: Border.all(color: Colors.white, width: 3)
                                ),
                                child: Image.asset(
                                  'lib/assets/images/appointment_pet.png',
                                  scale: 3.2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ],
    );
  }
}

class AppointmentCard extends StatelessWidget {
  double cHeight;
  double cWidth;
  var vetName;
  var college;
  AppointmentCard({this.cHeight, this.cWidth, this.vetName, this.college});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>AppointmentDetailsScreen(appoinmnetDetailsdata: AppointmentModel(doctorName: vetName, clinicName: 'SF Clinic', rating: '2.4', month: 'january', image: ''))));

        },
        child: Container(
          width: cWidth,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              //upper
              Container(
                //color: Colors.yellow,
                //padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //image
                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Image.asset(
                          'lib/assets/images/appointment_doctor.png',
                          scale: 3.3),
                    ),
                    //name address
                    Flexible(
                      child: Container(
                        //color: Colors.red,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //name & rating
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: cHeight * 0.035),
                                    child: VariableText(
                                      text: 'Clarke Kent',
                                      fontsize: 17,
                                      fontcolor: Color(
                                          0xFF2C3E50),
                                    ),
                                  ),
                                  SizedBox(width: cHeight * 0.02,),
                                  Padding(
                                    padding: EdgeInsets.only(top: cHeight * 0.035),
                                    child: Row(
                                      children: [
                                        VariableText(
                                          text:
                                          '4.8',
                                          fontsize: 11,
                                          fontcolor: Color(
                                              0xFF2C3E50),
                                        ),

                                      ],
                                    ),
                                  ),SizedBox(width: 5),

                                  Padding(
                                    padding: EdgeInsets.only(top: cHeight * 0.032),
                                    child: Image.asset(
                                      'lib/assets/icons/appointment_rating.png',
                                      scale: 3.2,
                                    ),
                                  )

                                ],
                              ),
                              //address
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Wrap(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'lib/assets/icons/appointment_clinic.png',
                                      scale: 3.2,
                                    ),
                                    SizedBox(width: cHeight * 0.01,),
                                    VariableText(
                                      text: college,
                                      max_lines: 2,
                                      fontsize: 11,
                                      fontcolor:
                                      Color(0xFF2C3E50),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //home icon
                    Padding(
                      padding: EdgeInsets.only(
                          top: cHeight * 0.025),
                      child: Image.asset(
                        'lib/assets/icons/appointment_home.png',
                        scale: 3.2,
                      ),
                    )
                  ],
                ),
              ),

              //lower
              Container(
                padding: EdgeInsets.symmetric(vertical: cHeight * 0.02,),
                //color: Colors.red,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: cHeight * 0.06,
                              //width: cWidth * 0.75,
                              decoration: BoxDecoration(
                                color: Color(0x70ECF1FA),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: VariableText(
                                      text: 'Sun, Jan 19, AT 08:00Am',
                                      fontsize: 11,
                                      fontcolor: Color(0xFF2C3E50),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: cWidth * 0, right: cHeight * 0),
                                      child: Container(
                                        height:
                                        cHeight * 0.04,
                                        width: cWidth * 0.24,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .primaryColor,
                                            borderRadius:
                                            BorderRadius
                                                .circular(10)),
                                        child: Center(
                                          child: VariableText(
                                            text: getTranslated(context, 'Confirmed'),
                                            fontsize: 11,
                                            fontcolor: Colors.white,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    currLang == 'ar' ?
                    Positioned(
                      left: 0,
                      child: Container(
                        height: cHeight * 0.06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xFFEAF0F9),
                            border: Border.all(color: Colors.white, width: 3)
                        ),
                        child: Image.asset(
                          'lib/assets/images/appointment_pet.png',
                          scale: 3.2,
                        ),
                      ),
                    ) :
                    Positioned(
                      right: 0,
                      child: Container(
                        height: cHeight * 0.06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xFFEAF0F9),
                            border: Border.all(color: Colors.white, width: 3)
                        ),
                        child: Image.asset(
                          'lib/assets/images/appointment_pet.png',
                          scale: 3.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class HomeUpcomingAppointmentsOnly extends StatelessWidget {
  double cHeight;
  double cWidth;
  HomeUpcomingAppointmentsOnly(
      {this.cHeight, this.cWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: cWidth,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              //upper
              Container(
                //color: Colors.yellow,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //image
                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Image.asset(
                          'lib/assets/images/appointment_doctor.png',
                          scale: 3.3),
                    ),
                    //name address
                    Container(
                      //color: Colors.red,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //name & rating
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: cHeight * 0.035),
                                  child: VariableText(
                                    text: 'Benjamin Hudson',
                                    fontsize: 17,
                                    fontcolor: Color(
                                        0xFF2C3E50),
                                  ),
                                ),
                                SizedBox(width: cHeight * 0.02,),
                                Padding(
                                  padding: EdgeInsets.only(top: cHeight * 0.035),
                                  child: Row(
                                    children: [
                                      VariableText(
                                        text:
                                        '4.8',
                                        fontsize: 11,
                                        fontcolor: Color(
                                            0xFF2C3E50),
                                      ),

                                    ],
                                  ),
                                ),SizedBox(width: 5),

                                Padding(
                                  padding: EdgeInsets.only(top: cHeight * 0.032),
                                  child: Image.asset(
                                    'lib/assets/icons/appointment_rating.png',
                                    scale: 3.2,
                                  ),
                                )

                              ],
                            ),
                            //address
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'lib/assets/icons/appointment_clinic.png',
                                    scale: 3.2,
                                  ),
                                  SizedBox(width: cHeight * 0.01,),
                                  VariableText(
                                    text: 'United States Medical College',
                                    fontsize: 12,
                                    fontcolor:
                                    Color(0xFF2C3E50),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //home icon
                    Padding(
                      padding: EdgeInsets.only(
                          top: cHeight * 0.025),
                      child: Image.asset(
                        'lib/assets/icons/appointment_home.png',
                        scale: 3.2,
                      ),
                    )
                  ],
                ),
              ),

              //lower
              Container(
                padding: EdgeInsets.symmetric(vertical: cHeight * 0.02, horizontal: 16),
                //color: Colors.red,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: cHeight * 0.06,
                              //width: cWidth * 0.75,
                              decoration: BoxDecoration(
                                color: Color(0x70ECF1FA),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: VariableText(
                                      text: 'Sun, Jan 19, AT 08:00Am',
                                      fontsize: 11,
                                      fontcolor: Color(0xFF2C3E50),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: cWidth * 0, right: cHeight * 0),
                                      child: Container(
                                        height:
                                        cHeight * 0.04,
                                        width: cWidth * 0.24,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .primaryColor,
                                            borderRadius:
                                            BorderRadius
                                                .circular(10)),
                                        child: Center(
                                          child: VariableText(
                                            text: getTranslated(context, 'Confirmed'),
                                            fontsize: 11,
                                            fontcolor: Colors.white,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    currLang == 'ar' ?
                    Positioned(
                      left: 0,
                      child: Container(
                        height: cHeight * 0.06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xFFEAF0F9),
                            border: Border.all(color: Colors.white, width: 3)
                        ),
                        child: Image.asset(
                          'lib/assets/images/appointment_pet.png',
                          scale: 3.2,
                        ),
                      ),
                    ) :
                    Positioned(
                      right: 0,
                      child: Container(
                        height: cHeight * 0.06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xFFEAF0F9),
                            border: Border.all(color: Colors.white, width: 3)
                        ),
                        child: Image.asset(
                          'lib/assets/images/appointment_pet.png',
                          scale: 3.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AppointmentsAll extends StatefulWidget {
  List appointmentList;
  var title;
  var subTitle;
  double cHeight;
  double cWidth;
  AppointmentsAll(
      {this.appointmentList,
        this.title,
        this.subTitle,
        this.cHeight,
        this.cWidth});

  @override
  _AppointmentsAllState createState() => _AppointmentsAllState();
}

class _AppointmentsAllState extends State<AppointmentsAll> {
  List<String> key = [];
  List<AppointmentModel> monthly = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var response = widget.appointmentList;
    for (var i = 0; i < response.length; i++) {
      var item = response[i];
      key.addAll(item.keys);
    }

    for (var i = 0; i < response.length; i++) {
      var item = response[i];
      for (var app in item[key[i]]) {
        monthly.add(AppointmentModel.fromJson(app, key[i]));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.cWidth,
      child: DelayedDisplay(
        slidingCurve: Curves.fastLinearToSlowEaseIn,
        delay: Duration(milliseconds: 200),
        fadingDuration: Duration(seconds: 1),
        child: ListView.builder(
            itemCount: key.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, index) {
              return Container(
                width: widget.cWidth,
                //color: Colors.yellow,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          child: VariableText(
                            text: key[index].toString(),
                            fontsize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: monthly.length,
                          itemBuilder: (BuildContext context, index2) {
                            return key[index].toString() ==
                                monthly[index2].month.toString()
                                ? InkWell(
                              onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder: (_)=>AppointmentDetailsScreen(appoinmnetDetailsdata: monthly[index2],)));
                               // Navigator.push(context, MaterialPageRoute(builder: (_)=>AppointmentRateScreen()));
                               },
                                  child: Container(
                              width: widget.cWidth,
                              margin: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                              decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Color(0xFFE8E8E8)),
                                    borderRadius:
                                    BorderRadius.circular(10)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //upper
                                    Container(
                                      //color: Colors.yellow,
                                      padding: EdgeInsets.symmetric(horizontal: 16),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          //image
                                          Padding(
                                            padding: EdgeInsets.only(top: 15.0),
                                            child: Image.asset(
                                                monthly[index2].image,
                                                scale: 3.3),
                                          ),
                                          //name address
                                          Flexible(
                                            child: Container(
                                              //color: Colors.red,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    //name & rating
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets.only(top: widget.cHeight * 0.035),
                                                          child: VariableText(
                                                            text:
                                                            monthly[index2]
                                                                .doctorName,
                                                            fontsize: 17,
                                                            fontcolor: Color(
                                                                0xFF2C3E50),
                                                          ),
                                                        ),
                                                        SizedBox(width: widget.cHeight * 0.02,),
                                                        Padding(
                                                          padding: EdgeInsets.only(top: widget.cHeight * 0.035),
                                                          child: Row(
                                                            children: [
                                                              VariableText(
                                                                text:
                                                                monthly[index2]
                                                                    .rating,
                                                                fontsize: 11,
                                                                fontcolor: Color(
                                                                    0xFF2C3E50),
                                                              ),

                                                            ],
                                                          ),
                                                        ),SizedBox(width: 5),

                                                        Padding(
                                                          padding: EdgeInsets.only(top: widget.cHeight * 0.032),
                                                          child: Image.asset(
                                                            'lib/assets/icons/appointment_rating.png',
                                                            scale: 3.2,
                                                          ),
                                                        )

                                                      ],
                                                    ),
                                                    //address
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(vertical: 8.0),
                                                      child: Row(
                                                        //mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Image.asset(
                                                            'lib/assets/icons/appointment_clinic.png',
                                                            scale: 3.2,
                                                          ),
                                                          SizedBox(width: widget.cHeight * 0.01,),
                                                          VariableText(
                                                            text: monthly[index2]
                                                                .clinicName,
                                                            fontsize: 12,
                                                            fontcolor:
                                                            Color(0xFF2C3E50),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          //home icon
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: widget.cHeight * 0.025),
                                            child: Image.asset(
                                              'lib/assets/icons/appointment_home.png',
                                              scale: 3.2,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    //lower
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: widget.cHeight * 0.02, horizontal: 16),
                                      //color: Colors.red,
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    height: widget.cHeight * 0.06,
                                                    //width: widget.cWidth * 0.75,
                                                    decoration: BoxDecoration(
                                                        color: Color(0x70ECF1FA),
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    child: Row(
                                                      //mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                                          child: VariableText(
                                                            text: monthly[index2].date,
                                                            fontsize: 11,
                                                            fontcolor: Color(0xFF2C3E50),
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding: EdgeInsets.only(left: widget.cWidth * 0, right: widget.cHeight * 0),
                                                            child: Container(
                                                              height:
                                                              widget.cHeight * 0.04,
                                                              width: widget.cWidth * 0.24,
                                                              decoration: BoxDecoration(
                                                                  color: Theme.of(context)
                                                                      .primaryColor,
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(10)),
                                                              child: Center(
                                                                child: VariableText(
                                                                  text: getTranslated(context, 'Confirmed'),
                                                                  fontsize: 11,
                                                                  fontcolor: Colors.white,
                                                                ),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                          currLang == 'ar' ?
                                          Positioned(
                                            left: 0,
                                            child: Container(
                                              height: widget.cHeight * 0.06,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(50),
                                                  color: Color(0xFFEAF0F9),
                                                  border: Border.all(color: Colors.white, width: 3)
                                              ),
                                              child: Image.asset(
                                                'lib/assets/images/appointment_pet.png',
                                                scale: 3.2,
                                              ),
                                            ),
                                          ) :
                                          Positioned(
                                            right: 0,
                                            child: Container(
                                              height: widget.cHeight * 0.06,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(50),
                                                  color: Color(0xFFEAF0F9),
                                                  border: Border.all(color: Colors.white, width: 3)
                                              ),
                                              child: Image.asset(
                                                'lib/assets/images/appointment_pet.png',
                                                scale: 3.2,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                              ),
                            ),
                                )
                                : Container();
                          }),
                    ),
                  ],
                ),
              );
            }),
      ),
    );

    return Container(
      //height: cHeight,
      width: widget.cWidth,
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: VariableText(
                  text: widget.title,
                  fontsize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            //height: cHeight * 0.60,

          ),
        ],
      ),
    );
  }
}

class AppointmentModel {
  var doctorName;
  var clinicName;
  var date;
  var rating;
  var month;
  var image;

  AppointmentModel(
      {this.month,
        this.clinicName,
        this.doctorName,
        this.date,
        this.image,
        this.rating});

  AppointmentModel.fromJson(Map<String, dynamic> json, String month) {
    doctorName = json['doctor-name'];
    clinicName = json['clinic-name'];
    date = json['date'];
    rating = json['rating'];
    image = json['image'];
    this.month = month;
  }
}

///My Pets screen

class MyPetsSlider extends StatefulWidget {
  List myPets;
  double cHeight;
  double cWidth;
  static var indexx = 0;

  MyPetsSlider({this.myPets, this.cWidth, this.cHeight});

  @override
  _MyPetsSliderState createState() => _MyPetsSliderState();
}

class _MyPetsSliderState extends State<MyPetsSlider>
    with SingleTickerProviderStateMixin {
  //List<Services> servicesvar;
  TextEditingController searchController = TextEditingController();
  AnimationController _controller;
  Animation<Offset> _offsetFloat;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MyPetsSlider.indexx = 1;
    _controller = AnimationController(
      vsync: this,
      //  reverseDuration: Duration(seconds: 6),
      duration: const Duration(milliseconds: 500),
    );
    _offsetFloat = Tween(begin: Offset(5.0, 0.0), end: Offset(0.0, 0.0))
        .animate(CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _controller,
    ));

    _offsetFloat.addListener(() {
      setState(() {});
    });
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 0),
      alignment: Alignment.center,
      //height: MediaQuery.of(context).size.width,
      //width: MediaQuery.of(context).size.width,
      child: SlideTransition(
        position: _offsetFloat,
        child: PageView.builder(
          physics: BouncingScrollPhysics(),
          reverse: false,
          itemCount: widget.myPets.length,
          controller: PageController(
              viewportFraction: 0.60, keepPage: true, initialPage: 1),
          onPageChanged: (int index) => setState(() {
            MyPetsSlider.indexx = index;
          }),
          itemBuilder: (_, i) {
            return Transform.scale(
                scale: i == MyPetsSlider.indexx ? 1 : 0.8,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                MyPetProfile(petDetails: widget.myPets[i])));
                  },
                  child: Column(
                    children: [
                      Image.asset(widget.myPets[i]['image'], scale: 2,),
                      MyPetsSlider.indexx == i
                          ? DelayedDisplay(
                          slidingCurve: Curves.fastLinearToSlowEaseIn,
                          delay: Duration(milliseconds: 100),
                          child: renderPetDetails(i))
                          : Container()
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }

  Widget renderPetDetails(int i) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: size.height * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VariableText(
                  text: widget.myPets[i]['name'],
                  fontsize: 20,
                  fontcolor: Color(0xFF2B3E4F)),
              InkWell(
                onTap: (){
                  MediaQuery.of(context).orientation == Orientation.portrait ?
                  selectShareOptionsP(size.height, size.width) : selectShareOptionsL(size.width, size.width);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Color(0xFFF0F5FC)
                  ),
                  child: Image.asset(
                    'lib/assets/icons/myPets_share.png',
                    scale: 3.2,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              VariableText(
                  text: widget.myPets[i]['type'] +
                      " - " +
                      widget.myPets[i]['characteristic'],
                  fontsize: 11,
                  fontcolor: Color(0xFF2B3E4F)),
            ],
          ),
        )
      ],
    );
  }
  selectShareOptionsP(double height,double width){
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context, builder: (context) {

      return DraggableScrollableSheet(
          initialChildSize: 0.38, //set this as you want
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

  selectShareOptionsL(double height,double width){
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
}

class MapSlider extends StatefulWidget {
  List myPets;
  double cHeight;
  double cWidth;
  static var indexx = 0;
  Function onChange;

  MapSlider({this.myPets, this.cWidth, this.cHeight, this.onChange});

  @override
  _MapSliderState createState() => _MapSliderState();
}

class _MapSliderState extends State<MapSlider> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetFloat;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MapSlider.indexx = 1;
    _controller = AnimationController(
      vsync: this,
      //  reverseDuration: Duration(seconds: 6),
      duration: const Duration(milliseconds: 500),
    );
    _offsetFloat = Tween(begin: Offset(5.0, 0.0), end: Offset(0.0, 0.0))
        .animate(CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _controller,
    ));

    _offsetFloat.addListener(() {
      setState(() {});
    });
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 0, right: 0),
      alignment: Alignment.center,
      //height: MediaQuery.of(context).size.width,
      //width: MediaQuery.of(context).size.width,
      child: SlideTransition(
        position: _offsetFloat,
        child: PageView.builder(
          physics: BouncingScrollPhysics(),
          reverse: false,
          itemCount: widget.myPets.length,
          controller: PageController(
              viewportFraction: 0.94, keepPage: true, initialPage: 0),
          onPageChanged: (int index) => setState(() {

            MapSlider.indexx = index;
            widget.onChange(index);

          }),
          itemBuilder: (_, i) {
            return Transform.scale(
                scale: i == MapSlider.indexx ? 1 : 1,
                child: InkWell(
                  onTap: () {

                  },
                  child: Container(
                    //color: Colors.red,
                    margin: EdgeInsets.only(right: 5),
                    child: ServiceContainer(
                        cWidth:widget.cWidth,
                        cHeight: widget.cHeight,
                        name: widget.myPets[i]['name'],
                        address: widget.myPets[i]['address'],
                        image: widget.myPets[i]['image'],
                        serivicetype: widget.myPets[i]['serivicetype'],
                        timming: widget.myPets[i]['timming'],
                        ontapBookNow:(){

                          if(i==1){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>PetConsultationServiceScreen()));
                          } else {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>VetConsultationServiceScreen()));

                          }
                        }

                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}


///Pet Profile
//Share bottom sheet

class ShareBottomSheet extends StatefulWidget {
  double cHeight;
  double cWidth;

  ShareBottomSheet({this.cWidth, this.cHeight});
  @override
  _ShareBottomSheetState createState() => _ShareBottomSheetState();
}

class _ShareBottomSheetState extends State<ShareBottomSheet> {
  List<String> shareOptions = [
    'Main Profile',
    'Medical Profile',
    'Social Profile'
  ];
  int _selectedIndexShare = 0;

  onSharePressed(int i) {
    setState(() {
      _selectedIndexShare = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: VariableText(
              text: 'Share Options',
              fontcolor: Color(0xFF2C3E50),
              fontsize: 22,
              fontFamily: 'sfdr',
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: shareOptions.length,
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  onTap: () => onSharePressed(index),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        VariableText(
                          text: shareOptions[index],
                          fontcolor: Color(0xFF2C3E50),
                          fontsize: 16,
                          fontFamily: 'sfdr',
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: BoxDecoration(
                              color: _selectedIndexShare == index
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border: _selectedIndexShare == index ? Border.all(color: Theme.of(context).primaryColor) : Border.all(color: Color(0xFFB6B6B6))),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          Spacer(),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Container(
                height: widget.cHeight * 0.05,
                width: widget.cWidth,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: VariableText(
                        text: 'Apply',
                        fontsize: 15,
                        fontcolor: Colors.white,
                        fontFamily: 'sftr')),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

//select vaccine Sheet

class SelectVaccineSheet extends StatefulWidget {
  List<String>
  vaccineNames;
  double cHeight;
  double cWidth;
  Function onSelect;

  SelectVaccineSheet({this.vaccineNames, this.cWidth, this.cHeight, this.onSelect});

  @override
  _SelectVaccineSheetState createState() => _SelectVaccineSheetState();
}

class _SelectVaccineSheetState extends State<SelectVaccineSheet> {

  static int _selectedIndexVaccine = -1;

  String selectedVacc;

  onVaccinePressed(int i) {
    setState(() {
      _selectedIndexVaccine = i;
    });
    selectedVacc = widget.vaccineNames[_selectedIndexVaccine];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: VariableText(
                  text: getTranslated(context, 'Select Vaccines'),
                  fontcolor: Color(0xFF2B3E4F),
                  fontsize: 22,
                  fontFamily: 'sfdr',
                ),
              ),
              Expanded(
                child: ListView.builder(
                  //shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: widget.vaccineNames.length,
                    itemBuilder: (BuildContext context, index){
                      return InkWell(
                        onTap: (){
                          onVaccinePressed(index);
                        },
                        child: Container(
                          color: _selectedIndexVaccine == index ? Theme.of(context).primaryColor : Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                            child: VariableText(text: widget.vaccineNames[index], fontcolor: _selectedIndexVaccine == index ? Colors.white : Color(0xFF2B3E4F), fontsize: 15, fontFamily: 'sftr',),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: InkWell(
                  onTap: ()=> widget.onSelect(selectedVacc),
                  child: Container(
                    height: widget.cHeight * 0.07,
                    width: widget.cWidth,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: VariableText(
                            text: getTranslated(context, 'Select'),
                            fontsize: 15,
                            fontcolor: Colors.white,
                            fontFamily: 'sftr')),
                  ),
                ),
              ),
            ]));
  }
}
//select medical Sheet

class SelectMedicalSheet extends StatefulWidget {
  List<String> medicalType;
  double cHeight;
  double cWidth;
  Function onSelect;

  SelectMedicalSheet({this.medicalType, this.cWidth, this.cHeight, this.onSelect});

  @override
  _SelectMedicalSheetState createState() => _SelectMedicalSheetState();
}

class _SelectMedicalSheetState extends State<SelectMedicalSheet> {

  static int _selectedIndexMedical = -1;

  String selectedVacc;

  onVaccinePressed(int i) {
    setState(() {
      _selectedIndexMedical = i;
    });
    selectedVacc = widget.medicalType[_selectedIndexMedical];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: VariableText(
                  text: getTranslated(context, 'Type'),
                  fontcolor: Color(0xFF2B3E4F),
                  fontsize: 22,
                  fontFamily: 'sfdr',
                ),
              ),
              Expanded(
                child: ListView.builder(
                  //shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: widget.medicalType.length,
                    itemBuilder: (BuildContext context, index){
                      return InkWell(
                        onTap: (){
                          onVaccinePressed(index);
                        },
                        child: Container(
                          color: _selectedIndexMedical == index ? Theme.of(context).primaryColor : Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                            child: VariableText(text: widget.medicalType[index], fontcolor: _selectedIndexMedical == index ? Colors.white : Color(0xFF2B3E4F), fontsize: 15, fontFamily: 'sftr',),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: InkWell(
                  onTap: ()=> widget.onSelect(selectedVacc),
                  child: Container(
                    height: widget.cHeight * 0.07,
                    width: widget.cWidth,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: VariableText(
                            text: getTranslated(context, 'Select'),
                            fontsize: 15,
                            fontcolor: Colors.white,
                            fontFamily: 'sftr')),
                  ),
                ),
              ),
            ]));
  }
}

///Reminder
class MyPetsReminder extends StatefulWidget {
  double cHeight;
  double cWidth;
  double fHeight;
  double fWidth;
  var petDetails;

  MyPetsReminder({this.cHeight, this.cWidth, this.fHeight, this.fWidth,this.petDetails});

  @override
  _MyPetsReminderState createState() => _MyPetsReminderState();
}

class _MyPetsReminderState extends State<MyPetsReminder> with TickerProviderStateMixin{
  TabController tabViewController;


  Map<String, dynamic> reminderJson = {
    "reminders": [
      {
        "title": "Breakfast",
        "time": "08:00Am",
        "date": "1",
        "month": "October",
        "note": "Write note here"
      },

    ]
  };

  DateFormat dateFormatter = DateFormat('MMMM, yyyy');
  DateTime selectedDateCalendar = DateTime.now();

  List<String> weekDays = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
  List<String> dailyTime = ['08:00Am', '08:30Am', '09:00Am', '09:30Am'];
  List<String> weekDates1 = ['1', '2', '3', '4', '5', '6', '7'];
  List<String> weekDates2 = ['8', '9', '10', '11', '12', '13', '14'];
  List<String> weekDates3 = ['15', '16', '17', '18', '19', '20', '21'];
  List<String> weekDates4 = ['22', '23', '24', '25', '26', '27', '28'];

  List<ReminderModel> remindersAll = [];
  List<ReminderModel> remindersSelected = [];
  String selectedDate = '1';


  double fSize;

  /*onDaySelected(int i){
    setState(() {
      _selectedIndex = i;
    });
  }*/

  onDaySelected(String date) {
      setState(() {
        selectedDate = date;
      });
    }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDateCalendar,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDateCalendar = picked;
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fSize = widget.fHeight / widget.fWidth;
    tabViewController = TabController(length: 4, vsync: this);

    for(var item in reminderJson['reminders']){
      remindersAll.add(ReminderModel.fromJson(item));
    }
    for(ReminderModel item in remindersAll){
      if(item.date == selectedDate){
        remindersSelected.add(ReminderModel.fromModel(item));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_)=> MyPetAddReminderScreen(
                    petDetails: widget.petDetails,
                    onSave: (List<ReminderModel> rem){
                      remindersAll.addAll(rem);
                      setState(() {

                      });
                      Navigator.pop(context);
                    },
                  )
                  ));
                },
                child:
                Stack(
                  children: [
                    Container(
                      height: widget.cHeight * 0.50,
                      width: widget.cWidth * 0.32,
                      decoration: BoxDecoration(
                          color:Color(0xFFF8F9FA),
                          borderRadius: BorderRadius.circular(10)),
                      child: DashedRect(color: Color(0xffE8E8E8), strokeWidth: 1.5, gap: 8.0,),

                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: widget.cHeight * 0.30,
                        width: widget.cWidth * 0.28,

                        child:     Center(
                            child: VariableText(
                                text: getTranslated(context, 'Add Reminder'),
                                fontsize: fSize * 7,
                                fontcolor: Color(0x703C3C43),
                                fontFamily: 'sftr')),

                      ),
                    ),

                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                _selectDate(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: VariableText(
                  text: dateFormatter.format(selectedDateCalendar),
                  fontcolor: Color(0xFF2B3E4F),
                  fontsize: fSize * 7,
                  fontFamily: 'sftr',
                ),
              ),
            ),
          ],
        ),
        //Calender Scroll
        Container(
            height: widget.cHeight * 0.70,
            width: double.infinity,//widget.cWidth,
            //color: Colors.yellow,
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: TabBarView(
                controller: tabViewController,
                children: <Widget>[
                  renderWeeks(weekDays, weekDates1, widget.cHeight, widget.cWidth),
                  renderWeeks(weekDays, weekDates2, widget.cHeight, widget.cWidth),
                  renderWeeks(weekDays, weekDates3, widget.cHeight, widget.cWidth),
                  renderWeeks(weekDays, weekDates4, widget.cHeight, widget.cWidth),
                ]
            )
        ),
        SizedBox(height: 15),
        Container(
          width: double.infinity,
          //color: Colors.yellow,
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: dailyReminderTime(widget.cHeight, widget.cWidth),
        )
      ],
    );
  }

  Widget dailyReminderTime(double cHeight, double cWidth){

    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(remindersAll.length, (index){
              return remindersAll[index].date == selectedDate ?
              DelayedDisplay(
                slidingCurve: Curves.fastLinearToSlowEaseIn,
                delay: Duration(milliseconds: 100),
                child: Container(
                  //color: Colors.red,
                  height: cHeight * 0.40,
                  margin: EdgeInsets.symmetric(vertical: 5,),
                  child: Row(
                    children: [
                      VariableText(
                          text: remindersAll[index].time.toString(),
                          fontsize: fSize * 6,
                          fontcolor: Color(0xFF2B3E4F),
                          fontFamily: 'sftr'),
                       Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                flex: index+1,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Container(
                                    height: 1,
                                    color: Color(0xFFE8E8E8),
                                  ),
                                )
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (_)=> MyPetEditReminderScreen(petDetails: widget.petDetails, reminderDetails: remindersAll[index],)
                                ));
                              },
                              child: Container(
                                height: cHeight * 0.35,
                                width: cWidth * 0.30,
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                    color: Color(0xFFA4E3FA),
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(color: Color(0xFF00AEEF))
                                ),
                                child: Center(
                                  child: VariableText(
                                      text: remindersAll[index].title,
                                      fontsize: fSize * 5,
                                      fontcolor: Color(0xFF2C3E50),
                                      fontFamily: 'sftr'),
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 7,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Container(
                                    height: 1,
                                    color: Color(0xFFE8E8E8),
                                  ),
                                )
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ) : Container();
            })
        )
    );

    /*return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(reminders.length, (index){
              return Container(
                //color: Colors.red,
                height: cHeight * 0.40,
                margin: EdgeInsets.symmetric(vertical: 5,),
                child: Row(
                  children: [
                    VariableText(
                        text: reminders[index].time.toString(),
                        fontsize: fSize * 6,
                        fontcolor: Color(0xFF2B3E4F),
                        fontFamily: 'sftr'),
                    index == 1 ? Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: Container(
                                  height: 1,
                                  color: Color(0xFFE8E8E8),
                                ),
                              )
                          ),
                          Container(
                            height: cHeight * 0.35,
                            width: cWidth * 0.30,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                                color: Color(0xFFA4E3FA),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: Color(0xFF00AEEF))
                            ),
                            child: Center(
                              child: VariableText(
                                  text: 'Breakfast',
                                  fontsize: fSize * 5,
                                  fontcolor: Color(0xFF2C3E50),
                                  fontFamily: 'sftr'),
                            ),
                          ),
                          Expanded(
                              flex: 6,
                              child: Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Container(
                                  height: 1,
                                  color: Color(0xFFE8E8E8),
                                ),
                              )
                          ),
                        ],
                      ),
                    ) :
                    index == 2 ? Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: Container(
                                  height: 1,
                                  color: Color(0xFFE8E8E8),
                                ),
                              )
                          ),
                          Container(
                            height: cHeight * 0.35,
                            width: cWidth * 0.30,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                                color: Color(0xFFA4E3FA),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: Color(0xFF00AEEF))
                            ),
                            child: Center(
                              child: VariableText(
                                  text: 'Take a Shower',
                                  fontsize: fSize * 5,
                                  fontcolor: Color(0xFF2C3E50),
                                  fontFamily: 'sftr'),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Container(
                                  height: 1,
                                  color: Color(0xFFE8E8E8),
                                ),
                              )
                          ),
                        ],
                      ),
                    ) : Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Container(
                            height: 1,
                            color: Color(0xFFE8E8E8),
                          ),
                        ))
                  ],
                ),
              );
            })
        )
    );*/
  }

  Widget renderWeeks(List<String> cDaysList, List<String> cDateList,double cHeight, double cWidth){
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
                  onDaySelected(cDateList[index]);
                },
                child: Container(
                  width: fSize * 20, //cWidth * 0.09,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: selectedDate == cDateList[index] ? Color(0xFF00AEEF) : Colors.white,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      VariableText(
                          text: cDaysList[index],
                          fontsize: fSize * 5.5,
                          fontcolor: selectedDate == cDateList[index] ? Colors.white : Color(0xFF2B3E4F),
                          fontFamily: 'sftr'),
                      SizedBox(height: 5),
                      VariableText(
                          text: cDateList[index],
                          fontsize: fSize * 5.5,
                          fontcolor: selectedDate == cDateList[index] ? Colors.white : Color(0xFF2B3E4F),
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

///Vaccination
class MyPetsVaccination extends StatefulWidget {
  double cHeight;
  double cWidth;
  Function onAddVacc;

  MyPetsVaccination({this.onAddVacc, this.cHeight, this.cWidth});

  @override
  _MyPetsVaccinationState createState() => _MyPetsVaccinationState();
}

class _MyPetsVaccinationState extends State<MyPetsVaccination> {

  Map<String, dynamic> myVaccinations = {'vaccinations': [
    {
      "vaccine": "Calicivirus",
      "image": "lib/assets/images/myPets_tab2.png",
      "date": "24/04/2021",
      "description": "Fusce At Nisi Eget Dolor Rhoncus Facilisis. Mauris Ante Nisl, Consectetur Et Luctus Et, Porta Ut Dolor."
    },
    {
      "vaccine": "Bordetella",
      "image": "lib/assets/images/myPets_tab2.png",
      "date": "24/04/2021"
    },
    {
      "vaccine": "Calicivirus",
      "image": "lib/assets/images/myPets_tab2.png",
      "date": "24/04/2021",
      "description": "Fusce At Nisi Eget Dolor Rhoncus Facilisis. Mauris Ante Nisl, Consectetur Et Luctus Et, Porta Ut Dolor."

    },
    {
      "vaccine": "Calicivirus",
      "image": "lib/assets/images/myPets_tab2.png",
      "date": "24/04/2021"
    },
    {
      "vaccine": "Bordetella",
      "image": "lib/assets/images/myPets_tab2.png",
      "date": "24/04/2021"
    },
    {
      "vaccine": "Calicivirus",
      "image": "lib/assets/images/myPets_tab2.png",
      "date": "24/04/2021",
      "description": "Fusce At Nisi Eget Dolor Rhoncus Facilisis. Mauris Ante Nisl, Consectetur Et Luctus Et, Porta Ut Dolor."

    },
    {
      "vaccine": "Calicivirus",
      "image": "lib/assets/images/myPets_tab2.png",
      "date": "24/04/2021"
    }
  ]
  };

  List<String> vaccinationHistory = ['Coming', 'Past'];
  bool vaccAdded = false;

  int _selectedIndex = 0;

  _onSelected(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return vaccAdded != true ?
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: widget.cHeight * 0.40),
        Image.asset(
          'lib/assets/icons/myPets_tab2.png',
          scale: 2.2,
          color: Color(0x603C3C43),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: VariableText(
            text: getTranslated(context, 'No Entries Found!'),
            fontcolor: Color(0x603C3C43),
            fontsize: 15,
            fontFamily: 'sftr',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: InkWell(
            onTap: () {
              widget.onAddVacc();
              setState(() {
                vaccAdded = true;
              });
            },
            child: Container(
              height: widget.cHeight * 0.47,
              width: widget.cWidth * 0.45,
              decoration: BoxDecoration(
                  color: Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: VariableText(
                      text: getTranslated(context, 'Add Vaccination'),
                      fontsize: 15,
                      fontcolor: Color(0x603C3C43),
                      fontFamily: 'sftr')),
            ),
          ),
        ),
      ],
    ):
    Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: InkWell(
                onTap: () {
                  widget.onAddVacc();
                },
                child: Container(
                  height: widget.cHeight * 0.45,
                  width: widget.cWidth * 0.37,
                  decoration: BoxDecoration(
                      color: Color(0xFFF8F9FA), //Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: VariableText(
                          text: getTranslated(context, 'Add Vaccination'),
                          fontsize: 15,
                          fontcolor: Color(0x603C3C43),
                          fontFamily: 'sftr')),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Image.asset('lib/assets/icons/filter.png', scale: 3.2),
            )
          ],
        ),
        SizedBox(height: 15,),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: List.generate(vaccinationHistory.length, (index) {
              return GestureDetector(
                onTap: () {
                  _onSelected(index);
                },
                child:
                    currLang == 'ar' ?
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFF8F7F7),
                      borderRadius: index == 0 ? BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)):
                      BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
                  ),
                  child: Container(
                    height: widget.cHeight * 0.45,
                    width: widget.cWidth * 0.30,
                    decoration: BoxDecoration(
                        color: _selectedIndex == index
                            ? Color(0xFF00AEEF)
                            : Color(0xFFF8F7F7),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: VariableText(
                          text: getTranslated(context, vaccinationHistory[index].toString()) ,
                          fontsize: 15,
                          fontcolor: _selectedIndex == index
                              ? Colors.white
                              : Color(0xFF2C3E50)),
                    ),
                  ),
                ) :
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFF8F7F7),
                          borderRadius: index == 0 ? BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)):
                          BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))
                      ),
                      child: Container(
                        height: widget.cHeight * 0.45,
                        width: widget.cWidth * 0.30,
                        decoration: BoxDecoration(
                            color: _selectedIndex == index
                                ? Color(0xFF00AEEF)
                                : Color(0xFFF8F7F7),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: VariableText(
                              text: getTranslated(context, vaccinationHistory[index].toString()) ,
                              fontsize: 15,
                              fontcolor: _selectedIndex == index
                                  ? Colors.white
                                  : Color(0xFF2C3E50)),
                        ),
                      ),
                    ),
              );
            }),
          ),
        ),

        SizedBox(height: 15,),

        Container(
          color: Color(0xFFF8F7F7),
          child: ListView.builder(
              itemCount: myVaccinations['vaccinations'].length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, index){
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: widget.cHeight * 0.60,
                              width: widget.cWidth * 0.16,
                              decoration: BoxDecoration(
                                  color: Color(0x5000AEEF),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Image.asset('lib/assets/icons/myPets_tab2.png', scale: 3.8, color: Theme.of(context).primaryColor,),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                VariableText(
                                  text: myVaccinations['vaccinations'][index]['date'],
                                  fontcolor: Color(0xFF2B3E4F),
                                  fontsize: 15,
                                  fontFamily: 'sftr',
                                ),
                                VariableText(
                                  text: myVaccinations['vaccinations'][index]['vaccine'],
                                  fontcolor: Color(0xFF2B3E4F),
                                  fontsize: 11,
                                  fontFamily: 'sftr',
                                ),

                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        myVaccinations['vaccinations'][index]['description'] != null ?
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: VariableText(
                            text: myVaccinations['vaccinations'][index]['description'],
                            fontcolor: Color(0x603C3C43),
                            fontsize: 11,
                            fontFamily: 'sftr',
                          ),
                        ) : Container()
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}


///Appointment

class MyAppointments extends StatefulWidget {
  double cHeight;
  double cWidth;
  Function onAddAppointment;

  MyAppointments({this.cHeight, this.cWidth, this.onAddAppointment});

  @override
  _MyAppointmentsState createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {

  List<String> appointmentHistory = ['Coming', 'Past'];
  int _selectedHistory = 0;
  bool AppointmentAdded = false;

  onPressedHistory(int i){
    setState(() {
      _selectedHistory = i;
    });
  }

  int _selectedIndex = 0;

  _onSelected(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AppointmentAdded != true ? Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: widget.cHeight * 0.40),
        Image.asset(
          'lib/assets/icons/myPets_tab3.png',
          scale: 2.2,
          color: Color(0x603C3C43),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: VariableText(
            text: getTranslated(context, 'Now You Can Add Appointments'),
            fontcolor: Color(0x603C3C43),
            fontsize: 15,
            fontFamily: 'sftr',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: InkWell(
            onTap: (){
              widget.onAddAppointment();
              setState(() {
                AppointmentAdded = true;
              });
            },
            child: Container(
              height: widget.cHeight * 0.45,
              width: widget.cWidth * 0.40,
              decoration: BoxDecoration(
                  color: Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: VariableText(
                      text: getTranslated(context, 'Add Appointments'),
                      fontsize: 15,
                      fontcolor: Color(0x603C3C43),
                      fontFamily: 'sftr')),
            ),
          ),
        ),
      ],
    )
        : Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: InkWell(
                onTap: () {
                  //widget.onAddVacc();
                },
                child: Container(
                  height: widget.cHeight * 0.45,
                  width: widget.cWidth * 0.40,
                  decoration: BoxDecoration(
                      color: Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: VariableText(
                          text: getTranslated(context, 'Add Appointments'),
                          fontsize: 15,
                          fontcolor: Color(0x603C3C43),
                          fontFamily: 'sftr')),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Image.asset('lib/assets/icons/filter.png', scale: 3.2),
            )
          ],
        ),
        SizedBox(height: 15,),

        Container(
          padding: EdgeInsets.only(left: 16),
          child: Row(
            children: List.generate(appointmentHistory.length, (index) {
              return GestureDetector(
                onTap: () {
                  _onSelected(index);
                },
                child:
                    currLang == 'ar' ?
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFF8F7F7),
                      borderRadius: index == 0 ? BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)):
                      BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
                  ),
                  child: Container(
                    height: widget.cHeight * 0.45,
                    width: widget.cWidth * 0.30,
                    decoration: BoxDecoration(
                        color: _selectedIndex == index
                            ? Color(0xFF00AEEF)
                            : Color(0xFFF8F7F7),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: VariableText(
                          text: getTranslated(context, appointmentHistory[index].toString()),
                          fontsize: 15,
                          fontcolor: _selectedIndex == index
                              ? Colors.white
                              : Color(0xFF2C3E50)),
                    ),
                  ),
                ) :
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFF8F7F7),
                          borderRadius: index == 0 ? BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)):
                          BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))
                      ),
                      child: Container(
                        height: widget.cHeight * 0.45,
                        width: widget.cWidth * 0.30,
                        decoration: BoxDecoration(
                            color: _selectedIndex == index
                                ? Color(0xFF00AEEF)
                                : Color(0xFFF8F7F7),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: VariableText(
                              text: getTranslated(context, appointmentHistory[index].toString()),
                              fontsize: 15,
                              fontcolor: _selectedIndex == index
                                  ? Colors.white
                                  : Color(0xFF2C3E50)),
                        ),
                      ),
                    ),
              );
            }),
          ),
        ),

        SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppointmentCard(cHeight: size.height, cWidth: size.width, vetName: 'Benjamin Clarke', college: 'United States Medical Colllege',),
        ),

        SizedBox(height: 15,),
      ],
    );
  }
}

class AppointmentBottomSheet extends StatefulWidget {
  double cHeight;
  double cWidth;

  AppointmentBottomSheet({this.cWidth, this.cHeight});

  @override
  _AppointmentBottomSheetState createState() => _AppointmentBottomSheetState();
}

class _AppointmentBottomSheetState extends State<AppointmentBottomSheet> {

  Map<String, dynamic> myServices = {'services': [
    {
      "name": "Book A service",
      "image": "lib/assets/icons/appointments_service.png"
    },
    {
      "name": "Book A Vet",
      "image": "lib/assets/icons/appointments_vet.png",
    }
  ]
  };
  int _selectedServiceIndex = -1;

  onSelectedService(int i){
    setState(() {
      _selectedServiceIndex = i;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: VariableText(
              text: getTranslated(context, 'Appointments Type'),
              fontcolor: Color(0xFF2C3E50),
              fontsize: 22,
              fontFamily: 'sfdr',
            ),
          ),
          SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(myServices['services'].length, (index){
                    return Container(
                      //height: widget.cHeight,
                      width: widget.cWidth * 0.35,
                      //color: Colors.red,
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: ()=> onSelectedService(index),
                            child: Container(
                                height: widget.cWidth * .25,
                                width: widget.cWidth * 0.25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: _selectedServiceIndex == index ? Theme.of(context).primaryColor : Colors.white,
                                ),
                                child: Image.asset(myServices['services'][index]['image'], scale: 2.8)

                            ),
                          ),
                          VariableText(
                            text: getTranslated(context, myServices['services'][index]['name'].toString()),
                            fontcolor: Color(0xFF2C3E50),
                            fontsize: 17,
                            fontFamily: 'sftr',
                          ),
                        ],
                      ),

                    );
                  })
              ),
            ],
          ),
          Spacer(),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Container(
                height: widget.cHeight * 0.60,
                width: widget.cWidth,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: VariableText(
                        text: getTranslated(context, 'Next'),
                        fontsize: 15,
                        fontcolor: Colors.white,
                        fontFamily: 'sftr')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


///Medical

class MyMedical extends StatefulWidget {
  double cHeight;
  double cWidth;
  Function onAddMedical;

  MyMedical({this.cHeight, this.cWidth,this.onAddMedical});

  @override
  _MyMedicalState createState() => _MyMedicalState();
}

class _MyMedicalState extends State<MyMedical> {
  Map<String, dynamic> myMedical = {'medical': [
    {
      "name": "Vivamus Curabitur Consectetur ",
      "image": "lib/assets/images/myPets_tab2.png",
      "date": "Sun, Jan 19, At 08:00Am",
      "status":false,
      "result":"null"
      },
    {
      "name": "Adenovirus",
      "image": "lib/assets/images/myPets_tab2.png",
      "date": "27/08/2021",
        "status":true,
        "result":"Positive"
    },
  {
  "name": "Vivamus Curabitur Consectetur ",
  "image": "lib/assets/images/myPets_tab2.png",
  "date": "Sun, Jan 19, At 08:00Am",
  "status":false,
  "result":"null"
},
{
"name": "Adenovirus",
"image": "lib/assets/images/myPets_tab2.png",
"date": "27/08/2021",
"status":true,
"result":"Negative"
},

  ]
  };
  bool medAdded = false;
  @override
  Widget build(BuildContext context) {
    return medAdded != true ?
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: widget.cHeight * 0.40),
        Image.asset(
          'lib/assets/icons/myPets_tab4.png',
          scale: 2.2,
          color: Color(0x603C3C43),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: VariableText(
            text: getTranslated(context, 'No Medical Yet'),
            fontcolor: Color(0x603C3C43),
            fontsize: 15,
            fontFamily: 'sftr',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: InkWell(
            onTap: () {
              widget.onAddMedical();
              setState(() {
                medAdded = true;
              });
            },
            child: Container(
              height: widget.cHeight * 0.45,
              width: widget.cWidth * 0.40,
              decoration: BoxDecoration(
                  color: Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: VariableText(
                      text: getTranslated(context, 'Add Medical'),
                      fontsize: 15,
                      fontcolor: Color(0x603C3C43),
                      fontFamily: 'sftr')),
            ),
          ),
        ),
      ],
    ):
    Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: InkWell(
                onTap: () {
                  widget.onAddMedical();
                },
                child: Container(
                  height: widget.cHeight * 0.45,
                  width: widget.cWidth * 0.37,
                  decoration: BoxDecoration(
                      color: Color(0xFFF8F9FA), //Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: VariableText(
                          text: getTranslated(context, 'Add Medical'),
                          fontsize: 15,
                          fontcolor: Color(0x603C3C43),
                          fontFamily: 'sftr')),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              //myVaccination_sort
              child: Image.asset('lib/assets/icons/filter.png', scale: 3.2),
            )
          ],
        ),
        SizedBox(height: 15,),





        Container(
          color: Color(0xFFF8F7F7),
          child: ListView.builder(
              itemCount: myMedical['medical'].length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, index){
                return
                  myMedical['medical'][index]['status']?
                  Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: widget.cHeight * 0.65,
                              width: widget.cWidth * 0.16,
                              decoration: BoxDecoration(
                                  color: Color(0x5000AEEF),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Image.asset('lib/assets/icons/myPets_tab4.png', scale: 3.8, color: Color(0xff2B3E4F),),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: widget.cHeight*0.1,),
                                VariableText(
                                  text: myMedical['medical'][index]['name'],
                                  fontcolor: Color(0xFF2B3E4F),
                                  fontsize: 15,
                                  fontFamily: 'sftr',
                                ),
                                SizedBox(height: widget.cHeight*0.1,),
                                VariableText(
                                  text: myMedical['medical'][index]['date'],
                                  fontcolor: Color(0xFF2B3E4F),
                                  fontsize: 11,
                                  fontFamily: 'sftr',
                                ),

                              ],
                            ),
                            Spacer(),

                            Column(
                              children: [
                                Container(
                                  height: widget.cHeight * 0.3,
                                  width: widget.cWidth * 0.20,
                                  decoration: BoxDecoration(
                                      color: themeColor2,
                                      border: Border.all(color: Color(0xff2B3E4F)
                                      ),
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Center(child:   VariableText(
                                    text: myMedical['medical'][index]['result'],
                                    fontcolor: Color(0xFF2B3E4F),
                                    fontsize: 12,
                                    fontFamily: 'sftr',
                                  ),),
                                ),

                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10),

                      ],
                    ),
                  ),
                ):
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: widget.cHeight * 0.65,
                                width: widget.cWidth * 0.16,
                                decoration: BoxDecoration(
                                   color: Color(0x5000AEEF),

                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Image.asset('lib/assets/icons/myPets_tab4.png', scale: 3.8, color: Color(0xff2B3E4F),),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: widget.cHeight*0.1,),
                                  VariableText(
                                    text: myMedical['medical'][index]['name'],
                                    fontcolor: Color(0xFF2B3E4F),
                                    fontsize: 15,
                                    fontFamily: 'sftr',
                                  ),
                                  SizedBox(height: widget.cHeight*0.1,),
                                  VariableText(
                                    text: myMedical['medical'][index]['date'],
                                    fontcolor: Color(0xFF2B3E4F),
                                    fontsize: 11,
                                    fontFamily: 'sftr',
                                  ),

                                  SizedBox(height: widget.cHeight*0.1,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=>AddMedicalLabResult()));
                                    },
                                    child: Container(
                                      height: widget.cHeight * 0.3,
                                      width: widget.cWidth * 0.16,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF00AEEF),
                                          borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Center(child: VariableText(text: getTranslated(context, 'Status'), fontsize: 11, fontcolor: Colors.white),),
                                    ),
                                  ),

                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 10),

                        ],
                      ),
                    ),
                  );
              }),
        )
      ],
    );

  }
}

///Care

class MyCare extends StatefulWidget {
  double cHeight;
  double cWidth;
  Function onAddCare;

  MyCare({this.cHeight, this.cWidth,this.onAddCare});

  @override
  _MyCareState createState() => _MyCareState();
}

class _MyCareState extends State<MyCare> {
  Map<String, dynamic> myCare = {'care': [
    {
      "name": "Hair",
      "image": "lib/assets/icons/seaser.png",
      "description": "Hygiene",
      "date": "27/08/2021",

    },
    {
      "name": "Hair",
      "image": "lib/assets/icons/seaser.png",
      "description": "Hygiene",
      "date": "27/08/2021",

    },
    {
      "name": "Hair",
      "image": "lib/assets/icons/seaser.png",
      "description": "Hygiene",
      "date": "27/08/2021",

    },
    {
      "name": "Hair",
      "image": "lib/assets/icons/seaser.png",
      "description": "Hygiene",
      "date": "27/08/2021",

    },
  ]
  };
  bool careAdded = false;
  @override
  Widget build(BuildContext context) {
    return careAdded != true ?
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: widget.cHeight * 0.40),
        Image.asset(
          'lib/assets/icons/myPets_tab5.png',
          scale: 2.2,
          color: Color(0x603C3C43),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: VariableText(
            text: getTranslated(context, 'No Care Yet'),
            fontcolor: Color(0x603C3C43),
            fontsize: 15,
            fontFamily: 'sftr',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: InkWell(
            onTap: () {
              widget.onAddCare();
              setState(() {
                careAdded = true;
              });
            },
            child: Container(
              height: widget.cHeight * 0.45,
              width: widget.cWidth * 0.40,
              decoration: BoxDecoration(
                  color: Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: VariableText(
                      text: getTranslated(context, 'Add Care'),
                      fontsize: 15,
                      fontcolor: Color(0x603C3C43),
                      fontFamily: 'sftr')),
            ),
          ),
        ),
      ],
    ):
    Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: InkWell(
                onTap: () {
                  widget.onAddCare();
                },
                child: Container(
                  height: widget.cHeight * 0.45,
                  width: widget.cWidth * 0.37,
                  decoration: BoxDecoration(
                      color: Color(0xFFF8F9FA), //Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: VariableText(
                          text: getTranslated(context, 'Add Care'),
                          fontsize: 15,
                          fontcolor: Color(0x603C3C43),
                          fontFamily: 'sftr')),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              //myVaccination_sort
              child: Image.asset('lib/assets/icons/myVaccination_sort.png', scale: 3.2),
            )
          ],
        ),
        SizedBox(height: 15,),





        Container(
          color: Color(0xFFF8F7F7),
          child: ListView.builder(
              itemCount: myCare['care'].length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, index){
                return

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: widget.cHeight * 0.65,
                                width: widget.cWidth * 0.16,
                                decoration: BoxDecoration(
                                    color: Color(0x5000AEEF),

                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Image.asset('lib/assets/icons/myPets_tab5.png', scale: 3.8, color:themeColor1,),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Row(
                                    children: [
                                      Image.asset(myCare['care'][index]['image'],scale: 3.8, color:Color(0xff2B3E4F),),
                                      SizedBox(width: widget.cHeight*0.055
                                        ,),
                                      VariableText(
                                        text: myCare['care'][index]['name'],
                                        fontcolor: Color(0xFF2B3E4F),
                                        fontsize: 15,
                                        fontFamily: 'sftr',
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: widget.cHeight*0.055
                                    ,),
                                  VariableText(
                                    text:myCare['care'][index]['description'],
                                    fontcolor: hinttextColor,
                                    fontsize: 11,
                                    fontFamily: 'sftr',
                                  ),




                                ],
                              ),
                              Spacer(),
                              VariableText(
                                text:myCare['care'][index]['date'],
                                fontcolor: Color(0xFF2B3E4F),
                                fontsize: 15,
                                fontFamily: 'sftr',
                              ),
                            ],
                          ),
                          SizedBox(height: 10),

                        ],
                      ),
                    ),
                  );
              }),
        )
      ],
    );

  }
}

///Bottom Sheets

class SubServiceSheet extends StatefulWidget {
  double cHeight;
  double cWidth;
  Function onNext;

  SubServiceSheet({this.onNext, this.cWidth, this.cHeight});

  @override
  _SubServiceSheetState createState() => _SubServiceSheetState();
}

class _SubServiceSheetState extends State<SubServiceSheet> {
  List<String> shareOptions = [
    'Basic Grooming',
    'Bath, Brush And Blow dry Only',
    'Full Grooming',
    'Full Grooming And Dental Care'
  ];
  int _selectedIndexShare = 0;

  onSharePressed(int i) {
    setState(() {
      _selectedIndexShare = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).orientation == Orientation.portrait ? widget.cHeight * 0.40 : MediaQuery.of(context).size.height * 0.70,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 25, top: widget.cHeight * 0.04),
            child: VariableText(
              text: 'What Service Do You Need?',
              fontcolor: Color(0xFF2C3E50),
              fontsize: 22,
              fontFamily: 'sfdr',
            ),
          ),
          Expanded(
            child: DelayedDisplay(
              slidingCurve: Curves.fastLinearToSlowEaseIn,
              delay: Duration(milliseconds: 100),
              child: ListView.builder(
                    shrinkWrap: true,
                    //physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: shareOptions.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: () => onSharePressed(index),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              VariableText(
                                text: shareOptions[index],
                                fontcolor: Color(0xFF2C3E50),
                                fontsize: 15,
                                fontFamily: 'sftr',
                              ),
                              Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    color: _selectedIndexShare == index
                                        ? Theme.of(context).primaryColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                    border: _selectedIndexShare == index ? Border.all(color: Theme.of(context).primaryColor) : Border.all(color: Color(0xFFB6B6B6))),
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
                            ],
                          ),
                        ),
                      );
                    }),
            ),
          ),
          InkWell(
            onTap: (){
              widget.onNext();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: widget.cHeight * 0.06,
                      //width: widget.cWidth,
                      decoration: BoxDecoration(
                          color: Color(0xFF00AEEF),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: VariableText(
                              text: 'Next',
                              fontsize: 20,
                              fontcolor: Colors.white,
                              fontFamily: 'sfdm')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PetTypeSheet extends StatefulWidget {
  double height;
  double width;
  Function onNext;

  PetTypeSheet({this.onNext, this.height, this.width});

  @override
  _PetTypeSheetState createState() => _PetTypeSheetState();
}

class _PetTypeSheetState extends State<PetTypeSheet> {
  List<Map<String, dynamic>> pets = [
    {
      "name": "Camel",
      "image": "lib/assets/icons/camelicon.png"
    },
    {
      "name": "CAT",
      "image": "lib/assets/icons/caticon.png"
    },
    {
      "name": "DOG",
      "image": "lib/assets/icons/dogicon.png"
    },
    {
      "name": "RABBIT",
      "image": "lib/assets/icons/rabbiticon.png"
    },
    {
      "name": "HORSE",
      "image": "lib/assets/icons/horseicon.png"
    },
    {
      "name": "BIRD",
      "image": "lib/assets/icons/parroticon.png"
    },
  ];

  List<bool> petCheck = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0; i<pets.length; i++){
      petCheck.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).orientation == Orientation.portrait ? widget.height * 0.60 : MediaQuery.of(context).size.height * 0.90,
      child: Column(
        children: [
          SizedBox(height: widget.height*0.03,),
          VariableText(text: getTranslated(context, "Select Pet’s Type"),
            fontsize: 22,
            fontcolor: Color(0xff2B3E4F),
            fontFamily: 'sfdr',),
          SizedBox(height: widget.height*0.03,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height:  widget.height*0.12,
              decoration: BoxDecoration(
                color: Color(0xffF0F5FC),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(

                  children: [
                    VariableText(
                        text: getTranslated(context, 'Time To Add Your Best')+'\n'+ getTranslated(context, 'Friend (Your Pet)!'),
                        fontsize: 13,
                        fontcolor: Color(0xff2C3E50),
                        fontFamily: 'sftr'),
                    Spacer(),
                    Container(
                      height:  widget.height*0.05,
                      width: widget.width*0.30,
                      decoration: BoxDecoration(
                        color:themeColor2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: VariableText(
                            text: getTranslated(context, 'Add One'),
                            fontsize: 13,
                            fontcolor: Color(0xff2C3E50),
                            fontFamily: 'sfdm')
                        ,
                      )
                    ),

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: widget.height*0.03,),
     /*     Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFieldWithStartIcon(
              heights: widget.height*0.06,
              widths:widget. width*0.90,
              fontsize:widget. height*0.019,
              hinttext: "Search",
              imageIconPath: "lib/assets/icons/searchIcon.png",
              keytype: TextInputType.text,
            ),
          )
          ,
          SizedBox(height:widget. height*0.01,),*/

          Expanded(
            child: DelayedDisplay(
              slidingCurve: Curves.fastLinearToSlowEaseIn,
              delay: Duration(milliseconds: 100),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: pets.length,
                  itemBuilder: (BuildContext context,int index){
                    return InkWell(
                      onTap: (){
                        if(petCheck[index]){
                          setState(() {
                            petCheck[index] = false;
                          });
                        }else{
                          setState(() {
                            petCheck[index] = true;
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius:widget.height*0.02,
                              backgroundImage:
                              AssetImage(pets[index]['image']),
                              backgroundColor: Color(0xffEAF0F9),
                            ),
                             Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 10),
                               child: VariableText(
                                 text: pets[index]['name'],
                                 fontsize: widget.height*0.017,
                                 fontcolor:Color(0xff2B3E4F),
                                 weight: FontWeight.normal,
                                 fontFamily: 'sftr'),
                             ),
                            Spacer(),
                            Container(
                              height: widget.height * 0.025,
                              width: widget.height * 0.025,
                              decoration: BoxDecoration(
                                color: petCheck[index] == true ? Color(0xFF00AEEF) : Colors.white,
                                border: Border.all(color: petCheck[index] == true ? Color(0xFF00AEEF) : Color(0xFFB7B7B7)),
                                borderRadius: BorderRadius.circular(3)
                              ),
                              child: Center(child: Icon(Icons.check, size: 15, color: Colors.white)),
                            )
                          ],
                          /*child: ListTile(
                            leading:
                            CircleAvatar(
                              radius:widget.height*0.02,
                              backgroundImage:
                              AssetImage(pets[index]['image']),
                              backgroundColor: Color(0xffEAF0F9),
                            ),
                            title: VariableText(
                              text: pets[index]['name'],
                              fontsize: widget.height*0.017,
                              fontcolor:defaultindex==index ? themeColor2 : Color(0xff2B3E4F),
                              weight: FontWeight.normal,
                              fontFamily: 'sftr',),
                          ),*/
                        ),
                      ),
                    );
                  }),
            ),
          ),
          InkWell(
            onTap: (){
              widget.onNext();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: widget.height * 0.06,
                      //width: widget.cWidth,
                      decoration: BoxDecoration(
                          color: Color(0xFF00AEEF),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: VariableText(
                              text: getTranslated(context, 'Next'),
                              fontsize: 20,
                              fontcolor: Colors.white,
                              fontFamily: 'sfdm')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class ConsolationTypeSheet extends StatefulWidget {
  double height;
  double width;
  Function onNext;

  ConsolationTypeSheet({this.onNext, this.height, this.width});

  @override
  _ConsolationTypeSheetState createState() => _ConsolationTypeSheetState();
}

class _ConsolationTypeSheetState extends State<ConsolationTypeSheet> {
  List<String> consulationOptions = [
    'Physical Visit  ',
    'Home Visit',
  ];
  int _selectedIndexShare = 0;

  onSharePressed(int i) {
    setState(() {
      _selectedIndexShare = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).orientation == Orientation.portrait ? widget.height * 0.40 : MediaQuery.of(context).size.height * 0.70,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 25, top: widget.height * 0.04),
            child: VariableText(
              text: 'Consolation Type?',
              fontcolor: Color(0xFF2C3E50),
              fontsize: 22,
              fontFamily: 'sfdr',
            ),
          ),
          Expanded(
            child: DelayedDisplay(
              slidingCurve: Curves.fastLinearToSlowEaseIn,
              delay: Duration(milliseconds: 100),
              child: ListView.builder(
                  shrinkWrap: true,
                  //physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: consulationOptions.length,
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () => onSharePressed(index),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            VariableText(
                              text: consulationOptions[index],
                              fontcolor: Color(0xFF2C3E50),
                              fontsize: 15,
                              fontFamily: 'sftr',
                            ),
                            Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                  color: _selectedIndexShare == index
                                      ? Theme.of(context).primaryColor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  border: _selectedIndexShare == index ? Border.all(color: Theme.of(context).primaryColor) : Border.all(color: Color(0xFFB6B6B6))),
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
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
          InkWell(
            onTap: (){
              widget.onNext();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: widget.height * 0.06,
                      //width: widget.cWidth,
                      decoration: BoxDecoration(
                          color: Color(0xFF00AEEF),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: VariableText(
                              text: 'Next',
                              fontsize: 20,
                              fontcolor: Colors.white,
                              fontFamily: 'sfdm')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SortServiceSheet extends StatefulWidget {
  double cHeight;
  double cWidth;
  Function onNext;

  SortServiceSheet({this.onNext, this.cWidth, this.cHeight});

  @override
  _SortServiceSheetState createState() => _SortServiceSheetState();
}

class _SortServiceSheetState extends State<SortServiceSheet> {
  List<String> sortOptions = [
    'Best Match',
    'Price Low to High',
    'Price High To Low',
    'Min Waiting Time',
    'Nearest Location'
  ];
  int _selectedIndexsort = 0;

  onSharePressed(int i) {
    setState(() {
      _selectedIndexsort = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).orientation == Orientation.portrait ? widget.cHeight * 0.40 : MediaQuery.of(context).size.height * 0.70,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: widget.cHeight * 0.01, horizontal: widget.cHeight * 0.02),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    //Spacer(),
                    VariableText(
                      text: getTranslated(context, 'Sort By'),
                      fontcolor: Color(0xFF2C3E50),
                      fontsize: 22,
                      fontFamily: 'sfdb',
                    ),
                    //Spacer(),

                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment:MainAxisAlignment.end,
                  children: [
                    VariableText(
                      text: getTranslated(context, 'Clear All'),
                      fontcolor: themeColor1,
                      fontsize: 11,
                      fontFamily: 'sftr',
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: DelayedDisplay(
              slidingCurve: Curves.fastLinearToSlowEaseIn,
              delay: Duration(milliseconds: 100),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: sortOptions.length,
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () => onSharePressed(index),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            VariableText(
                              text: getTranslated(context, sortOptions[index].toString()),
                              fontcolor: Color(0xFF2C3E50),
                              fontsize: 15,
                              fontFamily: 'sftr',
                            ),
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
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
          InkWell(
            onTap: (){
              widget.onNext();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: widget.cHeight * 0.06,
                      //width: widget.cWidth,
                      decoration: BoxDecoration(
                          color: Color(0xFF00AEEF),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: VariableText(
                              text: getTranslated(context, 'Apply'),
                              fontsize: 20,
                              fontcolor: Colors.white,
                              fontFamily: 'sfdm')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterServiceSheet extends StatefulWidget {
  double cHeight;
  double cWidth;
  Function onNext;

  FilterServiceSheet({this.onNext, this.cWidth, this.cHeight});

  @override
  _FilterServiceSheetState createState() => _FilterServiceSheetState();
}

class _FilterServiceSheetState extends State<FilterServiceSheet>  with TickerProviderStateMixin{

  final Tween<double> turnsTween = Tween<double>(
    begin: 0,
    end: 0.5,
  );

  AnimationController _controller;
  AnimationController _controller1;
  AnimationController _controller2;
  AnimationController _controller3;
  AnimationController _controller4;
  AnimationController _controller5;
  AnimationController _controller6;

  initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _controller3 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _controller4 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _controller5 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _controller6 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );


    for(int i=0; i<pets.length; i++){
      petCheck.add(false);
    }
    super.initState();
  }
  List<Map<String, dynamic>> pets = [
    {
      "name": "CAMEL",
      "image": "lib/assets/icons/camelicon.png"
    },
    {
      "name": "CAT",
      "image": "lib/assets/icons/caticon.png"
    },
    {
      "name": "DOG",
      "image": "lib/assets/icons/dogicon.png"
    },
    {
      "name": "RABBIT",
      "image": "lib/assets/icons/rabbiticon.png"
    },
    {
      "name": "HORSE",
      "image": "lib/assets/icons/horseicon.png"
    },
    {
      "name": "BIRD",
      "image": "lib/assets/icons/parroticon.png"
    },
  ];

  List<bool> petCheck = [];







  List<String> petSize=["S:1-5KG","M:5-10KG","L:10-40KG"];
  List<String> serviceLocation=["Home Visit","Online Visit","Clinic Visit"];
  List<String> priceRange=["All Prices","10 - 50 AED","60 - 100 AED"/*,"101 + AED"*/];
  List<String> petCareServiceCategory = [
    'Grooming',
    'Day-Care',
    'Pet Taxi',
    'Training',
    'Boarding (Hotel)',
    'Relocation'
  ];
  List<String> vetCareServiceCategory = [
    'General Consultation',
    'Vaccinations',
    'Dentistry',
    'Internal Medicine',
    'Certification',
    'Microchips Implanting',
    'Bone Surgery & Lameness',
    'Fleas & Tick Control Program',
    'Deworming',

  ];
  int _selectedIndexsort = 0;

  onSharePressed(int i) {
    setState(() {
      _selectedIndexsort = i;
    });
  }
  int petSizeSelected=0;
  _onselectedpetSize(int i){
    setState(() {
      petSizeSelected=i;
    });
  }
  int serviceLocationSelected=0;
  _onselectedserviceLocation(int i){
    setState(() {
      serviceLocationSelected=i;
    });
  }
  int priceRangeSelected=0;
  _onselectedpriceRange(int i){
    setState(() {
      priceRangeSelected=i;
    });
  }
  bool movedown1=false;
  bool movedown2=false;
  bool movedown3=false;
  bool movedown4=false;
  bool movedown5=false;
  bool movedown6=false;
  bool movedown7=false;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).orientation == Orientation.portrait ? widget.cHeight * 0.60 : MediaQuery.of(context).size.height * 0.70,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: widget.cHeight * 0.02, horizontal: widget.cHeight * 0.02),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    VariableText(
                      text: getTranslated(context, 'Filters'),
                      fontcolor: Color(0xFF2C3E50),
                      fontsize: 22,
                      fontFamily: 'sfdb',
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment:MainAxisAlignment.end,
                    children: [
                      VariableText(
                        text: getTranslated(context, 'Clear All'),
                        fontcolor: themeColor1,
                        fontsize: 11,
                        fontFamily: 'sftr',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: DelayedDisplay(
              slidingCurve: Curves.fastLinearToSlowEaseIn,
              delay: Duration(milliseconds: 100),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric( horizontal: 16),

                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        if(movedown1==false){
                          setState(() {
                            movedown1=true;
                            _controller.forward();
                          });
                        }
                        else{
                          setState(() {
                            movedown1=false;
                            _controller.reverse();
                          });
                        }

                      },
                      child: Row(
                        children: [
                          VariableText(
                            text: getTranslated(context, "City"),
                            fontcolor: Color(0xFF2C3E50),
                            fontsize: 15,
                            fontFamily: 'sftr',
                          ),
                          Spacer(),
                          movedown1?RotationTransition(
                              turns: turnsTween.animate(_controller),

                              child: Image.asset('lib/assets/icons/movedown.png',scale: 4,)):Image.asset('lib/assets/icons/movedown.png',scale: 4,)
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      height: 1,
                      color: Color(0xff707070),
                    ),
                    movedown1?Container(): Column(
                      children: [
                        SizedBox(height: 8,),
                        InkWell(
                          onTap: (){
                            if(movedown2==false){
                              setState(() {
                                movedown2=true;
                                _controller1.forward();
                              });
                            }
                            else{
                              setState(() {
                                movedown2=false;
                                _controller1.reverse();
                              });
                            }

                          },
                          child: Row(
                            children: [
                              VariableText(
                                text: getTranslated(context, "Pet Care Service Category"),
                                fontcolor: Color(0xFF2C3E50),
                                fontsize: 15,
                                fontFamily: 'sftr',
                              ),
                              Spacer(),
                              movedown2?RotationTransition(
                                  turns: turnsTween.animate(_controller1),

                                  child: Image.asset('lib/assets/icons/movedown.png',scale: 4,)):Image.asset('lib/assets/icons/movedown.png',scale: 4,)
                            ],
                          ),
                        ),

                        Padding(
                          padding:  EdgeInsets.only(left:20),
                          child:  movedown2?Container():ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: petCareServiceCategory.length,
                              itemBuilder: (BuildContext context, index) {
                                return InkWell(
                                  onTap: () => onSharePressed(index),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        VariableText(
                                          text: getTranslated(context, petCareServiceCategory[index]),
                                          fontcolor: Color(0xFF2C3E50),
                                          fontsize: 15,
                                          fontFamily: 'sftr',
                                        ),
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
                                      ],
                                    ),
                                  ),
                                );
                              }),

                        ),
                        Container(height: 1,
                          color: Color(0xff707070),),
                        SizedBox(height: 8,),
                        InkWell(
                          onTap: (){
                            if(movedown3==false){
                              setState(() {
                                movedown3=true;
                                _controller2.forward();
                              });
                            }
                            else{
                              setState(() {
                                movedown3=false;
                                _controller2.reverse();
                              });
                            }

                          },
                          child: Row(
                            children: [
                              VariableText(
                                text: getTranslated(context, "Vet Care Service Category"),
                                fontcolor: Color(0xFF2C3E50),
                                fontsize: 15,
                                fontFamily: 'sftr',
                              ),
                              Spacer(),
                              movedown3?RotationTransition(
                                  turns: turnsTween.animate(_controller2),

                                  child: Image.asset('lib/assets/icons/movedown.png',scale: 4,)):Image.asset('lib/assets/icons/movedown.png',scale: 4,)
                            ],
                          ),
                        ),
                        SizedBox(height: 8,),

                        Padding(
                          padding:  EdgeInsets.only(left:20),
                          child:  movedown3?Container():ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: vetCareServiceCategory.length,
                              itemBuilder: (BuildContext context, index) {
                                return InkWell(
                                  onTap: () => onSharePressed(index),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        VariableText(
                                          text: getTranslated(context, vetCareServiceCategory[index]),
                                          fontcolor: Color(0xFF2C3E50),
                                          fontsize: 15,
                                          fontFamily: 'sftr',
                                        ),
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
                                      ],
                                    ),
                                  ),
                                );
                              }),

                        ),

                        Container(height: 1,
                          color: Color(0xff707070),),

                        SizedBox(height: 8,),

                        InkWell(
                          onTap: (){
                            if(movedown4==false){
                              setState(() {
                                movedown4=true;
                                _controller3.forward();
                              });
                            }
                            else{
                              setState(() {
                                movedown4=false;
                                _controller3.reverse();
                              });
                            }

                          },
                          child: Row(
                            children: [
                              VariableText(
                                text: getTranslated(context, "Pet Size"),
                                fontcolor: Color(0xFF2C3E50),
                                fontsize: 15,
                                fontFamily: 'sftr',
                              ),
                              Spacer(),
                              movedown4?RotationTransition(
                                  turns: turnsTween.animate(_controller3),

                                  child: Image.asset('lib/assets/icons/movedown.png',scale: 4,)):Image.asset('lib/assets/icons/movedown.png',scale: 4,)
                            ],
                          ),
                        ),
                        SizedBox(height: 8,),
                        movedown4?Container():Row(
                          children:
                          List.generate(petSize.length, (index){

                            return Row(
                              children: [
                                SizedBox(width: widget.cWidth*0.04,),
                                CustomButton(
                                    buttonHeight: widget.cHeight*0.05,
                                    buttonWidth:widget.cWidth*0.25,
                                    buttonBorderRadius:15,
                                    buttonBorderColor: petSizeSelected==index?themeColor2:themeColor1,
                                    buttonFontSize:widget.cHeight*0.018,
                                    buttonTextColor: petSizeSelected==index?themeColor2: Color(0xFF2C3E50),
                                    buttonColor: petSizeSelected==index?themeColor1:themeColor2,
                                    buttonText: petSize[index],
                                    buttonFontFamily:'sftr',
                                    buttonOnTap:(){
                                      _onselectedpetSize(index);
                                    }
                                ),





                              ],
                            );

                          }
                          ),
                        ),

                        SizedBox(height: 8,),
                        Container(height: 1,
                          color: Color(0xff707070),),

                        SizedBox(height: 8,),

                        InkWell(
                          onTap: (){
                            if(movedown5==false){
                              setState(() {
                                movedown5=true;
                                _controller4.forward();
                              });
                            }
                            else{
                              setState(() {
                                movedown5=false;
                                _controller4.reverse();
                              });
                            }

                          },
                          child: Row(
                            children: [
                              VariableText(
                                text: getTranslated(context, "Service Location"),
                                fontcolor: Color(0xFF2C3E50),
                                fontsize: 15,
                                fontFamily: 'sftr',
                              ),
                              Spacer(),
                              movedown5?RotationTransition(
                                  turns: turnsTween.animate(_controller4),

                                  child: Image.asset('lib/assets/icons/movedown.png',scale: 4,)):Image.asset('lib/assets/icons/movedown.png',scale: 4,)
                            ],
                          ),
                        ),
                        SizedBox(height: 8,),
                        movedown5?Container():Row(
                          children:
                          List.generate(petSize.length, (index){

                            return Row(
                              children: [
                                SizedBox(width: widget.cWidth*0.04,),
                                CustomButton(
                                    buttonHeight: widget.cHeight*0.05,
                                    buttonWidth:widget.cWidth*0.25,
                                    buttonBorderRadius:15,

                                    buttonBorderColor: serviceLocationSelected==index?themeColor2:themeColor1,
                                    buttonFontSize:widget.cHeight*0.018,
                                    buttonTextColor: serviceLocationSelected==index?themeColor2: Color(0xFF2C3E50),
                                    buttonColor: serviceLocationSelected==index?themeColor1:themeColor2,
                                    buttonText: serviceLocation[index],
                                    buttonFontFamily:'sftr',
                                    buttonOnTap:(){
                                      _onselectedserviceLocation(index);
                                    }
                                ),





                              ],
                            );

                          }
                          ),
                        ),
                        SizedBox(height: 8,),
                        Container(height: 1,
                          color: Color(0xff707070),),

                        SizedBox(height: 8,),

                        InkWell(
                          onTap: (){
                            if(movedown6==false){
                              setState(() {
                                movedown6=true;
                                _controller5.forward();
                              });
                            }
                            else{
                              setState(() {
                                movedown6=false;
                                _controller5.reverse();
                              });
                            }

                          },
                          child: Row(
                            children: [
                              VariableText(
                                text: getTranslated(context, "Price Range"),
                                fontcolor: Color(0xFF2C3E50),
                                fontsize: 15,
                                fontFamily: 'sftr',
                              ),
                              Spacer(),
                              movedown6?RotationTransition(
                                  turns: turnsTween.animate(_controller5),

                                  child: Image.asset('lib/assets/icons/movedown.png',scale: 4,)):Image.asset('lib/assets/icons/movedown.png',scale: 4,)
                            ],
                          ),
                        ),
                        SizedBox(height: 8,),
                        movedown6?Container():Row(
                          children:
                          List.generate(priceRange.length, (index){

                            return Row(
                              children: [
                                SizedBox(width: widget.cWidth*0.04,),
                                CustomButton(
                                    buttonHeight: widget.cHeight*0.05,
                                    buttonWidth:widget.cWidth*0.25,
                                    buttonBorderRadius:15,

                                    buttonBorderColor: priceRangeSelected==index?themeColor2:themeColor1,
                                    buttonFontSize:widget.cHeight*0.018,
                                    buttonTextColor: priceRangeSelected==index?themeColor2: Color(0xFF2C3E50),
                                    buttonColor: priceRangeSelected==index?themeColor1:themeColor2,
                                    buttonText: priceRange[index],
                                    buttonFontFamily:'sftr',
                                    buttonOnTap:(){
                                      _onselectedpriceRange(index);
                                    }
                                ),





                              ],
                            );

                          }
                          ),
                        ),
                        SizedBox(height: 8,),
                        Container(height: 1,
                          color: Color(0xff707070),),

                        SizedBox(height: 8,),

                        InkWell(
                          onTap: (){
                            if(movedown7==false){
                              setState(() {
                                movedown7=true;
                                _controller6.forward();
                              });
                            }
                            else{
                              setState(() {
                                movedown7=false;
                                _controller6.reverse();
                              });
                            }

                          },
                          child: Row(
                            children: [
                              VariableText(
                                text: getTranslated(context, "Pet Type"),
                                fontcolor: Color(0xFF2C3E50),
                                fontsize: 15,
                                fontFamily: 'sftr',
                              ),
                              Spacer(),
                              movedown7?RotationTransition(
                                  turns: turnsTween.animate(_controller6),

                                  child: Image.asset('lib/assets/icons/movedown.png',scale: 4,)):Image.asset('lib/assets/icons/movedown.png',scale: 4,)
                            ],
                          ),
                        ),
                        SizedBox(height: 8,),
                        movedown7?Container():
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: pets.length,
                            itemBuilder: (BuildContext context,int index){
                              return InkWell(
                                onTap: (){
                                  if(petCheck[index]){
                                    setState(() {
                                      petCheck[index] = false;
                                    });
                                  }else{
                                    setState(() {
                                      petCheck[index] = true;
                                    });
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                                  child: Row(
                                    children: [
                                  /*    CircleAvatar(
                                        radius:widget.cHeight*0.02,
                                        backgroundImage:
                                        AssetImage(pets[index]['image']),
                                        backgroundColor: Color(0xffEAF0F9),
                                      ),*/
                                      VariableText(
                                          text: getTranslated(context, pets[index]['name'].toString()),
                                          fontsize: widget.cHeight*0.017,
                                          fontcolor:Color(0xff2B3E4F),
                                          weight: FontWeight.normal,
                                          fontFamily: 'sftr'),
                                      Spacer(),
                                      Container(
                                        height: widget.cHeight * 0.025,
                                        width: widget.cHeight * 0.025,
                                        decoration: BoxDecoration(
                                            color: petCheck[index] == true ? Color(0xFF00AEEF) : Colors.white,
                                            border: Border.all(color: petCheck[index] == true ? Color(0xFF00AEEF) : Color(0xFFB7B7B7)),
                                            borderRadius: BorderRadius.circular(3)
                                        ),
                                        child: Center(child: Icon(Icons.check, size: 15, color: Colors.white)),
                                      )
                                    ],
                                    /*child: ListTile(
                            leading:
                            CircleAvatar(
                              radius:widget.height*0.02,
                              backgroundImage:
                              AssetImage(pets[index]['image']),
                              backgroundColor: Color(0xffEAF0F9),
                            ),
                            title: VariableText(
                              text: pets[index]['name'],
                              fontsize: widget.height*0.017,
                              fontcolor:defaultindex==index ? themeColor2 : Color(0xff2B3E4F),
                              weight: FontWeight.normal,
                              fontFamily: 'sftr',),
                          ),*/
                                  ),
                                ),
                              );
                            }),

                      ],
                    ),
                  ],
                ),
              ),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              widget.onNext();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: widget.cHeight * 0.06,
                      //width: widget.cWidth,
                      decoration: BoxDecoration(
                          color: Color(0xFF00AEEF),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: VariableText(
                              text: getTranslated(context, 'Apply Filter'),
                              fontsize: 20,
                              fontcolor: Colors.white,
                              fontFamily: 'sfdm')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SpecialitySheet extends StatefulWidget {
  double cHeight;
  double cWidth;
  Function onNext;

  SpecialitySheet({this.onNext, this.cWidth, this.cHeight});

  @override
  _SpecialitySheetState createState() => _SpecialitySheetState();
}

class _SpecialitySheetState extends State<SpecialitySheet> {
  List<String> specialities = [
    'General Consultation',
    'Vaccinations',
    'Dentistry',
    'Internal Medicine',
    'Certification',
  ];
  int _selectedIndexsort = 0;

  onSharePressed(int i) {
    setState(() {
      _selectedIndexsort = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).orientation == Orientation.portrait ? widget.cHeight * 0.40 : MediaQuery.of(context).size.height * 0.70,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: widget.cHeight * 0.02, horizontal: widget.cHeight * 0.02),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    //Spacer(),
                    VariableText(
                      text: getTranslated(context, 'Speciality'),
                      fontcolor: Color(0xFF2C3E50),
                      fontsize: 22,
                      fontFamily: 'sfdb',
                    ),
                    //Spacer(),

                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment:MainAxisAlignment.end,
                  children: [
                    VariableText(
                      text: getTranslated(context, 'Clear All'),
                      fontcolor: themeColor1,
                      fontsize: 11,
                      fontFamily: 'sftr',
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: DelayedDisplay(
              slidingCurve: Curves.fastLinearToSlowEaseIn,
              delay: Duration(milliseconds: 100),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: specialities.length,
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () => onSharePressed(index),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            VariableText(
                              text: getTranslated(context, specialities[index].toString()),
                              fontcolor: Color(0xFF2C3E50),
                              fontsize: 15,
                              fontFamily: 'sftr',
                            ),
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
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
          InkWell(
            onTap: (){
              widget.onNext();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: widget.cHeight * 0.06,
                      //width: widget.cWidth,
                      decoration: BoxDecoration(
                          color: Color(0xFF00AEEF),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: VariableText(
                              text: getTranslated(context, 'Apply'),
                              fontsize: 20,
                              fontcolor: Colors.white,
                              fontFamily: 'sfdm')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceLocationSheet extends StatefulWidget {
  double cHeight;
  double cWidth;
  Function onNext;

  ServiceLocationSheet({this.onNext, this.cWidth, this.cHeight});

  @override
  _ServiceLocationSheetState createState() => _ServiceLocationSheetState();
}

class _ServiceLocationSheetState extends State<ServiceLocationSheet> {
  List<String> serviceLocation = [
    'Online',
    'At Home',
    'Clinic',
  ];
  int _selectedIndexsort = 0;

  onSharePressed(int i) {
    setState(() {
      _selectedIndexsort = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).orientation == Orientation.portrait ? widget.cHeight * 0.40 : MediaQuery.of(context).size.height * 0.70,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: widget.cHeight * 0.02, horizontal: widget.cHeight * 0.02),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    //Spacer(),
                    VariableText(
                      text: getTranslated(context, 'Service Location'),
                      fontcolor: Color(0xFF2C3E50),
                      fontsize: 22,
                      fontFamily: 'sfdb',
                    ),
                    //Spacer(),

                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment:MainAxisAlignment.end,
                  children: [
                    VariableText(
                      text: getTranslated(context, 'Clear All'),
                      fontcolor: themeColor1,
                      fontsize: 11,
                      fontFamily: 'sftr',
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: DelayedDisplay(
              slidingCurve: Curves.fastLinearToSlowEaseIn,
              delay: Duration(milliseconds: 100),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: serviceLocation.length,
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () => onSharePressed(index),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            VariableText(
                              text: getTranslated(context, serviceLocation[index].toString()),
                              fontcolor: Color(0xFF2C3E50),
                              fontsize: 15,
                              fontFamily: 'sftr',
                            ),
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
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
          InkWell(
            onTap: (){
              widget.onNext();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: widget.cHeight * 0.06,
                      //width: widget.cWidth,
                      decoration: BoxDecoration(
                          color: Color(0xFF00AEEF),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: VariableText(
                              text: getTranslated(context, 'Apply'),
                              fontsize: 20,
                              fontcolor: Colors.white,
                              fontFamily: 'sfdm')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}