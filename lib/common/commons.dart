import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/global_variables.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
import 'package:petzola/models/chatMessageModel.dart';
import 'package:petzola/screens/home/home_page.dart';
import 'package:petzola/screens/messege/messege_details_Screen.dart';
import 'package:petzola/screens/messege/messege_screen.dart';
import 'package:petzola/screens/notification/notification_screen.dart';
import 'package:petzola/screens/services/clinic_detail.dart';
import 'dart:math' as math;

class CustomButton extends StatefulWidget {
  final double buttonHeight,buttonWidth,buttonBorderRadius,buttonFontSize;
  final Color buttonColor,buttonTextColor,buttonBorderColor;
  final String buttonText,buttonFontFamily;
  final Function buttonOnTap;
  const CustomButton({
    this.buttonHeight,
    this.buttonWidth,
    this.buttonBorderRadius,
    this.buttonFontSize,
    this.buttonBorderColor=Colors.transparent,
    this.buttonColor,
    this.buttonTextColor,
    this.buttonText,
    this.buttonFontFamily,
    this.buttonOnTap

  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}
class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: widget.buttonOnTap,
      child: Container(
        height: widget.buttonHeight,
        width: widget.buttonWidth,

        decoration: BoxDecoration(
          border: Border.all(color:widget.buttonBorderColor ),
            borderRadius: BorderRadius.circular(widget.buttonBorderRadius),
            color: widget.buttonColor
        ),
        child: Center(
          child: VariableText(
            text: widget.buttonText,
            fontcolor: widget.buttonTextColor,
            fontFamily: widget.buttonFontFamily,
            fontsize: widget.buttonFontSize,
          ),
        ),
      ),
    );
  }
}

class RectangluartextFeild extends StatelessWidget {
  final String text;
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
  final int maxLines;
  final String obscuringCharacter;

  const RectangluartextFeild({
    /*this.inputFormatter,*/ this.textlength,
    this.text,
    this.maxLines=1,
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

    return Container(
        decoration: BoxDecoration(
          color: Color(0xffF5F8FA),
          borderRadius: BorderRadius.circular(8),
        ),
        height: heights,
        width: widths,
        child:
        Padding(
          padding: const EdgeInsets.only(right: 8.0,top: 8,bottom: 8,left: 20),
          child:
          TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(textlength),
            ],
            enabled: enable,
            style: TextStyle(
              fontSize:  fontsize,
              color: textColor,
              fontFamily: 'sftr',

            ),
            onChanged: onChanged,
            maxLines: maxLines,
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

                  color:hinttextColor
                /* Color(
                    0xff3C3C43,
                  )*/),
            ),
          ),
        ));
  }
}
class RectangluartextFeildWithIcon extends StatelessWidget {
  final String text,imageIconPath;
  final Function onTap;
  final double heights;
  final double widths;
  final bool enable;
  final int maxLines;
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

  final Color color,textcolor;
  final int length;
  final int textlength;

  //final Array inputFormatter;

  final double fontsize;
  final String obscuringCharacter;

  const RectangluartextFeildWithIcon({
    /*this.inputFormatter,*/ this.textlength,
    this.maxLines=1,
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
    this.textcolor=hinttextColor,
    this.icon,
    this.length,
    this.widths=0.0,
    this.obscuringCharacter = "*",
    this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Container(
        decoration: BoxDecoration(
          color: Color(0xffF5F8FA),
          borderRadius: BorderRadius.circular(8),
        ),
        height: heights,
        width: widths,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0,top: 0,bottom: 0,left: 10),
                child: TextFormField(
                  enabled: enable,
                  maxLines: maxLines,
                  obscureText:texthidden ,
                  obscuringCharacter: obscuringCharacter,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(textlength),
                  ],
                  style: TextStyle(
                    fontSize:  fontsize,
                    color:textColor,
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

                      color:textcolor,),
                  ),
                ),
              ),
            ),
            /*Padding(
              padding: const EdgeInsets.only(right: 8.0,top: 0,bottom: 0,left: 10),
              child: TextFormField(
                enabled: enable,
                maxLines: maxLines,
                obscureText:texthidden ,
                obscuringCharacter: obscuringCharacter,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(textlength),
                ],
                style: TextStyle(
                  fontSize:  fontsize,
                  color:textColor,
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

                    color:textcolor,),
                ),
              ),
            ),*/
            Padding(
              padding:  EdgeInsets.all(heights*0.3),
              child:
              Align(
                  alignment: currLang == 'ar' ? Alignment.centerLeft : Alignment.centerRight,
                  child: InkWell(
                      onTap: onTap,
                      child: ImageIcon(AssetImage(imageIconPath),size: heights*0.5))),
            ),

          ],
        ));
  }
}
class RectangluartextFeildWithStartIcon extends StatelessWidget {
  final String text,imageIconPath;
  final Function onTap;
  final double heights;
  final double widths;
  final bool enable;
  final Function onChanged;
  final TextEditingController cont;
  final FocusNode fnode;
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

  const RectangluartextFeildWithStartIcon({
    /*this.inputFormatter,*/ this.textlength,
    this.fnode,
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
    this.widths=0.0,
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
        padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Color(0xffF5F8FA),
            borderRadius: BorderRadius.circular(8),
          ),
          height: heights,
          width: widths,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child:
                    currLang == 'ar' ?
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: Container(
                    //color: Colors.red,
                    child: ImageIcon(AssetImage(imageIconPath)),
                  ),
                ) : Container(
                      child: ImageIcon(AssetImage(imageIconPath)),
                    ),
              ),
              SizedBox(width: 5,),
              Expanded(
                flex: 22,
                child: Container(
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
                    focusNode: fnode,
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
              )
            ],
          )),
    );
  }
}
class ChangeOrientationIcon extends StatelessWidget {
  final Function ontap;
  final double size;
  ChangeOrientationIcon({
    this.ontap,
    this.size
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:size*0.01,right: size*0.01,bottom: size*0.01,top: size*0.02),
      child: Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: ontap,
            child: Container(
              height:  size*0.04,
              width: size*0.04,
              decoration: BoxDecoration(
                  color:  Color(0x14767680),
                  borderRadius: BorderRadius.circular(15)

              ),
              child: Icon(Icons.clear,size: 16,color: Color(0x9c3C3C43),),


            )

            /*     CircleAvatar(



              backgroundColor: Color(0x0c767680),
              backgroundImage: AssetImage("lib/assets/icons/cross.png"),
              maxRadius:  20,
             // maxRadius:  size*0.014,
              minRadius: 20,
             // minRadius: size*0.014,
            )*/,
          )
      ),
    );
  }
}
class CustomApploginRegistration extends StatelessWidget {
  final Function ontap;
  final double size;
  final String text;
  CustomApploginRegistration({
    this.ontap,
    this.size,
    this.text
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:  EdgeInsets.only(left:size*0.01,right: size*0.01,bottom: size*0.01,top: size*0.04),
        child:

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              onTap: ontap,
              child:
              Container(
                height: size*0.04,
                width: size*0.04,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular( size*0.05),
                  color:  Color(0x0c767680),
                ),
                child: Image.asset("lib/assets/icons/appbar_back.png",scale: 3.5,),
              ),

            ),
            VariableText(text:text ,fontFamily: "sftsb",fontsize: size*0.022,),
            Container(width: size*0.05  , height: 0,),

          ],)

    );
  }
}
class CustomMenuAppBar extends StatelessWidget {
  final double size;
  final String title;
  CustomMenuAppBar({this.size,this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      titleSpacing: 0,
      centerTitle: true,
      leadingWidth: 65,
      title: VariableText(text: getTranslated(context, title.toString()) , fontcolor: Color(0xFF2C3E50), fontsize: 17, fontFamily: 'sftsb',),
      leading: Container(
        margin: EdgeInsets.only(left: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          currLang == 'ar' ?
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFEAF0F9),
                borderRadius: BorderRadius.circular(60)
            ),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: IconButton(icon: Image.asset('lib/assets/icons/appbar_back.png', scale: 3.2,),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ),
          ) :
              Container(
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
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>MainNotificationScreen()));

          },
          child: SizedBox(
            width: 26,
            child: Image.asset("lib/assets/icons/notification2x.png"),
          ),
        ),
        SizedBox(width: 12),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_)=>MainMessegeScreen()));

          },
          child: SizedBox(
            width: 26,
            child: Image.asset("lib/assets/icons/chat2x.png"),
          ),
        ),
        SizedBox(width: 16,),
      ],
    );

  }
}

class CustomAppBarHome extends StatefulWidget {
  final double size;
  final String title;
  bool showHome;
  bool isArabic;
  CustomAppBarHome({this.size,this.title, this.showHome=true, this.isArabic = true});

  @override
  _CustomAppBarHomeState createState() => _CustomAppBarHomeState();
}

class _CustomAppBarHomeState extends State<CustomAppBarHome> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      titleSpacing: 0,
      centerTitle: true,
      leadingWidth: 65,
      title: VariableText(text: widget.isArabic == true ? getTranslated(context, widget.title.toString()) : widget.title , fontcolor: Color(0xFF2C3E50), fontsize: 17, fontFamily: 'sftsb',),
      leading: Container(
        margin: EdgeInsets.only(left: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          currLang == 'ar' ?
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFEAF0F9),
                borderRadius: BorderRadius.circular(60)
            ),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: IconButton(icon: Image.asset('lib/assets/icons/appbar_back.png', scale: 3.2,),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ),
          ) :
          Container(
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
        widget.showHome == true ?
        InkWell(
          onTap: (){
            Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (_)=>HomePage(pageIndex: 2,)),(route)=>route.isCurrent);
          },
          child: SizedBox(
            width: 26,
            child: Image.asset("lib/assets/icons/home.png", color: Colors.black87,),
          ),
        ): Container(),
        SizedBox(width: 12),
      ],
    );

  }
}
class AppCheckbox extends StatelessWidget {
  final bool value;
  final bool disabled;
  final double size;
  final ValueChanged<bool> onChanged;

  const AppCheckbox({
    Key key,
    this.size ,
    this.value = false,
    this.disabled = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backColor = disabled ? Colors.white : Colors.white24;
    final checkColor = disabled ? Colors.white24 : Colors.white;

    return Theme(
      data: Theme.of(context).copyWith(
        disabledColor: Colors.transparent,
        unselectedWidgetColor: Colors.transparent,
      ),
      child: SizedBox(
        width: size,
        height: size,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            border: Border.all(color:Color(0xffDBDBDB)),
            borderRadius: BorderRadius.circular(4),
          ),
          clipBehavior: Clip.hardEdge,
          child: Transform.scale(
            scale: size / Checkbox.width,
            child: Checkbox(
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              activeColor: Colors.transparent,
              checkColor: checkColor,
              value: value,
              onChanged: disabled
                  ? null
                  : (value) {
                onChanged(value);
              },
            ),
          ),
        ),
      ),
    );
  }
}
class CustomLoadingAnimation extends StatelessWidget {
  final double height,width,animationPercent;
  final Function onTap;
  CustomLoadingAnimation({this.height,this.width,this.onTap,this.animationPercent});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onTap,

          child: CircularPercentIndicator(
            radius: height*0.093,
            lineWidth: 8.0,
            percent: animationPercent,
            animation: true,
            animationDuration: 2000,
            center:    Container(
              height: height*0.050,
              width: height*0.050,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular( height*0.05),
                color:Color(0x4800AEEF),
              ),
              child: Image.asset("lib/assets/icons/rigtharrow.png",scale: 4.5,color: themeColor1,),
            ),
            backgroundColor: Color(0x4800AEEF),
            progressColor: themeColor1,

          ),
        ),
        Padding(
          padding:  EdgeInsets.only(left:height*0.04),
          child: Container(
            height: 10,
            width: 10,
            color:themeColor2,
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(top:height*0.04),
          child: Container(
            height: 10,
            width: 12,
            color:themeColor2,
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(left:height*0.08,top:height*0.04),
          child: Container(
            height: 10,
            width: 10,
            color:themeColor2,
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(left:height*0.04,top:height*0.08),
          child: Container(
            height: 10,
            width: 10,
            color:themeColor2,
          ),
        ),

      ],
    );
  }
}
class FavouriteContainer extends StatelessWidget {
  var title;
  var subTitle;
  double cHeight;
  double cWidth;
  FavouriteContainer({this.title, this.subTitle, this.cHeight, this.cWidth});

