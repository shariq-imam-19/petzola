import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/my_pets/mypets_main.dart';
import 'package:petzola/screens/appointment/appoinment_details.dart';
import 'package:petzola/screens/services/all_services.dart';
import 'package:petzola/screens/onboarding_screens/onboarding_screen2.dart';

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
        decorationThickness: 3.0,
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
            children: [
              SizedBox(width: widths * 0.04,),
              Container(
                margin: EdgeInsets.only(top: heights * 0.08),
                child: ImageIcon(AssetImage(imageIconPath),size: 24),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8),
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
              ),

            ],
          )),
    );
  }
}


class HomeSliderSpecialOffer extends StatelessWidget {
  var title;
  var subTitle;
  double cHeight;
  double cWidth;
  HomeSliderSpecialOffer(
      {this.title, this.subTitle, this.cHeight, this.cWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: cHeight,
          width: cWidth,
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
                      text: title,
                      fontsize: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16) ,
                    child: VariableText(
                      text: subTitle,
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
                      return Container(
                        width: cWidth * 0.85,
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
                                    EdgeInsets.only(left: cWidth * 0.05),
                                    child: VariableText(
                                      text: '30% Offers',
                                      fontsize: 17,
                                      fontcolor: Color(0xFFF47920),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: cWidth * 0.05,
                                        top: cHeight * 0.05),
                                    child: VariableText(
                                      text: 'Check For Deals For Today',
                                      fontsize: 11,
                                      fontcolor: Color(0xFFF47920),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: cWidth * 0.05,
                                          top: cHeight * 0.05),
                                      child: Container(
                                        height: cHeight * 0.15,
                                        width: cWidth * 0.33,
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
                    padding: const EdgeInsets.only(left: 16),
                    child: VariableText(
                      text: title,
                      fontsize: 20,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => AllServices(serviceList: serviceList)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFE8E8E8)),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: VariableText(
                            text: subTitle,
                            fontsize: 13,
                            fontcolor: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
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
                          Container(
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
                    padding: const EdgeInsets.only(left: 16),
                    child: VariableText(
                      text: widget.title,
                      fontsize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFE8E8E8)),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: VariableText(
                          text: widget.subTitle,
                          fontsize: 13,
                          fontcolor: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
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
                                text: yourVets[index],
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
              /*Container(
                  height: widget.cHeight* 0.50,
                width: widget.cWidth * 0.80,
                color: Colors.yellow,
              ),*/
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
                          /*boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 0), // changes position of shadow
                            ),
                          ],*/
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
                                      text: widget.myVets[index]['name'],
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
              SizedBox(height: 10,),
            ],
          ),
        ),
      ],
    );
  }
}

