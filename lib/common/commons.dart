import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/models/chatMessageModel.dart';

class CustomButton extends StatefulWidget {
  final double buttonHeight,buttonWidth,buttonBorderRadius,buttonFontSize;
  final Color buttonColor,buttonTextColor;
  final String buttonText,buttonFontFamily;
  final Function buttonOnTap;
  const CustomButton({
    this.buttonHeight,
    this.buttonWidth,
    this.buttonBorderRadius,
    this.buttonFontSize,
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
          child: TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(textlength),
            ],
            style: TextStyle(
              fontSize:  fontsize,
              color: Color(0xff3C3C43,),
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

  final Color color;
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
            Padding(
              padding: const EdgeInsets.only(right: 8.0,top: 8,bottom: 6,left: 20),
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

                    color:hinttextColor,),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(heights*0.3),
              child:
              Align(
                  alignment: Alignment.topRight,
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
          decoration: BoxDecoration(
            color: Color(0xffF5F8FA),
            borderRadius: BorderRadius.circular(8),
          ),
          height: heights,
          width: widths,
          child: Stack(
            children: [
              Padding(
                padding:  EdgeInsets.only(right: 8.0,top: 8,bottom: 8,left: heights*0.95),
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
                padding:  EdgeInsets.all(heights*0.3),
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
        padding:  EdgeInsets.only(left:size*0.01,right: size*0.01,bottom: size*0.01,top: size*0.02),
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
      title: VariableText(text: title, fontcolor: Color(0xFF2C3E50), fontsize: 17, fontFamily: 'sftsb',),
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
              height: height*0.045,
              width: width*0.095,
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
                          children: [  CircleAvatar(
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
                      SizedBox(width: widget.width*0.44,),
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
                              child: VariableText(text: "32 Comments",
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

                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                            height: widget.width*0.06,
                            width: widget.width*0.801,
                            decoration:  BoxDecoration(
                              color: Color(0xffF0F5FC),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(widget.width*0.02) //                 <--- border radius here
                              ),
                            ),
                            child:
                            Padding(
                              padding:  EdgeInsets.all(widget.width*0.002),
                              child: TextField(
                                style:  TextStyle(color: Color(0xff2B3E4F),
                                    fontSize: widget.width*0.015,fontFamily: 'sftr'),

                                decoration: InputDecoration(
                                    hintText: "Write A Comment",
                                    hintStyle: TextStyle(color: Color(0xfc3C3C43),
                                        fontSize: widget.width*0.015,fontFamily: 'sftr'),

                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: widget.width*0.016,left: widget.width*0.738),
                            child: Image.asset("lib/assets/icons/cameraicon.png",scale: widget.width*0.005,),
                          )

                        ],
                      ),
                    ],
                  ),

                ),
              )
            ],

          ),
        );
      case Orientation.portrait:
        return    Container(

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
                      SizedBox(width: widget.height*0.10,),
                      Container(
                        height: widget.height*0.04,
                        width: widget.width*0.16,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(widget.height*0.01),
                            border: Border.all(color: themeColor1)
                        ),
                        child:   Center(
                          child: VariableText(text: "Follow",
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
                            VariableText(text: "64 Like ",
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
                              child: VariableText(text: "32 Comments",
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

              Container(
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

                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                          height: widget.height*0.06,
                          width:widget. width*0.72,
                          decoration:  BoxDecoration(
                            color: Color(0xffF0F5FC),
                            borderRadius: BorderRadius.all(
                                Radius.circular(widget.height*0.02) //                 <--- border radius here
                            ),
                          ),
                          child:
                          Padding(
                            padding:  EdgeInsets.all(widget.height*0.002),
                            child: TextField(
                              style:  TextStyle(color: Color(0xff2B3E4F),
                                  fontSize:widget. height*0.015,fontFamily: 'sftr'),

                              decoration: InputDecoration(
                                  hintText: "Write A Comment",
                                  hintStyle: TextStyle(color: Color(0xfc3C3C43),
                                      fontSize: widget.height*0.015,fontFamily: 'sftr'),

                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:widget. height*0.016,left: widget.height*0.298),
                          child: Image.asset("lib/assets/icons/cameraicon.png",scale: widget.height*0.005,),
                        )

                      ],
                    ),
                  ],
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
            SizedBox(height:widget.height*0.03,),
            VariableText(text: "Comments",
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


                            /*  Container(
                                padding:
                                EdgeInsets.only(left: 0, right: widget.width*0.09, top: 0, bottom: 0),
                                child: Align(
                                  alignment: ( Alignment.topRight),
                                  child: Container(
                                      child:VariableText(text: "10:05Am",fontsize: 11,fontFamily: 'sftr',fontcolor:hinttextColor)),
                                ),
                              ),*/
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
                                      child: Image.asset("lib/assets/icons/cameraicon.png",scale:widget.height*0.005,))),
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
                                          hintText: "Write A Comment",
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
                                        child: Image.asset("lib/assets/icons/chatsend.png",scale:widget.height*0.005,)),
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




///