  @override
  Widget build(BuildContext context) {
    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        return Container(
          width: cHeight,
          decoration: BoxDecoration(
              color: themeColor2,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0x6c2B3E4F),width: 0.3)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: cHeight*0.02,),
              //upper
              Container(
                child: Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //image
                        Container(
                            height: cHeight*0.20,
                            width: cWidth*0.25,
                            // color:themeColor2,
                            child: Image.asset('lib/assets/icons/doctoricon.png', scale: 2.3)),
                        //name address
                        Container(
                          //color: Colors.pink,
                          height: cHeight*0.20,
                          width: cWidth*0.64,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: cHeight*0.04,),
                              //name & rating
                              Row(
                                children: [
                                  VariableText(text: 'Bobby Clark', fontsize: 17, fontcolor: Color(0xFF2C3E50),),
                                  Padding(
                                    padding: EdgeInsets.only( left: 10.0),
                                    child: VariableText(text: '4.8', fontsize: 11, fontcolor: Color(0xFF2C3E50),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only( left: 2.0, bottom: 5.0),
                                    child: Image.asset('lib/assets/icons/appointment_rating.png', scale: 3.2,),
                                  )
                                ],
                              ),
                              SizedBox(height: cHeight*0.01,),
                              VariableText(text: 'Senior Cordiologist And Surgeon', fontsize: cHeight*0.015, fontFamily:'sftr',fontcolor: Color(0x3c3C3C43),),
                              SizedBox(height: cHeight*0.01,),
                              //address
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only( right: cHeight*0.01),

                                    child: Image.asset('lib/assets/icons/appointment_clinic.png', scale: 3.2,),
                                  ),
                                  VariableText(text: 'United States Medical College', fontsize: cHeight*0.017,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),
                                ],
                              ),
                              SizedBox(height: cHeight*0.019,),
                              //address
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only( right: cHeight*0.01),

                                    child:  VariableText(text: 'Perth:', fontsize: cHeight*0.017,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),
                                  ),
                                  VariableText(text: 'El Metro', fontsize: cHeight*0.017,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                ],
                              ),
                            ],
                          ),
                        ),
                        //home icon
                        /*  Padding(
                      padding: EdgeInsets.only(top: cHeight * 0.06, left: 15),
                      child: Image.asset('lib/assets/icons/appointment_home.png', scale: 3.2,),
                    )*/
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding:  EdgeInsets.only(top:cHeight* 0.0055,right: cHeight*0.025),
                        child: Container(
                          height: 30,
                          width: 30,
                          // color: Colors.red,
                          child: Image.asset('lib/assets/icons/fillhearticon.png', scale: 3.2,),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding:  EdgeInsets.only(top:cHeight* 0.125,right: cHeight*0.015),
                        child: Container(
                          height: cHeight*0.08,
                          width: cWidth*0.20,

                          child:
                          Row(
                            children: [
                              Spacer(),
                              VariableText(text: '426', fontsize: cHeight*0.030,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                              SizedBox(width: cHeight*0.0050,),
                              Column(
                                children: [
                                  SizedBox(height: cHeight*0.05,),
                                  VariableText(text: 'Eg', fontsize: cHeight*0.017,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                ],
                              )

                            ],
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //color: Colors.grey,
                height: cHeight*0.10,
                width: cWidth,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    InkWell(
                      onTap:(){},
                      child: Container(
                        height:cHeight*0.06,
                        width: cWidth*0.43,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffF0F5FC)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal:cHeight*0.01),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('lib/assets/icons/chaticon.png', scale: 4.2,),
                              SizedBox(width: cHeight*0.01,),
                              VariableText(
                                text:"Receptionist" ,
                                fontcolor: Color(0xff2B3E4F),
                                fontFamily:'sfdm',
                                fontsize: cHeight*0.020,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: cHeight*0.03,),
                    CustomButton(
                        buttonHeight: cHeight*0.06,
                        buttonWidth:  cWidth*0.43,
                        buttonBorderRadius:8,
                        buttonFontSize:cHeight*0.023,
                        buttonColor:themeColor1,
                        buttonTextColor:themeColor2,
                        buttonText: "Order Now",
                        buttonFontFamily:'sfdm',
                        buttonOnTap:(){
                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        }
                    ),
                  ],
                ),
              ),
              SizedBox(height: cHeight*0.01)





            ],
          ),
        );

      case Orientation.portrait:
      return Container(
        width: cWidth,
        decoration: BoxDecoration(
            color: themeColor2,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0x6c2B3E4F),width: 0.3)
        ),
        child: Column(
          children: [
            SizedBox(height: cHeight*0.02,),
            //upper
            Container(
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //image
                      Container(
                          height: cHeight*0.20,
                          width: cWidth*0.25,
                          // color:themeColor2,
                          child: Image.asset('lib/assets/icons/doctoricon.png', scale: 2.3)),
                      //name address
                      Container(
                        //color: Colors.pink,
                        height: cHeight*0.20,
                        width: cWidth*0.64,
                        child: Column(
                          children: [
                            SizedBox(height: cHeight*0.04,),
                            //name & rating
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only( left:cHeight*0.019),
                                  child: VariableText(text: 'Bobby Clark', fontsize: 17, fontcolor: Color(0xFF2C3E50),),
                                ),
                                Padding(
                                  padding: EdgeInsets.only( left: 10.0),
                                  child: VariableText(text: '4.8', fontsize: 11, fontcolor: Color(0xFF2C3E50),),
                                ),
                                Padding(
                                  padding: EdgeInsets.only( left: 2.0, bottom: 5.0),
                                  child: Image.asset('lib/assets/icons/appointment_rating.png', scale: 3.2,),
                                )
                              ],
                            ),
                            SizedBox(height: cHeight*0.01,),
                            Padding(
                              padding:  EdgeInsets.only(right:cHeight*0.028),
                              child: VariableText(text: 'Senior Cordiologist And Surgeon', fontsize: cHeight*0.015, fontFamily:'sftr',fontcolor: Color(0x3c3C3C43),),
                            ),
                            SizedBox(height: cHeight*0.01,),
                            //address
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only( left:cHeight*0.019,right: cHeight*0.01),

                                  child: Image.asset('lib/assets/icons/appointment_clinic.png', scale: 3.2,),
                                ),
                                VariableText(text: 'United States Medical College', fontsize: cHeight*0.017,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),
                              ],
                            ),
                            SizedBox(height: cHeight*0.019,),
                            //address
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only( left:cHeight*0.019,right: cHeight*0.01),

                                  child:  VariableText(text: 'Perth:', fontsize: cHeight*0.017,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),
                                ),
                                VariableText(text: 'El Metro', fontsize: cHeight*0.017,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //home icon
                      /*  Padding(
                      padding: EdgeInsets.only(top: cHeight * 0.06, left: 15),
                      child: Image.asset('lib/assets/icons/appointment_home.png', scale: 3.2,),
                    )*/
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding:  EdgeInsets.only(top:cHeight* 0.0055,right: cHeight*0.025),
                      child: Container(
                        height: 30,
                        width: 30,
                        // color: Colors.red,
                        child: Image.asset('lib/assets/icons/fillhearticon.png', scale: 3.2,),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding:  EdgeInsets.only(top:cHeight* 0.125,right: cHeight*0.035),
                      child: Container(
                        height: cHeight*0.08,
                        width: cWidth*0.20,

                        child: Row(
                          children: [
                            VariableText(text: '426', fontsize: cHeight*0.030,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                            SizedBox(width: cHeight*0.0050,),
                            Column(
                              children: [
                                SizedBox(height: cHeight*0.05,),
                                VariableText(text: 'Eg', fontsize: cHeight*0.017,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                              ],
                            )

                          ],
                        ),

                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //color: Colors.grey,
              height: cHeight*0.10,
              width: cWidth,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  InkWell(
                    onTap:(){},
                    child: Container(
                      height:cHeight*0.06,
                      width: cWidth*0.38,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffF0F5FC)
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal:cHeight*0.01),
                        child: Row(
                          children: [
                            Image.asset('lib/assets/icons/chaticon.png', scale: 4.2,),
                            SizedBox(width: cHeight*0.01,),
                            VariableText(
                              text:"Receptionist" ,
                              fontcolor: Color(0xff2B3E4F),
                              fontFamily:'sfdm',
                              fontsize: cHeight*0.020,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: cHeight*0.03,),
                  CustomButton(
                      buttonHeight: cHeight*0.06,
                      buttonWidth:  cWidth*0.38,
                      buttonBorderRadius:8,
                      buttonFontSize:cHeight*0.023,
                      buttonColor:themeColor1,
                      buttonTextColor:themeColor2,
                      buttonText: "Order Now",
                      buttonFontFamily:'sfdm',
                      buttonOnTap:(){
                        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      }
                  ),
                ],
              ),
            ),
            SizedBox(height: cHeight*0.01)





          ],
        ),
      );

    }

  }
}

class CustomBlogContainer extends StatefulWidget {
  final double height,width;
  final bool orientation;
  Function onTap,onTapComment;
  CustomBlogContainer({this.height,
    this.width,this.orientation,this.onTap,
    this.onTapComment});



  @override
  _CustomBlogContainerState createState() => _CustomBlogContainerState();
}