class HomeSliderMyPets extends StatelessWidget {
  var title;
  var subTitle;
  double cHeight;
  double cWidth;
  HomeSliderMyPets({this.title, this.subTitle, this.cHeight, this.cWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          //height: cHeight * 0.90,
          width: cWidth,
          //color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: VariableText(
                      text: title,
                      fontsize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: VariableText(
                      text: subTitle,
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
                width: cWidth,
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
                            padding: EdgeInsets.only(left: cWidth * 0.05),
                            child: VariableText(
                                text: 'Time To Add Your Best',
                                fontsize: 13,
                                fontcolor: Color(0xFF2C3E50)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: cWidth * 0.05, top: cHeight * 0.01),
                            child: VariableText(
                                text: 'Friend (Your Pet)!',
                                fontsize: 13,
                                fontcolor: Color(0xFF2C3E50)),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: cWidth * 0.05, top: cHeight * 0.05),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => OnboardingScreen2()));
                                },
                                child: Container(
                                  height: cHeight * 0.15,
                                  width: cWidth * 0.31,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: VariableText(
                                      text: 'Add One',
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
                      padding: EdgeInsets.only(top: 20, right: 20, bottom: 20),
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
          height: cHeight * 0.33,
          width: cWidth,
          padding: EdgeInsets.only(left: 16, right: 16),
          //color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: VariableText(
                      text: title,
                      fontsize: 20,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: cWidth,
                padding: EdgeInsets.only(top: 16, bottom: 16),
                //margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //upper
                    Container(
                      padding: EdgeInsets.only(left: 16),
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
                            child: Column(
                              children: [
                                //name & rating
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: cHeight * 0.038, left: 8.0),
                                      child: VariableText(
                                        text: 'Benjamin Hudson',
                                        fontsize: 17,
                                        fontcolor: Color(0xFF2C3E50),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: cHeight * 0.038, left: 10.0),
                                      child: VariableText(
                                        text: '4.8',
                                        fontsize: 11,
                                        fontcolor: Color(0xFF2C3E50),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: cHeight * 0.038,
                                          left: 2.0,
                                          bottom: 5.0),
                                      child: Image.asset(
                                        'lib/assets/icons/appointment_rating.png',
                                        scale: 3.2,
                                      ),
                                    )
                                  ],
                                ),
                                //address
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'lib/assets/icons/appointment_clinic.png',
                                        scale: 3.2,
                                      ),
                                    ),
                                    VariableText(
                                      text: 'United States Medical College',
                                      fontsize: 12,
                                      fontcolor: Color(0xFF2C3E50),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          //home icon
                          Padding(
                            padding:
                            EdgeInsets.only(top: cHeight * 0.02, left: 15),
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
                      padding: EdgeInsets.only(top: cHeight * 0.02, left: cWidth * 0.07, right: 10),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: cHeight * 0.06,
                              //width: cWidth * 0.58,
                              decoration: BoxDecoration(
                                  color: Color(0x70ECF1FA),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10), topRight: Radius.circular(50),
                                      bottomRight: Radius.circular(50)
                                  )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 10.0,
                                    ),
                                    child: VariableText(
                                      text: 'Sun, Jan 19, AT 08:00Am',
                                      fontsize: 11,
                                      fontcolor: Color(0xFF2C3E50),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: cWidth * 0.05, right: cWidth * 0.04),
                                      child: Container(
                                        height: cHeight * 0.035,
                                        width: cWidth * 0.22,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Center(
                                          child: VariableText(
                                            text: 'Confirmed',
                                            fontsize: 11,
                                            fontcolor: Colors.white,
                                          ),
                                        ),
                                      )),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: 0,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          //color: Colors.red,
                                          border: Border.all(color: Colors.white, width: 3)
                                      ),
                                      child: Image.asset(
                                        'lib/assets/images/appointment_pet.png',
                                        scale: 2.2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 20)
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
          height: cHeight * 0.70,
          width: cWidth,
          //color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                width: cWidth,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    //upper
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //image
                          Padding(
                            padding: EdgeInsets.only(
                                top: 15.0, left: cWidth * 0.06, right: 10),
                            child: Image.asset(
                                'lib/assets/images/appointment_doctor.png',
                                scale: 3.3),
                          ),
                          //name address
                          Container(
                            child: Column(
                              children: [
                                //name & rating
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: cHeight * 0.12, left: 8.0),
                                      child: VariableText(
                                        text: 'Benjamin Hudson',
                                        fontsize: 17,
                                        fontcolor: Color(0xFF2C3E50),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: cHeight * 0.12, left: 10.0),
                                      child: VariableText(
                                        text: '4.8',
                                        fontsize: 11,
                                        fontcolor: Color(0xFF2C3E50),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: cHeight * 0.12,
                                          left: 2.0,
                                          bottom: 5.0),
                                      child: Image.asset(
                                        'lib/assets/icons/appointment_rating.png',
                                        scale: 3.2,
                                      ),
                                    )
                                  ],
                                ),
                                //address
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'lib/assets/icons/appointment_clinic.png',
                                        scale: 3.2,
                                      ),
                                    ),
                                    VariableText(
                                      text: 'United States Medical College',
                                      fontsize: 12,
                                      fontcolor: Color(0xFF2C3E50),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          //home icon
                          Padding(
                            padding:
                            EdgeInsets.only(top: cHeight * 0.06, left: 15),
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
                      padding: EdgeInsets.only(top: cHeight * 0.05, left: cWidth * 0.07),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: cHeight * 0.17,
                              //width: cWidth * 0.58,
                              decoration: BoxDecoration(
                                  color: Color(0x70ECF1FA),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10), topRight: Radius.circular(50),
                                      bottomRight: Radius.circular(50)
                                  )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 10.0,
                                    ),
                                    child: VariableText(
                                      text: 'Sun, Jan 19, AT 08:00Am',
                                      fontsize: 11,
                                      fontcolor: Color(0xFF2C3E50),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: cWidth * 0.05, right: cWidth * 0.04),
                                      child: Container(
                                        height: cHeight * 0.10,
                                        width: cWidth * 0.22,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Center(
                                          child: VariableText(
                                            text: 'Confirmed',
                                            fontsize: 11,
                                            fontcolor: Colors.white,
                                          ),
                                        ),
                                      )),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: 0,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white,
                                      ),
                                      child: Image.asset(
                                        'lib/assets/images/appointment_pet.png',
                                        scale: 2.2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 20)
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
                          padding: const EdgeInsets.only(left: 16, bottom: 10, top: 10),
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
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //upper
                                    Container(
                                      padding: EdgeInsets.only(left: 16),
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
                                          Container(
                                            //color: Colors.red,
                                            child: Column(
                                              children: [
                                                //name & rating
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(top: widget.cHeight * 0.035, left: 8.0),
                                                      child: VariableText(
                                                        text:
                                                        monthly[index2]
                                                            .doctorName,
                                                        fontsize: 17,
                                                        fontcolor: Color(
                                                            0xFF2C3E50),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: widget.cHeight * 0.035, left: 10.0),
                                                      child: VariableText(
                                                        text:
                                                        monthly[index2]
                                                            .rating,
                                                        fontsize: 11,
                                                        fontcolor: Color(
                                                            0xFF2C3E50),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: widget.cHeight * 0.035,
                                                          left: 2.0,
                                                          bottom: 5.0),
                                                      child: Image.asset(
                                                        'lib/assets/icons/appointment_rating.png',
                                                        scale: 3.2,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                //address
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(8.0),
                                                      child: Image.asset(
                                                        'lib/assets/icons/appointment_clinic.png',
                                                        scale: 3.2,
                                                      ),
                                                    ),
                                                    VariableText(
                                                      text: monthly[index2]
                                                          .clinicName,
                                                      fontsize: 12,
                                                      fontcolor:
                                                      Color(0xFF2C3E50),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          //home icon
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: widget.cHeight * 0.025,
                                                left: 15),
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
                                      padding: EdgeInsets.only(top: widget.cHeight * 0.01,
                                          left: 16,
                                          right: 10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: widget.cHeight * 0.06,
                                              decoration: BoxDecoration(
                                                  color: Color(0x70ECF1FA),
                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                                      bottomLeft: Radius.circular(10), topRight: Radius.circular(50),
                                                      bottomRight: Radius.circular(50)
                                                  )
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 10.0,
                                                    ),
                                                    child: VariableText(
                                                      text: monthly[index2].date,
                                                      fontsize: 11,
                                                      fontcolor: Color(0xFF2C3E50),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left:
                                                          widget.cWidth * 0.05,
                                                          right: widget.cHeight *
                                                              0.02),
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
                                                            text: 'Confirmed',
                                                            fontsize: 11,
                                                            fontcolor: Colors.white,
                                                          ),
                                                        ),
                                                      )),
                                                  Spacer(),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      right: 0,
                                                    ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(50),
                                                          //color: Colors.white,
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
                                          ),

                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10)
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
                  child: Container(
                    //color: Colors.red,
                    child: Column(
                      children: [
                        Image.asset(widget.myPets[i]['image']),
                        MyPetsSlider.indexx == i
                            ? DelayedDisplay(
                            slidingCurve: Curves.fastLinearToSlowEaseIn,
                            delay: Duration(milliseconds: 100),
                            child: renderPetDetails(i))
                            : Container()
                      ],
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }

  Widget renderPetDetails(int i) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VariableText(
                  text: widget.myPets[i]['name'],
                  fontsize: 20,
                  fontcolor: Color(0xFF2B3E4F)),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Color(0xFFF0F5FC)
                ),
                child: Image.asset(
                  'lib/assets/icons/myPets_share.png',
                  scale: 3.2,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
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
  List<String> vaccineNames;
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
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: VariableText(
                  text: 'Select Vaccines',
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
                            text: 'Select',
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

  MyPetsReminder({this.cHeight, this.cWidth, this.fHeight, this.fWidth});

  @override
  _MyPetsReminderState createState() => _MyPetsReminderState();
}

class _MyPetsReminderState extends State<MyPetsReminder> with TickerProviderStateMixin{
  TabController tabViewController;

  List<String> weekDays = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
  List<String> dailyTime = ['08:00Am', '08:30Am', '09:00Am', '09:30Am'];

  int _selectedIndex = -1;
  double fSize;

  onDaySelected(int i){
    setState(() {
      _selectedIndex = i;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fSize = widget.fHeight / widget.fWidth;
    tabViewController = TabController(length: 4, vsync: this);
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
              child: Container(
                height: widget.cHeight * 0.45,
                width: widget.cWidth * 0.32,
                decoration: BoxDecoration(
                    color: Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: VariableText(
                        text: 'Add Reminder',
                        fontsize: fSize * 7,
                        fontcolor: Color(0x703C3C43),
                        fontFamily: 'sftr')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: VariableText(
                text: 'October, 2021',
                fontcolor: Color(0xFF2B3E4F),
                fontsize: fSize * 7,
                fontFamily: 'sftr',
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
                //physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  renderWeeks2(widget.cHeight, widget.cWidth),
                  renderWeeks2(widget.cHeight, widget.cWidth),
                  renderWeeks2(widget.cHeight, widget.cWidth),
                  renderWeeks2(widget.cHeight, widget.cWidth),
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
            children: List.generate(dailyTime.length, (index){
              return Container(
                //color: Colors.red,
                height: cHeight * 0.40,
                margin: EdgeInsets.symmetric(vertical: 5,),
                child: Row(
                  children: [
                    VariableText(
                        text: dailyTime[index],
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
    );
  }

  Widget renderWeeks2(double cHeight, double cWidth){
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
                          text: '16',
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

  Widget renderWeeks(double cHeight, double cWidth){
    return Container(
      width: cWidth,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: weekDays.length,
              itemBuilder: (BuildContext context, index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    width: cWidth * 0.12,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        VariableText(
                            text: weekDays[index],
                            fontsize: 12,
                            fontcolor: Color(0x703C3C43),
                            fontFamily: 'sftr'),
                        SizedBox(height: 10),
                        VariableText(
                            text: '16',
                            fontsize: 13,
                            fontcolor: Color(0x703C3C43),
                            fontFamily: 'sftr'),
                      ],
                    ),
                  ),
                );
              }),
        ],
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
    return vaccAdded != true ? Column(
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
            text: 'No Entries Found!',
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
                      text: 'Add Vaccination',
                      fontsize: 15,
                      fontcolor: Color(0x603C3C43),
                      fontFamily: 'sftr')),
            ),
          ),
        ),
      ],
    ): Column(
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
                          text: 'Add Vaccination',
                          fontsize: 15,
                          fontcolor: Color(0x603C3C43),
                          fontFamily: 'sftr')),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Image.asset('lib/assets/icons/myVaccination_sort.png', scale: 3.2),
            )
          ],
        ),
        SizedBox(height: 15,),

        Container(
          padding: EdgeInsets.only(left: 16),
          child: Row(
            children: List.generate(vaccinationHistory.length, (index) {
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
                    height: widget.cHeight * 0.45,
                    width: widget.cWidth * 0.30,
                    decoration: BoxDecoration(
                        color: _selectedIndex == index
                            ? Color(0xFF00AEEF)
                            : Color(0xFFF8F7F7),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: VariableText(
                          text: vaccinationHistory[index],
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
            text: 'Now You Can Add Appointments',
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
                      text: 'Add Appointments',
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
                          text: 'Add Appointments',
                          fontsize: 15,
                          fontcolor: Color(0x603C3C43),
                          fontFamily: 'sftr')),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Image.asset('lib/assets/icons/myVaccination_sort.png', scale: 3.2),
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
                child: Container(
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
                          text: appointmentHistory[index],
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
        HomeUpcomingAppointmentsOnly(
            cWidth: widget.cWidth,
            cHeight: widget.cHeight*3),
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
              text: 'Appointments Type',
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
                            text: myServices['services'][index]['name'],
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
                        text: 'Next',
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

  MyMedical({this.cHeight, this.cWidth});

  @override
  _MyMedicalState createState() => _MyMedicalState();
}

class _MyMedicalState extends State<MyMedical> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
            text: 'No Medical Yet',
            fontcolor: Color(0x603C3C43),
            fontsize: 15,
            fontFamily: 'sftr',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: InkWell(
            onTap: () {
            },
            child: Container(
              height: widget.cHeight * 0.45,
              width: widget.cWidth * 0.40,
              decoration: BoxDecoration(
                  color: Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: VariableText(
                      text: 'Add Medical',
                      fontsize: 15,
                      fontcolor: Color(0x603C3C43),
                      fontFamily: 'sftr')),
            ),
          ),
        ),
      ],
    );
  }
}