class _CustomBlogContainerState extends State<CustomBlogContainer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    switch(MediaQuery.of(context).orientation){
      case Orientation.landscape:
        return Container(

          width: widget.width,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0x6c2B3E4F),width: 0.3),
            borderRadius: BorderRadius.circular(widget.width*0.015),


          ),
          child: Column(
            children: [
              Container(
                height: widget.width*0.10,
                width: widget.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(widget.width*0.015),topRight: Radius.circular(widget.width*0.015)),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal:widget.width*0.05),
                  child: Row(

                    children: [
                      Image.asset("lib/assets/icons/dots.png",scale:widget.width*0.005,),
                      SizedBox(width: widget.width*0.055,),
                      Container(
                        child: Row(
                          children: [
                            CircleAvatar(
                            backgroundImage: AssetImage('lib/assets/icons/personicon.png'),
                          ),
                            SizedBox(width: widget.width*0.015,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                VariableText(text: "   Walid Eisa",
                                  fontFamily: 'sfpr',
                                  fontsize: widget.width*0.015,
                                  fontcolor: Color(0xff2B3E4F),),
                                VariableText(text: "23 Jan 2021",
                                  fontFamily: 'sfrr',
                                  fontsize: widget.width*0.013,
                                  fontcolor: Color(0x6c3C3C43),),

                              ],
                            ),],
                        ),
                      ),
                      Spacer(),
                      //SizedBox(width: widget.width*0.44,),
                      Container(
                        height: widget.width*0.04,
                        width: widget.width*0.16,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(widget.width*0.01),
                            border: Border.all(color: themeColor1)
                        ),
                        child:   Center(
                          child: VariableText(text: "Follow",
                              fontFamily: 'sfrr',
                              fontsize: widget.width*0.013,
                              fontcolor: themeColor1),
                        ),
                      )





                    ],
                  ),
                ),



              ),
              Container(
                height: widget.width*0.25,
                width: widget.width,
                color: Color(0x28F47920),
                child: Image.asset("lib/assets/icons/glaasesdog.png",scale:widget.width*0.005,),


              ),
              Container(
                height: widget.width*0.08,
                width: widget.width,

                child:  Padding(
                  padding:  EdgeInsets.all(widget.width*0.03),
                  child: VariableText(text: "Bonjour Les Yummy Potes ! Je Vous Souhaite Un Bon Dimanche 😘😘",
                    fontFamily: 'sftsb',
                    fontsize: widget.width*0.015,
                    fontcolor: Color(0xff2B3E4F),),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:widget.width*0.04),
                child: Container(
                  width: widget.width,
                  //color: Colors.pinkAccent,
                  child: Column(
                    children: [
                      Container(
                        height: 1,
                        color: Color(0xffE8E8E8),),
                      Padding(
                        padding:  EdgeInsets.only(top: 8.0,bottom: 8),
                        child: Row(
                          children: [
                            Image.asset("lib/assets/icons/like.png",scale: 2.5,),
                            SizedBox(width: widget.width*0.015,),
                            VariableText(text: "64 Like ",
                              fontFamily: 'sftr',
                              fontsize: widget.width*0.015,
                              fontcolor: Color(0xff2B3E4F),),
                            SizedBox(width: widget.width*0.04,),
                            InkWell(
                                onTap: widget.onTapComment,
                                child: Image.asset("lib/assets/icons/comment.png",scale: 2.5,)),
                            SizedBox(width: widget.width*0.015,),
                            InkWell(
                              onTap: widget.onTapComment,
                              child: VariableText(text: "32 Comment",
                                fontFamily: 'sftr',
                                fontsize: widget.width*0.015,
                                fontcolor: Color(0xff2B3E4F),),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Color(0xffE8E8E8),),
                      SizedBox(height: widget.width*0.015,),
                    ],
                  ),
                ),
              ),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal:widget.width*0.04),

                child: InkWell(
                  onTap: (){
                    CommentBottomSheet(widget.height,widget.width,context);
                  },
                  child: Container(
                    height: widget.width*0.10,
                    width: widget.width*0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(widget.width*0.015),bottomRight: Radius.circular(widget.width*0.015)),

                    ),
                    child:
                    Row(

                      children: [


                        CircleAvatar(
                          backgroundImage:
                          AssetImage("lib/assets/icons/personicon.png"),
                          backgroundColor: Colors.red,),
                        SizedBox(width: widget.width*0.01,),

                        Container(
                          padding: EdgeInsets.only(left: 10, bottom: 10, top: 10,right: 10),
                          height: widget.width*0.06,
                          width: widget.width*0.801,
                          decoration:  BoxDecoration(
                            color: Color(0xffF0F5FC),
                            borderRadius: BorderRadius.all(
                                Radius.circular(widget.width*0.02) //                 <--- border radius here
                            ),
                          ),
                          child:
                          Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  enabled: false,
                                  style:  TextStyle(color: Color(0xff2B3E4F),
                                      fontSize: widget.height*0.015,fontFamily: 'sftr'),
                                  decoration: InputDecoration(
                                    contentPadding: currLang == 'ar' ? EdgeInsets.symmetric(vertical: 8) : EdgeInsets.symmetric(vertical: 12),
                                      hintText: getTranslated(context, "Write A Comment"),
                                      hintStyle: TextStyle(color: Color(0xfc3C3C43),
                                          fontSize: widget.height*0.015,fontFamily: 'sftr'),

                                      border: InputBorder.none),
                                ),
                              ),
                              Spacer(),
                              Image.asset("lib/assets/icons/cameraicon.png",scale: widget.height*0.0035,),
                            ],
                          )
                        ),

                      ],
                    ),

                  ),
                ),
              )
            ],

          ),
        );
      case Orientation.portrait:
        return Container(
          width: widget.width,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0x6c2B3E4F),width: 0.3),
            borderRadius: BorderRadius.circular(widget.height*0.015),
          ),
          child: Column(
            children: [
              Container(
                height:widget.height*0.10,
                width: widget.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(widget.height*0.015),topRight: Radius.circular(widget.height*0.015)),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal:widget.height*0.025),
                  child: Row(

                    children: [
                      Image.asset("lib/assets/icons/dots.png",scale:widget.height*0.005,),
                      SizedBox(width: widget.height*0.015,),
                      InkWell(
                        onTap: widget.onTap,
                        child:
                        Container(
                          child:
                          Row(
                            children: [  CircleAvatar(
                              backgroundImage: AssetImage('lib/assets/icons/personicon.png'),
                            ),
                              SizedBox(width: widget.height*0.015,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  VariableText(text: "   Walid Eisa",
                                    fontFamily: 'sfpr',
                                    fontsize: widget.height*0.015,
                                    fontcolor: Color(0xff2B3E4F),),
                                  VariableText(text: "23 Jan 2021",
                                    fontFamily: 'sfrr',
                                    fontsize: widget.height*0.013,
                                    fontcolor: Color(0x6c3C3C43),),

                                ],
                              ),],
                          ),
                        ),
                      ),
                     // SizedBox(width: widget.height*0.10,),
                      Spacer(),
                      Container(
                        height: widget.height*0.04,
                        width: widget.width*0.16,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(widget.height*0.01),
                            border: Border.all(color: themeColor1)
                        ),
                        child:   Center(
                          child: VariableText(text: getTranslated(context, "Follow"),
                              fontFamily: 'sfrr',
                              fontsize: widget.height*0.013,
                              fontcolor: themeColor1),
                        ),
                      )





                    ],
                  ),
                ),



              ),
              Container(
                height: widget.height*0.25,
                width: widget.width,
                color: Color(0x28F47920),
                child: Image.asset("lib/assets/icons/glaasesdog.png",scale:widget.height*0.005,),


              ),
              Container(
                height: widget.height*0.08,
                width: widget.width,

                child:  Padding(
                  padding:   EdgeInsets.all(widget.height*0.02),
                  child: VariableText(text: "Bonjour Les Yummy Potes ! Je Vous Souhaite Un Bon Dimanche 😘😘",
                    fontFamily: 'sftsb',
                    fontsize: widget.height*0.015,
                    fontcolor: Color(0xff2B3E4F),),
                ),
              ),
              Padding(
                padding:  widget.orientation?EdgeInsets.symmetric(horizontal:widget.height*0.04): EdgeInsets.symmetric(horizontal:widget.height*0.02),
                child: Container(
                  width:widget. width,
                  //color: Colors.pinkAccent,
                  child: Column(
                    children: [
                      Container(
                        height: 1,
                        color: Color(0xffE8E8E8),),
                      Padding(
                        padding:  EdgeInsets.only(top: 8.0,bottom: 8),
                        child: Row(
                          children: [
                            Image.asset("lib/assets/icons/like.png",scale: 2.5,),
                            SizedBox(width: widget.height*0.015,),
                            VariableText(text: "64 Like",
                              fontFamily: 'sftr',
                              fontsize: widget.height*0.015,
                              fontcolor: Color(0xff2B3E4F),),
                            SizedBox(width: widget.height*0.04,),
                            InkWell(
                                onTap: widget.onTapComment,
                                child: Image.asset("lib/assets/icons/comment.png",scale: 2.5,)),
                            SizedBox(width: widget.height*0.015,),
                            InkWell(
                              onTap: widget.onTapComment,
                              child: VariableText(text: "32 Comment",
                                fontFamily: 'sftr',
                                fontsize: widget.height*0.015,
                                fontcolor: Color(0xff2B3E4F),),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Color(0xffE8E8E8),),
                      SizedBox(height: widget.height*0.015,),
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: (){
                  CommentBottomSheet(widget.height,widget.width,context);
                },
                child: Container(
                  height: widget.height*0.10,
                  width:widget. width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(widget.height*0.015),bottomRight: Radius.circular(widget.height*0.015)),

                  ),
                  child:
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width:widget. height*0.01,),

                      CircleAvatar(
                        backgroundImage:
                        AssetImage("lib/assets/icons/personicon.png"),
                        backgroundColor: Colors.red,),
                      SizedBox(width:widget. height*0.01,),

                      Container(
                        padding: EdgeInsets.only(left: 10, bottom: 10, top: 10,right: 10),
                        height: widget.height*0.06,
                        width:widget. width*0.72,
                        decoration:  BoxDecoration(
                          color: Color(0xffF0F5FC),
                          borderRadius: BorderRadius.all(
                              Radius.circular(widget.height*0.02) //                 <--- border radius here
                          ),
                        ),
                        child:
                        Row(
                          children: [
                            Flexible(
                              child: TextField(
                                enabled: false,
                                style:  TextStyle(color: Color(0xff2B3E4F),
                                    fontSize:widget. height*0.015,fontFamily: 'sftr'),

                                decoration: InputDecoration(
                                  contentPadding: currLang == 'ar' ? EdgeInsets.symmetric(vertical:9) : EdgeInsets.symmetric(vertical: 12),
                                    hintText: getTranslated(context, "Write A Comment"),
                                    hintStyle: TextStyle(color: Color(0xfc3C3C43),
                                        fontSize: widget.height*0.015,fontFamily: 'sftr'),

                                    border: InputBorder.none),
                              ),
                            ),
                            Image.asset("lib/assets/icons/cameraicon.png",scale: widget.height*0.0035,),

                          ],
                        ),
                      ),

                    ],
                  ),

                ),
              )
            ],

          ),
        );


    }
  }}

List<ChatMessage> messages = [
  ChatMessage(
      messageContent: "Mauris Neque Nisi, Faucibus Non,",),
  ChatMessage(messageContent: "Convallis Et Eros.", ),
  ChatMessage(messageContent: " 😘  😘 😘 😘", ),
];
final _controller = TextEditingController();
void CommentBottomSheet(double height,double width,BuildContext context){
  showModalBottomSheet(
      isScrollControlled: true,
      //transitionAnimationController: controller,
      backgroundColor: Colors.transparent,

      context: context, builder: (context) {

    return DraggableScrollableSheet(
        initialChildSize: 0.70, //set this as you want
        maxChildSize:0.70, //set this as you want
        minChildSize:0.70, //set this as you want
        expand: false,
        builder: (context, scrollController) {
          return
            Comments(height: height,width: width,);
          //whatever you're returning, does not have to be a Container
        }

    );
  });

}
class Comments extends StatefulWidget {
  final double height,width;
  Comments({this.height,this.width});


  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    switch(MediaQuery.of(context).orientation){
      case Orientation.landscape:

        return  Container(

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft:Radius.circular(widget.height*0.05) ,
                topRight: Radius.circular(widget.height*0.05)
            ),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height:widget.height*0.02,),
                VariableText(text: getTranslated(context, "Comments"),
                  fontsize: widget.height*0.028,
                  fontcolor: Color(0xff2B3E4F),

                  fontFamily: 'sfdr',),
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.only(bottom: widget.height*0.01),
                    child: ListView.builder(
                      itemCount: messages.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      //physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return (
                            Column(

                              children: [
                                Stack(
                                  children: [
                                    Container(

                                      padding:
                                      EdgeInsets.only(left: 14, right: 24, top: 0, bottom: 0),
                                      child: Align(
                                        alignment: (Alignment.topRight),
                                        child:
                                        Container(
                                          height:widget.height*0.08,

                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Color(0xffF0F5FC),
                                          ),
                                          padding: EdgeInsets.only(top: 22,bottom:0,left: 16,right: 16),
                                          child:

                                          Text(
                                            messages[index].messageContent,
                                            style: TextStyle(fontSize: 13,fontFamily: 'sftr',color: textColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right:0,
                                      top:10,
                                      child:    Container(
                                        height: 40,width: 40,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/icons/personicon.png'),
                                            fit: BoxFit.fill,
                                          ),
                                          //  shape: BoxShape.circle,

                                          border: Border.all(color: themeColor2, width:2),
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),


                                Container(
                                  padding:
                                  EdgeInsets.only(left: 0, right: widget.width*0.09, top: 0, bottom: 0),
                                  child: Align(
                                    alignment: ( Alignment.topRight),
                                    child: Container(
                                        child:VariableText(text: "10:05Am",fontsize: 11,fontFamily: 'sftr',fontcolor:hinttextColor)),
                                  ),
                                ),
                                SizedBox(height: widget.height*0.03,),


                              ],
                            )

                        )
                        ;
                      },
                    ),
                  ),
                ),


                Padding(
                  padding:  EdgeInsets.only(bottom:widget. height*0.02),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                              height:widget. height*0.08,

                              decoration:  BoxDecoration(
                                color: Color(0xffF0F5FC),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(widget.height*0.02) //                 <--- border radius here
                                ),
                              ),
                              child:Row(
                                children: [
                                  Expanded(
                                      flex:2,
                                      child: Container(
                                          height: widget.height*0.06,
                                          child: Image.asset("lib/assets/icons/cameraicon.png",scale:widget.height*0.0035))),
                                  Expanded(
                                    flex:12,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                                      height:widget. height*0.06,


                                      child:
                                      Padding(
                                        padding:  EdgeInsets.all(widget.height*0.002),
                                        child: TextField(
                                          controller: _controller,
                                          style:  TextStyle(color: Color(0xff2B3E4F),
                                              fontSize:widget.height*0.015,fontFamily: 'sftr'),

                                          decoration: InputDecoration(
                                              contentPadding: currLang == 'ar' ? EdgeInsets.symmetric(vertical: 7) : EdgeInsets.symmetric(vertical: 11),
                                              hintText: getTranslated(context, "Write A Comment"),
                                              hintStyle: TextStyle(color: Color(0xfc3C3C43),
                                                  fontSize:widget.height*0.015,fontFamily: 'sftr'),

                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                      flex:2,
                                      child: InkWell(
                                        onTap: (){
                                          setState(() {
                                            messages.add(ChatMessage(
                                              messageContent: _controller.text,
                                            ));
                                            _controller.clear();

                                          });},
                                        child: Container(
                                            height:widget. height*0.06,
                                            child: Image.asset("lib/assets/icons/chatsend.png",scale:widget.height*0.004,)),
                                      )),
                                ],
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                )



              ],
            ),
          ),
        );
      case Orientation.portrait:

        return  Container(

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft:Radius.circular(widget.height*0.05) ,
                topRight: Radius.circular(widget.height*0.05)
            ),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height:widget.height*0.02,),
                VariableText(text: getTranslated(context, "Comments"),
                  fontsize: widget.height*0.028,
                  fontcolor: Color(0xff2B3E4F),

                  fontFamily: 'sfdr',),
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.only(bottom: widget.height*0.01),
                    child: ListView.builder(
                      itemCount: messages.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      //physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return (
                            Column(

                              children: [
                                Stack(
                                  children: [
                                    Container(

                                      padding:
                                      EdgeInsets.only(left: 14, right: 24, top: 0, bottom: 0),
                                      child: Align(
                                        alignment: (Alignment.topRight),
                                        child:
                                        Container(
                                          height:widget.height*0.08,

                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Color(0xffF0F5FC),
                                          ),
                                          padding: EdgeInsets.only(top: 22,bottom:0,left: 16,right: 16),
                                          child:

                                          Text(
                                            messages[index].messageContent,
                                            style: TextStyle(fontSize: 13,fontFamily: 'sftr',color: textColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right:0,
                                      top:10,
                                      child:    Container(
                                        height: 40,width: 40,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/icons/personicon.png'),
                                            fit: BoxFit.fill,
                                          ),
                                          //  shape: BoxShape.circle,

                                          border: Border.all(color: themeColor2, width:2),
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),


                                Container(
                                  padding:
                                  EdgeInsets.only(left: 0, right: widget.width*0.09, top: 0, bottom: 0),
                                  child: Align(
                                    alignment: ( Alignment.topRight),
                                    child: Container(
                                        child:VariableText(text: "10:05Am",fontsize: 11,fontFamily: 'sftr',fontcolor:hinttextColor)),
                                  ),
                                ),
                                SizedBox(height: widget.height*0.03,),


                              ],
                            )

                        )
                        ;
                      },
                    ),
                  ),
                ),


                Padding(
                  padding:  EdgeInsets.only(bottom:widget. height*0.02),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                              height:widget. height*0.08,

                              decoration:  BoxDecoration(
                                color: Color(0xffF0F5FC),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(widget.height*0.02) //                 <--- border radius here
                                ),
                              ),
                              child:Row(
                                children: [
                                  Expanded(
                                      flex:2,
                                      child: Container(
                                          height: widget.height*0.06,
                                          child: Image.asset("lib/assets/icons/cameraicon.png",scale:widget.height*0.0035))),
                                  Expanded(
                                    flex:10,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                                      height:widget. height*0.06,
                                      child:
                                      Padding(
                                        padding:  EdgeInsets.all(widget.height*0.002),
                                        child: TextField(
                                          controller: _controller,
                                          style:  TextStyle(color: Color(0xff2B3E4F),
                                              fontSize:widget.height*0.015,fontFamily: 'sftr'),
                                          decoration: InputDecoration(
                                            contentPadding: currLang == 'ar' ? EdgeInsets.symmetric(vertical: 7) : EdgeInsets.symmetric(vertical: 11),
                                              hintText: getTranslated(context, "Write A Comment"),
                                              hintStyle: TextStyle(color: Color(0xfc3C3C43),
                                                  fontSize:widget.height*0.015,fontFamily: 'sftr'),

                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                      flex:3,
                                      child: InkWell(
                                        onTap: (){
                                          setState(() {
                                            messages.add(ChatMessage(
                                              messageContent: _controller.text,
                                            ));
                                            _controller.clear();

                                          });},
                                        child: Container(
                                            height:widget. height*0.06,
                                            child: Image.asset("lib/assets/icons/chatsend.png",scale:widget.height*0.004,)),
                                      )),
                                ],
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                )



              ],
            ),
          ),
        );

  }
}}
class AppointmentDetailsContainer extends StatefulWidget {
Function ontapVideoCall;
  double cHeight;
  double cWidth;
  var doctorName;
  var clinicName;
  var rating;
  var month;
  var image;
  AppointmentDetailsContainer({ this.cHeight, this.cWidth,
    this.month,
    this.clinicName,
    this.doctorName,
this.ontapVideoCall,
    this.image,
    this.rating});

  @override
  _AppointmentDetailsContainerState createState() => _AppointmentDetailsContainerState();
}

class _AppointmentDetailsContainerState extends State<AppointmentDetailsContainer> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    switch (MediaQuery.of(context).orientation) {
      case Orientation.landscape:
        return Container(
          width: double.infinity,
          child: Stack(
            children: [
              Row(
                children: [
                  //left
                  Expanded(
                    flex: 4,
                    child: Container(
                      child: Stack(
                        children: [
                          Container(
                            //padding: EdgeInsets.all(1),
                              child: Image.asset(
                                'lib/assets/icons/doctoricon.png',)
                          ),
                          currLang == 'ar' ?
                          Positioned(
                              left: 0,
                              bottom: 0,
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Color(0xFF75CF75),
                                    border: Border.all(
                                        color: Colors.white, width: 2)
                                ),
                              )
                          ) :
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Color(0xFF75CF75),
                                    border: Border.all(
                                        color: Colors.white, width: 2)
                                ),
                              )
                          )

                        ],
                      ),
                    ),
                  ),
                  //right
                  Expanded(
                    flex: 12,
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          //color: Colors.yellow,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: widget.cHeight * 0.03,),
                              //name & rating
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: Row(
                                  children: [
                                    VariableText(text: 'Bobby Clarke',
                                      fontsize: 19,
                                      fontcolor: Color(0xFF2C3E50),),
                                    SizedBox(width: 10,),
                                    VariableText(text: widget.rating,
                                      fontsize: 11,
                                      fontcolor: Color(0xFF2C3E50),),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: Image.asset(
                                        'lib/assets/icons/appointment_rating.png',
                                        scale: 3.2,),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: widget.cHeight * 0.01,),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: VariableText(
                                  text: 'Senior Cordiologist And Surgeon',
                                  fontsize: widget.cHeight * 0.015,
                                  fontFamily: 'sftr',
                                  fontcolor: Color(0x3c3C3C43),),
                              ),
                              SizedBox(height: widget.cHeight * 0.01,),
                              //address
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'lib/assets/icons/appointment_clinic.png',
                                      scale: 2.8,),
                                    SizedBox(width: 5,),
                                    VariableText(
                                      text: widget.clinicName,
                                      fontsize: widget.cHeight * 0.016,
                                      underlined: true,
                                      fontFamily: 'sftr',
                                      fontcolor: Color(0xFF2C3E50),),
                                  ],
                                ),
                              ),
                              SizedBox(height: widget.cHeight * 0.012,),
                              //address
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: Row(
                                  children: [
                                    VariableText(text: 'Perth:',
                                      fontsize: widget.cHeight * 0.015,
                                      fontFamily: 'sftr',
                                      fontcolor: Color(0xFF2C3E50),),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: VariableText(text: 'El Metro',
                                        fontsize: widget.cHeight * 0.015,
                                        fontFamily: 'sftr',
                                        fontcolor: Color(0xFF2C3E50),),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: widget.cHeight * 0.019,),
                              //address
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child:
                                Row(
                                  children: [
                                    Image.asset('lib/assets/icons/chaticon.png',
                                      scale: 3.5,),
                                    SizedBox(width: widget.cHeight * 0.02,),
                                    Image.asset(
                                      'lib/assets/icons/menucontactusicon.png',
                                      scale: 3.5,),
                                    SizedBox(width: widget.cHeight * 0.02,),
                                    InkWell(
                                        onTap: widget.ontapVideoCall,
                                        child: Image.asset(
                                          'lib/assets/icons/videocallicon.png',
                                          scale: 3.5,)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: currLang == 'ar' ? Alignment.topLeft : Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: GestureDetector(
                    onTap: (){
                      if(isFav == true){
                        setState(() {
                          isFav = false;
                        });
                      }else{
                        setState(() {
                          isFav = true;
                        });
                      }
                    },
                    child: Container(
                      child: isFav == true ? Icon(Icons.favorite, size: 35, color: Colors.red,) : Icon(Icons.favorite_border, size: 35, color: Colors.black54,),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      case Orientation.portrait:
        return Container(
          width: double.infinity,
          child: Stack(
            children: [
              Row(
                children: [
                  //left
                  Expanded(
                    flex: 7,
                    child: Container(
                      child: Stack(
                        children: [
                          Container(
                            //padding: EdgeInsets.all(1),
                              child: Image.asset('lib/assets/icons/doctoricon.png',)
                          ),
                          currLang == 'ar' ?
                          Positioned(
                              left: 0,
                              bottom: 0,
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Color(0xFF75CF75),
                                    border: Border.all(color: Colors.white, width: 2)
                                ),
                              )
                          ) :
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Color(0xFF75CF75),
                                    border: Border.all(color: Colors.white, width: 2)
                                ),
                              )
                          )

                        ],
                      ),
                    ),
                  ),
                  //right
                  Expanded(
                    flex: 12,
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          //color: Colors.yellow,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: widget.cHeight*0.03,),
                              //name & rating
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    VariableText(text: 'Bobby Clarke', fontsize: 17, fontcolor: Color(0xFF2C3E50),),
                                    SizedBox(width: 10,),
                                    VariableText(text: widget.rating, fontsize: 11, fontcolor: Color(0xFF2C3E50),),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 2),
                                      child: Image.asset('lib/assets/icons/appointment_rating.png', scale: 3.2,),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: widget.cHeight*0.01,),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 10),
                                child: VariableText(text: 'Senior Cordiologist And Surgeon', fontsize: widget.cHeight*0.012, fontFamily:'sftr',fontcolor: Color(0x3c3C3C43),),
                              ),
                              SizedBox(height: widget.cHeight*0.01,),
                              //address
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Image.asset('lib/assets/icons/appointment_clinic.png', scale: 3.2,),
                                    SizedBox(width: 5,),
                                    VariableText(text: widget.clinicName, fontsize: widget.cHeight*0.013,  underlined: true, fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),
                                  ],
                                ),
                              ),
                              SizedBox(height: widget.cHeight*0.012,),
                              //address
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    VariableText(text: 'Perth:', fontsize: widget.cHeight*0.013,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: VariableText(text: 'El Metro', fontsize: widget.cHeight*0.013,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: widget.cHeight*0.019,),
                              //address
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child:
                                Row(
                                  children: [
                                    Image.asset('lib/assets/icons/chaticon.png', scale: 3.5,),
                                    SizedBox(width: widget.cHeight*0.02,),
                                    Image.asset('lib/assets/icons/menucontactusicon.png', scale: 3.5,),
                                    SizedBox(width: widget.cHeight*0.02,),
                                    InkWell(
                                        onTap: widget.ontapVideoCall,
                                        child: Image.asset('lib/assets/icons/videocallicon.png', scale: 3.5,)),],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),

              Align(
                alignment: currLang == 'ar' ? Alignment.topLeft : Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: GestureDetector(
                    onTap: (){
                      if(isFav == true){
                        setState(() {
                          isFav = false;
                        });
                      }else{
                        setState(() {
                          isFav = true;
                        });
                      }
                    },
                    child: Container(
                      child: isFav == true ? Icon(Icons.favorite, size: 30, color: Colors.red,) : Icon(Icons.favorite_border, size: 30, color: Colors.black54,),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
    }
  }
}
class BookOfferContainer extends StatelessWidget {

  double height;
  double width;
  Function onTap;
  BookOfferContainer(
      { this.height, this.width,this.onTap});

  @override
  Widget build(BuildContext context) {
      return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
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
                    EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: VariableText(
                      text: getTranslated(context, '30% Offers'),
                      fontsize:22,
                      fontFamily: 'sfdb',
                      fontcolor: Color(0xFFF47920),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VariableText(
                          text: getTranslated(context, 'Check For Deals'),
                          fontsize: 11,
                          fontFamily: 'sftr',
                          fontcolor: Color(0xFFF47920),
                        ),
                        VariableText(
                          text: getTranslated(context, 'For Today'),
                          fontsize: 11,
                          fontFamily: 'sftr',
                          fontcolor: Color(0xFFF47920),
                        ),
                      ],
                    ),
                  ),

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
  }
}
class BookOfferFavouriteContainer extends StatefulWidget {