///Care

class MyCare extends StatefulWidget {
  double cHeight;
  double cWidth;

  MyCare({this.cHeight, this.cWidth});

  @override
  _MyCareState createState() => _MyCareState();
}

class _MyCareState extends State<MyCare> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
            text: 'No Care Yet',
            fontcolor: Color(0x603C3C43),
            fontsize: 15,
            fontFamily: 'sftr',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: InkWell(
            onTap: () {
            },
            child: Container(
              height: widget.cHeight * 0.45,
              width: widget.cWidth * 0.40,
              decoration: BoxDecoration(
                  color: Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: VariableText(
                      text: 'Add Care',
                      fontsize: 15,
                      fontcolor: Color(0x603C3C43),
                      fontFamily: 'sftr')),
            ),
          ),
        ),
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
              text: 'What Service Do You Need',
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
      height: MediaQuery.of(context).orientation == Orientation.portrait ? widget.height * 0.50 : MediaQuery.of(context).size.height * 0.80,
      child: Column(
        children: [
          SizedBox(height: widget.height*0.03,),
          VariableText(text: "Select Pet’s Type",
            fontsize: 22,
            fontcolor: Color(0xff2B3E4F),
            fontFamily: 'sfdr',),
          SizedBox(height: widget.height*0.03,),
          Padding(
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
          SizedBox(height:widget. height*0.01,),

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