  double cHeight;
  double cWidth;
  BookOfferFavouriteContainer({ this.cHeight, this.cWidth});

  @override
  _BookOfferFavouriteContainerState createState() => _BookOfferFavouriteContainerState();
}

class _BookOfferFavouriteContainerState extends State<BookOfferFavouriteContainer> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:

        return Container(
          width: widget.cHeight,

          decoration: BoxDecoration(
              color: themeColor2,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0x6c2B3E4F),width: 0.3)
          ),
          child: Column(children: [


            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image
                Padding(
                  padding:  EdgeInsets.symmetric(vertical:8,horizontal: 8.0),

                  child: Container(
                      height: widget.cWidth*0.20,
                      width: widget.cWidth*0.25,

                      child: Image.asset('lib/assets/images/appointment_doctor4.png', scale: 2.3)),
                ),
                //name address
                Container(
                  //color: Colors.pink,
                  height: widget.cHeight*0.20,
                  width: widget.cWidth*0.60,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: widget.cHeight*0.04,),
                        //name & rating
                        Row(
                          children: [
                            VariableText(text: 'Bobby Clark', fontsize: 17, fontcolor: Color(0xFF2C3E50),),
                            Padding(
                              padding: EdgeInsets.only( left: 10.0),
                              child: VariableText(text: '4.8', fontsize: 11, fontcolor: Color(0xFF2C3E50),),
                            ),
                            Padding(
                              padding: EdgeInsets.only( left: 2.0, bottom: 5.0),
                              child: Image.asset('lib/assets/icons/appointment_rating.png', scale: 3.2,),
                            ),
                            Spacer(),
                            GestureDetector(
                                onTap: (){
                                  if(isFav == true){
                                    setState(() {
                                      isFav = false;
                                    });
                                  }else{
                                    setState(() {
                                      isFav = true;
                                    });
                                  }
                                },
                                child:
                                isFav == true ?
                                Icon(Icons.favorite, size: 30, color: Colors.red,)
                                    : Icon(Icons.favorite_border, size: 30, color: Colors.black54,)
                            )
                          ],
                        ),

                        VariableText(text: 'Senior Cordiologist And Surgeon', fontsize:11, fontFamily:'sftr',fontcolor: Color(0x3c3C3C43),),

                        SizedBox(height: widget.cHeight*0.019,),
                        //address
                        Row(
                          children: [
                            InkWell(
                              onTap:(){},
                              child: Container(
                                height:widget.cHeight*0.05,
                                width: widget.cHeight*0.20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: themeColor2,
                                    border: Border.all(color: themeColor1)
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('lib/assets/icons/chaticon.png', scale: 5.2,color: themeColor1,),
                                    SizedBox(width: widget.cHeight*0.01,),
                                    VariableText(
                                      text: getTranslated(context, "Receptionist"),
                                      fontcolor: themeColor1,
                                      fontFamily:'sfdm',
                                      fontsize:12,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Spacer(),

                            VariableText(text: '389', fontsize: widget.cHeight*0.030,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                            SizedBox(width: widget.cHeight*0.0050,),
                            Column(
                              children: [
                                SizedBox(height: widget.cHeight*0.02,),
                                VariableText(text: 'Eg', fontsize: widget.cHeight*0.013,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                              ],
                            ),],
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),







          ],
          ),
        );
      case Orientation.portrait:

        return Container(
          width: widget.cWidth,

          decoration: BoxDecoration(
              color: themeColor2,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0x6c2B3E4F),width: 0.3)
          ),
          child: Column(children: [


            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0),

                  child: Container(
                      height: widget.cHeight*0.20,
                      width: widget.cWidth*0.25,
                      child: Image.asset('lib/assets/images/appointment_doctor4.png', scale: 2.3)),
                ),
                //name address
                Container(
                  //color: Colors.pink,
                  height: widget.cHeight*0.20,
                  width: widget.cWidth*0.58,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: widget.cHeight*0.04,),
                        //name & rating
                        Row(
                          children: [
                            VariableText(text: 'Bobby Clark', fontsize: 17, fontcolor: Color(0xFF2C3E50),),
                            SizedBox(width: 5,),
                            VariableText(text: '4.8', fontsize: 11, fontcolor: Color(0xFF2C3E50),),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.0),
                              child: Image.asset('lib/assets/icons/appointment_rating.png', scale: 3.2,),
                            ),
                            Spacer(),

                            GestureDetector(
                              onTap: (){
                                if(isFav == true){
                                  setState(() {
                                    isFav = false;
                                  });
                                }else{
                                  setState(() {
                                    isFav = true;
                                  });
                                }
                              },
                                child:
                                    isFav == true ?
                                Icon(Icons.favorite, size: 30, color: Colors.red,)
                                        : Icon(Icons.favorite_border, size: 30, color: Colors.black54,)
                            )
                          ],
                        ),

                        VariableText(text: 'Senior Cordiologist And Surgeon', fontsize:11, fontFamily:'sftr',fontcolor: Color(0x3c3C3C43),),
                        SizedBox(height: widget.cHeight*0.019,),
                        //address
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap:(){},
                              child: Container(
                                height:widget.cHeight*0.05,
                                width: widget.cWidth*0.32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: themeColor2,
                                    border: Border.all(color: themeColor1)
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal:widget.cHeight*0.01),
                                  child: Row(
                                    children: [
                                      Image.asset('lib/assets/icons/chaticon.png', scale: 5.2,color: themeColor1,),
                                      SizedBox(width: widget.cHeight*0.01,),
                                      VariableText(
                                        text: getTranslated(context, "Receptionist"),
                                        fontcolor: themeColor1,
                                        fontFamily:'sfdm',
                                        fontsize:12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                VariableText(text: '389', fontsize: widget.cHeight*0.030,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                                SizedBox(width: widget.cHeight*0.0050,),
                                Column(
                                  children: [
                                    SizedBox(height: widget.cHeight*0.02,),
                                    VariableText(text: 'Eg', fontsize: widget.cHeight*0.013,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                  ],
                                )

                              ],
                            ),],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
          ),
        );

  }
}}
class ServiceContainer extends StatelessWidget {
  var name;
  var address;
  var image;
  var serivicetype;
  var timming;
  Function ontap,ontapBookNow;
  double cHeight;
  double cWidth;
  ServiceContainer({this.name, this.address,this.image,this.serivicetype,this.timming, this.cHeight, this.cWidth,this.ontap,this.ontapBookNow});

  @override
  Widget build(BuildContext context) {
    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        return Container(
          width: cHeight,
          decoration: BoxDecoration(
              color: themeColor2,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0x6c2B3E4F),width: 0.3)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //upper
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //image
                      Column(
                        children: [
                          SizedBox(height: 20,),
                          Container(
                              height: cWidth*0.20,
                              width: cHeight*0.20,
                              //color:themeColor3,
                              child: Image.asset(image, scale: 2.3)),
                        ],
                      ),
                      SizedBox(width: 10,),
                      Container(
                        //color: Colors.pink,
                        height: cHeight*0.18,
                        width: cHeight*0.70,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: cHeight*0.04,),
                            //name & rating
                            Row(
                              children: [
                                VariableText(text: name, fontsize: 17, fontcolor: Color(0xFF2C3E50),),
                                Spacer(),
                                Image.asset('lib/assets/icons/favouriteiconoutline.png', scale: 3.2,),
                              ],
                            ),
                            VariableText(text: address, fontsize: 11, fontFamily:'sftr',fontcolor: hinttextColor,),
                            SizedBox(height: cHeight*0.0025,),
                            Row(
                              children: [
                                Expanded(child: VariableText(text:timming, fontsize: 11, fontFamily:'sftr',fontcolor: hinttextColor,)),
                              ],
                            ),

                            //address
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                VariableText(text: serivicetype, fontsize: 11, fontFamily:'sftr',fontcolor: hinttextColor,),
                                //Spacer(),
                                Row(
                                  children: [
                                    VariableText(text: '426', fontsize: cHeight*0.030,fontFamily: 'sfdb', fontcolor: Colors.black,),
                                    SizedBox(width: cHeight*0.0050,),
                                    Column(
                                      children: [
                                        SizedBox(height: cHeight*0.02,),
                                        VariableText(text: 'Eg', fontsize: 11,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                      ],
                                    )

                                  ],
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                      //home icon
                      /*  Padding(
                    padding: EdgeInsets.only(top: cHeight * 0.06, left: 15),
                    child: Image.asset('lib/assets/icons/appointment_home.png', scale: 3.2,),
                  )*/
                    ],
                  ),
                ),
              ),
              Container(
                // color: Colors.grey,
                height: cHeight*0.08,

                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: ontapBookNow,
                          child: CustomButton(
                              buttonHeight: cHeight*0.06,
                              buttonBorderRadius:8,
                              buttonFontSize:cHeight*0.018,
                              buttonColor:themeColor1,
                              buttonTextColor:themeColor2,
                              buttonText: getTranslated(context, "Book Now"),
                              buttonFontFamily:'sfdm',
                              buttonOnTap:ontapBookNow
                          ),
                        ),
                      ),
                      SizedBox(width: cHeight*0.03,),

                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap:ontap,
                          child: Container(
                            height:cHeight*0.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xffF0F5FC)
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal:cHeight*0.01),
                              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('lib/assets/icons/chaticon.png', scale: 4.2,),
                                  SizedBox(width: cHeight*0.01,),
                                  VariableText(
                                    text: getTranslated(context, "Receptionist"),
                                    fontcolor: Color(0xff2B3E4F),
                                    fontFamily:'sfdm',
                                    fontsize: cHeight*0.018,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: cHeight*0.01)





            ],
          ),
        );

      case Orientation.portrait:
        return Container(
          width: cWidth,
          decoration: BoxDecoration(
              color: themeColor2,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0x6c2B3E4F),width: 0.3)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //upper
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //image
                      Container(
                          height: cHeight*0.18,
                          width: cWidth*0.20,
                           //color:themeColor3,
                          child: Image.asset(image, scale: 2.3)),
                  SizedBox(width: 10,),
                      Container(
                        //color: Colors.pink,
                        height: cHeight*0.18,
                        width: cWidth*0.62,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: cHeight*0.04,),
                            //name & rating
                            Row(
                              children: [
                                VariableText(text: name, fontsize: 17, fontcolor: Color(0xFF2C3E50),),
                                  Spacer(),
                                Image.asset('lib/assets/icons/favouriteiconoutline.png', scale: 3.2,),
                              ],
                            ),
                            VariableText(text: address, fontsize: 11, fontFamily:'sftr',fontcolor: hinttextColor,),
                            SizedBox(height: cHeight*0.0025,),
                            Row(
                              children: [
                                Expanded(child: VariableText(text:timming, fontsize: 11, fontFamily:'sftr',fontcolor: hinttextColor,)),
                              ],
                            ),

                            //address
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                VariableText(text: serivicetype, fontsize: 11, fontFamily:'sftr',fontcolor: hinttextColor,),
                                //Spacer(),
                                Row(
                                  children: [
                                    VariableText(text: '426', fontsize: cHeight*0.030,fontFamily: 'sfdb', fontcolor: Colors.black,),
                                    SizedBox(width: cHeight*0.0050,),
                                    Column(
                                      children: [
                                        SizedBox(height: cHeight*0.02,),
                                        VariableText(text: 'Eg', fontsize: 11,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                      ],
                                    )

                                  ],
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                      //home icon
                      /*  Padding(
                    padding: EdgeInsets.only(top: cHeight * 0.06, left: 15),
                    child: Image.asset('lib/assets/icons/appointment_home.png', scale: 3.2,),
                  )*/
                    ],
                  ),
                ),
              ),
              Container(
               // color: Colors.grey,
                height: cHeight*0.07,
                width: cWidth,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    CustomButton(
                        buttonHeight: cHeight*0.05,
                        buttonWidth:  cWidth*0.38,
                        buttonBorderRadius:8,
                        buttonFontSize:cHeight*0.018,
                        buttonColor:themeColor1,
                        buttonTextColor:themeColor2,
                        buttonText: getTranslated(context, "Book Now"),
                        buttonFontFamily:'sfdm',
                        buttonOnTap:ontapBookNow
                    ),
                    SizedBox(width: cHeight*0.03,),

                    InkWell(
                      onTap:ontap,
                      child: Container(
                        height:cHeight*0.05,
                        width: cWidth*0.38,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffF0F5FC)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal:cHeight*0.01),
                          child: Row(
                            children: [
                              Image.asset('lib/assets/icons/chaticon.png', scale: 4.2,),
                              SizedBox(width: cHeight*0.01,),
                              VariableText(
                                text: getTranslated(context, "Receptionist"),
                                fontcolor: Color(0xff2B3E4F),
                                fontFamily:'sfdm',
                                fontsize: cHeight*0.018,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: cHeight*0.01)





            ],
          ),
        );

    }

  }
}
class CustomServiceOptions extends StatelessWidget {
  Function filterontap,mapontap,sortontap;
  String title1,image1,title2,image2,title3,image3;
  CustomServiceOptions({this.filterontap,this.mapontap,this.sortontap,
  this.title1="Filter",
  this.image1='lib/assets/icons/filtericon.png',
    this.title2="Map",
    this.image2='lib/assets/icons/location.png',
    this.title3="Sort",
    this.image3='lib/assets/icons/sort.png',

  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: filterontap,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(image1,scale: 3.5,),
                  VariableText(text: getTranslated(context, title1.toString()),
                    fontsize: 11,
                    fontcolor: Color(0xff2B3E4F),
                    fontFamily: 'sfdr',),

                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: mapontap,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(image2,scale: 3.5,),
                  VariableText(text: getTranslated(context, title2.toString()),
                    fontsize: 11,
                    fontcolor: Color(0xff2B3E4F),
                    fontFamily: 'sfdr',),

                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: sortontap,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(image3,scale: 3.5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: VariableText(text: getTranslated(context, title3.toString()),
                      fontsize: 11,
                      fontcolor: Color(0xff2B3E4F),
                      fontFamily: 'sfdr',),
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

class VetServiceContainer extends StatefulWidget {
  var title;
  var subTitle;
  double cHeight;
  double cWidth;
  Function ontapbooknow;
  Function ontapreceptionist;
  VetServiceContainer({this.title, this.subTitle, this.cHeight, this.cWidth,this.ontapbooknow,this.ontapreceptionist});

  @override
  _VetServiceContainerState createState() => _VetServiceContainerState();
}

class _VetServiceContainerState extends State<VetServiceContainer> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        return Container(
          width: widget.cHeight,
          decoration: BoxDecoration(
              color: themeColor2,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0x6c2B3E4F),width: 0.3)
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: widget.cHeight*0.01,),
                  Row(
                    children: [
                      //left
                      Expanded(
                        flex: 4,
                        child: Container(
                          child: Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(5),
                                  child: Image.asset('lib/assets/icons/doctoricon.png',)
                              ),
                              currLang == 'ar' ?
                              Positioned(
                                  left: 0,
                                  bottom: 0,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60),
                                        color: Color(0xFF75CF75),
                                        border: Border.all(color: Colors.white, width: 2)
                                    ),
                                  )
                              ) :
                              Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60),
                                        color: Color(0xFF75CF75),
                                        border: Border.all(color: Colors.white, width: 2)
                                    ),
                                  )
                              )

                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        flex: 13,
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.all(2),
                              //color: Colors.yellow,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 5),
                                        child: VariableText(text: 'Bobby Clark', fontsize: 17, fontcolor: Color(0xFF2C3E50),),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: widget.cHeight*0.01,),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 5),
                                    child: VariableText(text: 'Senior Cordiologist And Surgeon', fontsize: widget.cHeight*0.015, fontFamily:'sftr',fontcolor: Color(0x3c3C3C43),),
                                  ),
                                  SizedBox(height: widget.cHeight*0.02,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ClinicDetails()));
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                          child: Image.asset('lib/assets/icons/appointment_clinic.png', scale: 3.2,),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric( horizontal: 5),
                                          child: VariableText(text: 'United State Medical College', fontsize: widget.cHeight*0.012,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),
                                        ),
                                        /*image2==null?Container(): Image.asset(image2, scale: 3.2,),*/

                                      ],
                                    ),
                                  ),
                                  SizedBox(height: widget.cHeight*0.02,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(top:0,right: 0),
                                        child: Transform(
                                          alignment: Alignment.center,
                                          transform: Matrix4.rotationZ(0.1),
                                          child: Container(
                                            //color: Colors.red,
                                            height: widget.cHeight*0.05,
                                            width: widget.cWidth*0.18,

                                            child: Row(
                                              children: [
                                                VariableText(text: '426', fontsize: widget.cHeight*0.028,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                                                SizedBox(width: widget.cHeight*0.0050,),
                                                Column(
                                                  children: [
                                                    SizedBox(height: widget.cHeight*0.03,),
                                                    VariableText(text: 'Eg', fontsize: widget.cHeight*0.015,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                                  ],
                                                )

                                              ],
                                            ),

                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      VariableText(text: 'Vet Consultation', fontsize: widget.cHeight*0.015, fontFamily:'sftr',fontcolor: Color(0x3c3C3C43),),
                                    ],
                                  )

                                ],
                              ),
                            ),
                          ],
                        ),
                      )

                    ],
                  ),
                  //lower

                  Container(
                    //color: Colors.grey,
                    height: widget.cHeight*0.10,

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: CustomButton(
                                buttonHeight: widget.cHeight*0.06,
                                buttonBorderRadius:8,
                                buttonFontSize:widget.cHeight*0.020,
                                buttonColor:themeColor1,
                                buttonTextColor:themeColor2,
                                buttonText: getTranslated(context, "Book Now"),
                                buttonFontFamily:'sfdm',
                                buttonOnTap:widget.ontapbooknow,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>MainMessegeDetailsScreen()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                height:widget.cHeight*0.06,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xffF0F5FC)
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal:widget.cHeight*0.01),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('lib/assets/icons/chaticon.png', scale: 4.2,),
                                      SizedBox(width: widget.cHeight*0.01,),
                                      VariableText(
                                        text: getTranslated(context, "Receptionist") ,
                                        fontcolor: Color(0xff2B3E4F),
                                        fontFamily:'sfdm',
                                        fontsize: widget.cHeight*0.020,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: widget.cHeight*0.01)





                ],
              ),
              Align(
                alignment: currLang == 'ar' ? Alignment.topLeft : Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: GestureDetector(
                      onTap: (){
                        if(isFav == true){
                          setState(() {
                            isFav = false;
                          });
                        }else{
                          setState(() {
                            isFav = true;
                          });
                        }
                      },

                      child:
                      isFav == true ?
                      Icon(Icons.favorite, color: Colors.red, size: 35,): Icon(Icons.favorite_border, size: 35, color: Colors.black54,)
                  ),
                ),
              )
            ],
          ),
        );

      case Orientation.portrait:
        return Container(
          width: widget.cWidth,

          decoration: BoxDecoration(
              color: themeColor2,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0x6c2B3E4F),width: 0.3)
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: widget.cHeight*0.002,),
                  //upper
                  Row(
                    children: [
                      //left
                      Expanded(
                        flex: 7,
                        child: Container(
                          child: Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(5),
                                  child: Image.asset('lib/assets/icons/doctoricon.png',)
                              ),
                              currLang == 'ar' ?
                              Positioned(
                                  left: 0,
                                  bottom: 0,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60),
                                        color: Color(0xFF75CF75),
                                        border: Border.all(color: Colors.white, width: 2)
                                    ),
                                  )
                              ) :
                              Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60),
                                        color: Color(0xFF75CF75),
                                        border: Border.all(color: Colors.white, width: 2)
                                    ),
                                  )
                              )

                            ],
                          ),
                        ),
                      ),
                      //right
                      Expanded(
                        flex: 12,
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.all(2),
                              //color: Colors.yellow,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 5),
                                        child: VariableText(text: 'Bobby Clark', fontsize: 17, fontcolor: Color(0xFF2C3E50),),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: widget.cHeight*0.01,),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 5),
                                    child: VariableText(text: 'Senior Cordiologist And Surgeon', fontsize: widget.cHeight*0.015, fontFamily:'sftr',fontcolor: Color(0x3c3C3C43),),
                                  ),
                                  SizedBox(height: widget.cHeight*0.01,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=>ClinicDetails()));
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                          child: Image.asset('lib/assets/icons/appointment_clinic.png', scale: 3.2,),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric( horizontal: 2),
                                          child: VariableText(text: 'United State Medical College', fontsize: widget.cHeight*0.012,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),
                                        ),
                                        /*image2==null?Container(): Image.asset(image2, scale: 3.2,),*/

                                      ],
                                    ),
                                  ),
                                  SizedBox(height: widget.cHeight*0.01,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(top:0,right: 0),
                                        child: Transform(
                                          alignment: Alignment.center,
                                          transform: Matrix4.rotationZ(0.1),
                                          child: Container(
                                            //color: Colors.red,
                                            height: widget.cHeight*0.05,
                                            width: widget.cWidth*0.18,

                                            child: Row(
                                              children: [
                                                VariableText(text: '426', fontsize: widget.cHeight*0.028,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                                                SizedBox(width: widget.cHeight*0.0050,),
                                                Column(
                                                  children: [
                                                    SizedBox(height: widget.cHeight*0.03,),
                                                    VariableText(text: 'Eg', fontsize: widget.cHeight*0.015,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                                  ],
                                                )

                                              ],
                                            ),

                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      VariableText(text: 'Vet Consultation', fontsize: widget.cHeight*0.015, fontFamily:'sftr',fontcolor: Color(0x3c3C3C43),),
                                    ],
                                  )

                                ],
                              ),
                            ),

                            /*currLang == 'ar' ?
                            Positioned(
                              bottom: cHeight*0.045,
                              left: 0,
                              child: Padding(
                                padding:  EdgeInsets.only(top:0,right: 0),
                                child: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationZ(-0.1),
                                  child: Container(
                                    //color: Colors.red,
                                    height: cHeight*0.05,
                                    width: cWidth*0.18,

                                    child: Row(
                                      children: [
                                        VariableText(text: '426', fontsize: cHeight*0.028,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                                        SizedBox(width: cHeight*0.0050,),
                                        Column(
                                          children: [
                                            SizedBox(height: cHeight*0.03,),
                                            VariableText(text: 'Eg', fontsize: cHeight*0.015,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                          ],
                                        )

                                      ],
                                    ),

                                  ),
                                ),
                              ),
                            ) :
                            Positioned(
                              bottom: cHeight*0.00,
                              right: 0,
                              child: Padding(
                                padding:  EdgeInsets.only(top:0,right: 0),
                                child: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationZ(0.1),
                                  child: Container(
                                    //color: Colors.red,
                                    height: cHeight*0.05,
                                    width: cWidth*0.18,

                                    child: Row(
                                      children: [
                                        VariableText(text: '426', fontsize: cHeight*0.028,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                                        SizedBox(width: cHeight*0.0050,),
                                        Column(
                                          children: [
                                            SizedBox(height: cHeight*0.03,),
                                            VariableText(text: 'Eg', fontsize: cHeight*0.015,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                          ],
                                        )

                                      ],
                                    ),

                                  ),
                                ),
                              ),
                            ),*/
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    //color: Colors.grey,
                    height: widget.cHeight*0.08,
                    //width: cWidth,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: CustomButton(
                                buttonHeight: widget.cHeight*0.06,
                                buttonBorderRadius:8,
                                buttonFontSize:widget.cHeight*0.020,
                                buttonColor:themeColor1,
                                buttonTextColor:themeColor2,
                                buttonText: getTranslated(context, "Book Now"),
                                buttonFontFamily:'sfdm',
                                buttonOnTap:widget.ontapbooknow,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>MainMessegeDetailsScreen()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                height:widget.cHeight*0.06,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xffF0F5FC)
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal:widget.cHeight*0.01),
                                  child: Row(
                                    children: [
                                      Image.asset('lib/assets/icons/chaticon.png', scale: 4.2,),
                                      SizedBox(width: widget.cHeight*0.01,),
                                      VariableText(
                                        text: getTranslated(context, "Receptionist"),
                                        fontcolor: Color(0xff2B3E4F),
                                        fontFamily:'sfdm',
                                        fontsize: widget.cHeight*0.020,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  SizedBox(height: widget.cHeight*0.01)

                ],
              ),
              Align(
                alignment: currLang == 'ar' ? Alignment.topLeft : Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: GestureDetector(
                    onTap: (){
                      if(isFav == true){
                        setState(() {
                          isFav = false;
                        });
                      }else{
                        setState(() {
                          isFav = true;
                        });
                      }
                    },

                      child:
                          isFav == true ?
                          Icon(Icons.favorite, color: Colors.red,): Icon(Icons.favorite_border)
                  ),
                ),
              )
            ],
          ),
        );

    }

  }
}
class PetServiceBookOfferContainer extends StatefulWidget {
  var title1;
  var title2;
  var image;
  var title3;
  var title4;
  var title5;
  var image2;

  double cHeight;
  double cWidth;
  PetServiceBookOfferContainer({this.title1,
     this.title2,
     this.image,
     this.title3,
     this.title4,
     this.title5,
     this.image2
     ,this.cHeight, this.cWidth});

  @override
  _PetServiceBookOfferContainerState createState() => _PetServiceBookOfferContainerState();
}

class _PetServiceBookOfferContainerState extends State<PetServiceBookOfferContainer> {
  @override
  Widget build(BuildContext context) {
    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        return Container(
          width: widget.cHeight,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0x80F8F6F6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              //left
              Expanded(
                flex: 4,
                child: Container(
                  child: Stack(
                    children: [
                      Container(
                          padding: EdgeInsets.all(5),
                          child: Image.asset(widget.image)
                      ),
                      currLang == 'ar' ?
                      Positioned(
                          left: 0,
                          bottom: 0,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: Color(0xFF75CF75),
                                border: Border.all(color: Colors.white, width: 2)
                            ),
                          )
                      ) :
                      Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: Color(0xFF75CF75),
                                border: Border.all(color: Colors.white, width: 2)
                            ),
                          )
                      )

                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 13,
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      //color: Colors.yellow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: VariableText(text: widget.title1, fontsize: 17, fontcolor: Color(0xFF2C3E50),),
                              ),
                              SizedBox(width: 10,),
                              Padding(
                                padding: EdgeInsets.symmetric( horizontal: 3),
                                child: VariableText(text: '4.8', fontsize: 11, fontcolor: Color(0xFF2C3E50),),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric( horizontal: 2.0),
                                child: Image.asset('lib/assets/icons/appointment_rating.png', scale: 3.2,),
                              )
                            ],
                          ),
                          SizedBox(height: widget.cHeight*0.01,),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 5),
                            child: VariableText(text: widget.title2, fontsize: widget.cHeight*0.015, fontFamily:'sftr',fontcolor: Color(0x3c3C3C43),),
                          ),
                          SizedBox(height: widget.cHeight*0.02,),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>ClinicDetails()));
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric( horizontal: 5),
                                  child: VariableText(text: widget.title3, fontsize: widget.cHeight*0.012,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),
                                ),
                                /*image2==null?Container(): Image.asset(image2, scale: 3.2,),*/

                              ],
                            ),
                          ),
                          SizedBox(height: widget.cHeight*0.05,),
                          InkWell(
                            onTap:(){},
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    //height:cHeight*0.06,
                                    width: widget.cWidth*0.38,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: themeColor2,
                                        border: Border.all(
                                            color: themeColor1
                                        )
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal:widget.cHeight*0.01, vertical: widget.cHeight*0.01),
                                      child: Row(
                                        children: [
                                          Image.asset('lib/assets/icons/chaticon.png', scale: 4.2,color: themeColor1,),
                                          SizedBox(width: widget.cHeight*0.01,),
                                          VariableText(
                                            text:"Receptionist" ,
                                            fontcolor: themeColor1,
                                            fontFamily:'sfdm',
                                            fontsize: widget.cHeight*0.020,
                                          ),
                                        ],
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
                    Align(
                      alignment: currLang == 'ar' ? Alignment.topLeft : Alignment.topRight,
                      child: Padding(
                        padding:  EdgeInsets.only(top:0),
                        child: Container(
                          height: 30,
                          width: 30,
                          // color: Colors.red,
                          child: Image.asset('lib/assets/icons/favouriteiconoutline.png', scale: 3.2,),
                        ),
                      ),
                    ),

                    currLang == 'ar' ?
                    Positioned(
                      bottom: widget.cHeight*0.045,
                      left: 0,
                      child: Padding(
                        padding:  EdgeInsets.only(top:0,right: 0),
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationZ(-0.1),
                          child: Container(
                            //color: Colors.red,
                            height: widget.cHeight*0.05,
                            width: widget.cWidth*0.18,

                            child: Row(
                              children: [
                                VariableText(text: widget.title4, fontsize: widget.cHeight*0.028,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                                SizedBox(width: widget.cHeight*0.0050,),
                                Column(
                                  children: [
                                    SizedBox(height: widget.cHeight*0.03,),
                                    VariableText(text: 'Eg', fontsize: widget.cHeight*0.015,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                  ],
                                )

                              ],
                            ),

                          ),
                        ),
                      ),
                    ) :
                    Positioned(
                      bottom: widget.cHeight*0.045,
                      right: 0,
                      child: Padding(
                        padding:  EdgeInsets.only(top:0,right: 0),
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationZ(0.1),
                          child: Container(
                            //color: Colors.red,
                            height: widget.cHeight*0.05,
                            width: widget.cWidth*0.18,

                            child: Row(
                              children: [
                                VariableText(text: widget.title4, fontsize: widget.cHeight*0.028,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                                SizedBox(width: widget.cHeight*0.0050,),
                                Column(
                                  children: [
                                    SizedBox(height: widget.cHeight*0.03,),
                                    VariableText(text: 'Eg', fontsize: widget.cHeight*0.015,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                  ],
                                )

                              ],
                            ),

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        );

      case Orientation.portrait:
        return Container(
          width: widget.cWidth,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Color(0x80F8F6F6),
              borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              //left
              Expanded(
                flex: 7,
                child: Container(
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Image.asset(widget.image)
                      ),
                      currLang == 'ar' ?
                      Positioned(
                          left: 0,
                          bottom: 0,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: Color(0xFF75CF75),
                              border: Border.all(color: Colors.white, width: 2)
                            ),
                          )
                      ) :
                      Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: Color(0xFF75CF75),
                                border: Border.all(color: Colors.white, width: 2)
                            ),
                          )
                      )

                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 12,
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      //color: Colors.yellow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: VariableText(text: widget.title1, fontsize: 17, fontcolor: Color(0xFF2C3E50),),
                              ),
                              SizedBox(width: 10,),
                              Padding(
                                padding: EdgeInsets.symmetric( horizontal: 3),
                                child: VariableText(text: '4.8', fontsize: 11, fontcolor: Color(0xFF2C3E50),),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric( horizontal: 2.0),
                                child: Image.asset('lib/assets/icons/appointment_rating.png', scale: 3.2,),
                              )
                            ],
                          ),
                          SizedBox(height: widget.cHeight*0.01,),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 5),
                            child: VariableText(text: widget.title2, fontsize: widget.cHeight*0.015, fontFamily:'sftr',fontcolor: Color(0x3c3C3C43),),
                          ),
                          SizedBox(height: widget.cHeight*0.01,),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>ClinicDetails()));
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric( horizontal: 5),
                                  child: VariableText(text: widget.title3, fontsize: widget.cHeight*0.012,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),
                                ),
                                /*image2==null?Container(): Image.asset(image2, scale: 3.2,),*/

                              ],
                            ),
                          ),
                          SizedBox(height: widget.cHeight*0.02,),
                          InkWell(
                            onTap:(){},
                            child: Padding(
                              padding: EdgeInsets.symmetric( horizontal:5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    //height:cHeight*0.06,
                                    //width: cWidth*0.38,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: themeColor2,
                                        border: Border.all(
                                            color: themeColor1
                                        )
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal:widget.cHeight*0.02, vertical: widget.cHeight*0.01),
                                      child: Row(
                                        children: [
                                          Image.asset('lib/assets/icons/chaticon.png', scale: 4.2,color: themeColor1,),
                                          SizedBox(width: widget.cHeight*0.01,),
                                          VariableText(
                                            text: getTranslated(context, "Receptionist"),
                                            fontcolor: themeColor1,
                                            fontFamily:'sfdm',
                                            fontsize: widget.cHeight*0.019,
                                          ),
                                        ],
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
                    Align(
                      alignment: currLang == 'ar' ? Alignment.topLeft:  Alignment.topRight,
                      child: Padding(
                        padding:  EdgeInsets.only(top:0),
                        child: Container(
                          height: 30,
                          width: 30,
                          // color: Colors.red,
                          child: Image.asset('lib/assets/icons/favouriteiconoutline.png', scale: 3.2,),
                        ),
                      ),
                    ),
                    currLang == 'ar' ?
                    Positioned(
                      bottom: widget.cHeight*0.045,
                      left: 0,
                      child: Padding(
                        padding:  EdgeInsets.only(top:0,right: 0),
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationZ(-0.1),
                          child: Container(
                            //color: Colors.red,
                            height: widget.cHeight*0.05,
                            width: widget.cWidth*0.18,

                            child: Row(
                              children: [
                                VariableText(text: widget.title4, fontsize: widget.cHeight*0.028,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                                SizedBox(width: widget.cHeight*0.0050,),
                                Column(
                                  children: [
                                    SizedBox(height: widget.cHeight*0.03,),
                                    VariableText(text: 'Eg', fontsize: widget.cHeight*0.015,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                  ],
                                )

                              ],
                            ),

                          ),
                        ),
                      ),
                    ):
                    Positioned(
                      bottom: widget.cHeight*0.045,
                      right: 0,
                      child: Padding(
                        padding:  EdgeInsets.only(top:0,right: 0),
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationZ(0.1),
                          child: Container(
                            //color: Colors.red,
                            height: widget.cHeight*0.05,
                            width: widget.cWidth*0.18,

                            child: Row(
                              children: [
                                VariableText(text: widget.title4, fontsize: widget.cHeight*0.028,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                                SizedBox(width: widget.cHeight*0.0050,),
                                Column(
                                  children: [
                                    SizedBox(height: widget.cHeight*0.03,),
                                    VariableText(text: 'Eg', fontsize: widget.cHeight*0.015,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                  ],
                                )

                              ],
                            ),

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );

    }

  }
}

class VetServiceBookOfferContainer extends StatefulWidget {
  var title1;
  var title2;
  var image;
  var title3;
  var title4;
  var title5;
  var image2;

  double cHeight;
  double cWidth;
  VetServiceBookOfferContainer({this.title1,
    this.title2,
    this.image,
    this.title3,
    this.title4,
    this.title5,
    this.image2
    ,this.cHeight, this.cWidth});

  @override
  _VetServiceBookOfferContainerState createState() => _VetServiceBookOfferContainerState();
}

class _VetServiceBookOfferContainerState extends State<VetServiceBookOfferContainer> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    switch (MediaQuery.of(context).orientation) {
      case Orientation.landscape:
        return Container(
          width: widget.cHeight,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0x80F8F6F6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  //left
                  Expanded(
                    flex: 4,
                    child: Container(
                      child: Stack(
                        children: [
                          Container(
                              padding: EdgeInsets.all(5),
                              child: Image.asset(widget.image)
                          ),
                          currLang == 'ar' ?
                          Positioned(
                              left: 0,
                              bottom: 0,
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Color(0xFF75CF75),
                                    border: Border.all(color: Colors.white, width: 2)
                                ),
                              )
                          ) :
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Color(0xFF75CF75),
                                    border: Border.all(color: Colors.white, width: 2)
                                ),
                              )
                          )

                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 13,
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          //color: Colors.yellow,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: VariableText(text: widget.title1, fontsize: 18, fontcolor: Color(0xFF2C3E50),),
                                  ),
                                ],
                              ),
                              SizedBox(height: widget.cHeight*0.01,),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 5),
                                child: VariableText(text: widget.title2, fontsize: widget.cHeight*0.016, fontFamily:'sftr',fontcolor: Color(0x3c3C3C43),),
                              ),
                              SizedBox(height: widget.cHeight*0.02,),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>ClinicDetails()));
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric( horizontal: 5),
                                      child: VariableText(text: widget.title3, fontsize: widget.cHeight*0.013,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50), underlined: true,),
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(height: widget.cHeight*0.05,),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (_)=>MainMessegeDetailsScreen()));

                                      },
                                      child: Container(
                                        width: widget.cWidth*0.38,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: themeColor2,
                                            border: Border.all(
                                                color: themeColor1
                                            )
                                        ),
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(horizontal:widget.cHeight*0.01, vertical: widget.cHeight*0.01),
                                          child: Row(
                                            children: [
                                              Image.asset('lib/assets/icons/chaticon.png', scale: 4.2,color: themeColor1,),
                                              SizedBox(width: widget.cHeight*0.01,),
                                              VariableText(
                                                text: getTranslated(context, "Receptionist"),
                                                fontcolor: themeColor1,
                                                fontFamily:'sfdm',
                                                fontsize: widget.cHeight*0.020,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        currLang == 'ar' ?
                        Positioned(
                          bottom: widget.cHeight*0.045,
                          left: 0,
                          child: Padding(
                            padding:  EdgeInsets.only(top:0,right: 0),
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationZ(-0.1),
                              child: Container(
                                //color: Colors.red,
                                height: widget.cHeight*0.05,
                                width: widget.cWidth*0.18,

                                child: Row(
                                  children: [
                                    VariableText(text: widget.title4, fontsize: widget.cHeight*0.028,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                                    SizedBox(width: widget.cHeight*0.0050,),
                                    Column(
                                      children: [
                                        SizedBox(height: widget.cHeight*0.03,),
                                        VariableText(text: 'Eg', fontsize: widget.cHeight*0.015,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                      ],
                                    )

                                  ],
                                ),

                              ),
                            ),
                          ),
                        ) :
                        Positioned(
                          bottom: widget.cHeight*0.045,
                          right: 0,
                          child: Padding(
                            padding:  EdgeInsets.only(top:0,right: 0),
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationZ(0.1),
                              child: Container(
                                //color: Colors.red,
                                height: widget.cHeight*0.05,
                                width: widget.cWidth*0.18,

                                child: Row(
                                  children: [
                                    VariableText(text: widget.title4, fontsize: widget.cHeight*0.028,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                                    SizedBox(width: widget.cHeight*0.0050,),
                                    Column(
                                      children: [
                                        SizedBox(height: widget.cHeight*0.03,),
                                        VariableText(text: 'Eg', fontsize: widget.cHeight*0.015,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                      ],
                                    )

                                  ],
                                ),

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
              Align(
                alignment: currLang == 'ar' ? Alignment.topLeft:  Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: GestureDetector(
                    onTap: (){
                      if(isFav == true){
                        setState(() {
                          isFav = false;
                        });
                      }else{
                        setState(() {
                          isFav = true;
                        });
                      }
                    },
                    child: Container(
                      child: isFav == true ?Icon(Icons.favorite, size: 35, color: Colors.red,) : Icon(Icons.favorite_border, size: 35, color: Colors.black54,),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

      case Orientation.portrait:
        return Container(
          width: widget.cWidth,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0x80F8F6F6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  //left
                  Expanded(
                    flex: 7,
                    child: Container(
                      child: Stack(
                        children: [
                          Container(
                              padding: EdgeInsets.all(5),
                              child: Image.asset(widget.image)
                          ),
                          currLang == 'ar' ?
                          Positioned(
                              left: 0,
                              bottom: 0,
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Color(0xFF75CF75),
                                    border: Border.all(color: Colors.white, width: 2)
                                ),
                              )
                          ) :
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Color(0xFF75CF75),
                                    border: Border.all(color: Colors.white, width: 2)
                                ),
                              )
                          )

                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 12,
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          //color: Colors.yellow,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: VariableText(text: widget.title1, fontsize: 17, fontcolor: Color(0xFF2C3E50),),
                                  ),
                                ],
                              ),
                              SizedBox(height: widget.cHeight*0.01,),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 5),
                                child: VariableText(text: widget.title2, fontsize: widget.cHeight*0.015, fontFamily:'sftr',fontcolor: Color(0x3c3C3C43),),
                              ),
                              SizedBox(height: widget.cHeight*0.01,),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>ClinicDetails()));
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric( horizontal: 5),
                                      child: VariableText(text: widget.title3, fontsize: widget.cHeight*0.012,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: widget.cHeight*0.02,),
                              Padding(
                                padding: EdgeInsets.symmetric( horizontal:5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (_)=>MainMessegeDetailsScreen()));

                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: themeColor2,
                                            border: Border.all(
                                                color: themeColor1
                                            )
                                        ),
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(horizontal:widget.cHeight*0.02, vertical: widget.cHeight*0.01),
                                          child: Row(
                                            children: [
                                              Image.asset('lib/assets/icons/chaticon.png', scale: 4.2,color: themeColor1,),
                                              SizedBox(width: widget.cHeight*0.01,),
                                              VariableText(
                                                text: getTranslated(context, "Receptionist"),
                                                fontcolor: themeColor1,
                                                fontFamily:'sfdm',
                                                fontsize: widget.cHeight*0.019,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),

                        currLang == 'ar' ?
                        Positioned(
                          bottom: widget.cHeight*0.045,
                          left: 0,
                          child: Padding(
                            padding:  EdgeInsets.only(top:0,right: 0),
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationZ(-0.1),
                              child: Container(
                                //color: Colors.red,
                                height: widget.cHeight*0.05,
                                //width: widget.cWidth*0.18,

                                child: Row(
                                  children: [
                                    VariableText(text: widget.title4, fontsize: widget.cHeight*0.021,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                                    SizedBox(width: widget.cHeight*0.0050,),
                                    Column(
                                      children: [
                                        SizedBox(height: widget.cHeight*0.03,),
                                        VariableText(text: 'Eg', fontsize: widget.cHeight*0.012,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                      ],
                                    )

                                  ],
                                ),

                              ),
                            ),
                          ),
                        ):
                        Positioned(
                          bottom: widget.cHeight*0.045,
                          right: 0,
                          child: Padding(
                            padding:  EdgeInsets.only(top:0,right: 0),
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationZ(0.1),
                              child: Container(
                                //color: Colors.red,
                                height: widget.cHeight*0.05,
                                //width: widget.cWidth*0.15,
                                child: Row(
                                  children: [
                                    VariableText(text: widget.title4, fontsize: widget.cHeight*0.021,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                                    SizedBox(width: widget.cHeight*0.0050,),
                                    Column(
                                      children: [
                                        SizedBox(height: widget.cHeight*0.03,),
                                        VariableText(text: 'Eg', fontsize: widget.cHeight*0.012,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                      ],
                                    )

                                  ],
                                ),

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Align(
                alignment: currLang == 'ar' ? Alignment.topLeft:  Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: GestureDetector(
                    onTap: (){
                      if(isFav == true){
                        setState(() {
                          isFav = false;
                        });
                      }else{
                        setState(() {
                          isFav = true;
                        });
                      }
                    },
                    child: Container(
                      child: isFav == true ?Icon(Icons.favorite, size: 30, color: Colors.red,) : Icon(Icons.favorite_border, size: 30, color: Colors.black54,),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

    }

  }
}


/*Widget selectLanguage() {
  double height=MediaQuery.of(context).size.height;
  double width=MediaQuery.of(context).size.width;
  switch (MediaQuery
      .of(context)
      .orientation) {
    case Orientation.landscape:
      return SafeArea(
        child: Scaffold(
          backgroundColor: themeColor2,
          body: SingleChildScrollView(

            child: Column(


              children: [

              ],
            ),
          ),
        ),
      );
    case Orientation.portrait:
      return SafeArea(
        child: Scaffold(
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(


              children: [

              ],
            ),
          ),
        ),
      );
  }
}*/




