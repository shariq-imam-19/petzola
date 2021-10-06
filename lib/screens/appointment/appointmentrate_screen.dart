import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class AppointmentRateScreen extends StatefulWidget {

  @override
  _AppointmentRateScreenState createState() => _AppointmentRateScreenState();
}

class _AppointmentRateScreenState extends State<AppointmentRateScreen> {
  int selectEmoji=2;
  List<Map<String, dynamic>> emojiList = [
    {
      "name": "Not Satisfied",
      "image": 'lib/assets/icons/emoji1.png'
    },  {
      "name": "Good",
      "image": 'lib/assets/icons/emoji2.png'
    },  {
      "name": "Nice Work",
      "image": 'lib/assets/icons/emoji3.png'
    },  {
      "name": "Awesome",
      "image": 'lib/assets/icons/emoji4.png'
    },


  ];
  _onselected(int i){
    setState(() {
      selectEmoji=i;
    });
  }
  @override
  Widget build(BuildContext context) {
    return AppointmentRateScreen();
  }
Widget AppointmentRateScreen() {

  switch (MediaQuery
      .of(context)
      .orientation) {
    case Orientation.landscape:
      double width=MediaQuery.of(context).size.height;
      double height=MediaQuery.of(context).size.width;
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomMenuAppBar(size: height,title: "Rate",),
        ),
        backgroundColor: themeColor2,
        body: SingleChildScrollView(

          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: height*0.025),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: height*0.04,),
                Center(
                  child: Container(
                    child:
                    CircleAvatar(
                      radius: height*0.08,
                      backgroundColor: Color(0xffF8F7F7),
                      backgroundImage: AssetImage('lib/assets/icons/circiledoctoricon.png'),
                    ),
                  ),
                ),
                SizedBox(height: height*0.015,),
                VariableText(text: "Tom Barrett",
                  fontsize: height*0.028,
                  fontcolor: Color(0xff2B3E4F),
                  fontFamily: 'sftr',),

                SizedBox(height: height*0.01,),
                VariableText(text: "Senior Cordiologist And Surgeon",
                  fontsize: height*0.016,
                  fontcolor: Color(0x6c3C3C43),
                  fontFamily: 'sftr',),

                VariableText(text: "United State Medical College & Hospital",
                  fontsize: height*0.016,
                  fontcolor: Color(0x6c3C3C43),
                  fontFamily: 'sftr',),
                SizedBox(height: height*0.04,),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  unratedColor: Color(0xffF8F7F7),
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) =>ImageIcon(
                    AssetImage("lib/assets/icons/staricon.png"),
                    color: Color(0xffF47920),
                  ),

                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(height: height*0.03,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                  List.generate(emojiList.length, (index){

                    return      Column(
                      children: [
                        InkWell(
                          onTap:(){
                            _onselected(index);
                          },
                          child: Container(
                              height:selectEmoji==index?height*0.075: height*0.07,
                              width:selectEmoji==index?height*0.075: height*0.07,
                              decoration: BoxDecoration(
                                color: selectEmoji==index? Color(0xffE8E8E8):Color(0xffF8F7F7),
                                borderRadius:BorderRadius.circular(50),
                              ),
                              child:Image.asset( emojiList[index]['image'],scale: 3.5,)
                          ),
                        ),
                        SizedBox(height: height*0.01,),
                        VariableText(text: emojiList[index]['name'],
                          fontsize: height*0.013,
                          fontcolor: Color(0x6c3C3C43),
                          fontFamily: 'sftr',),
                      ],
                    );

                  }
                  ),
                  /*  Column(
                      children: [
                        Container(
                            height: height*0.07,
                            width: height*0.07,
                            decoration: BoxDecoration(
                              color: Color(0xffF8F7F7),
                              borderRadius:BorderRadius.circular(50),
                            ),
                            child:Image.asset('lib/assets/icons/emoji1.png',scale: 3.5,)
                        ),
                        SizedBox(height: height*0.01,),
                        VariableText(text: "Not Satisfied",
                          fontsize: height*0.013,
                          fontcolor: Color(0x6c3C3C43),
                          fontFamily: 'sftr',),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            height: height*0.07,
                            width: height*0.07,
                            decoration: BoxDecoration(
                              color: Color(0xffF8F7F7),
                              borderRadius:BorderRadius.circular(50),
                            ),
                            child:Image.asset('lib/assets/icons/emoji2.png',scale: 3.5,)
                        ),
                        SizedBox(height: height*0.01,),
                        VariableText(text: "Good",
                          fontsize: height*0.013,
                          fontcolor: Color(0x6c3C3C43),
                          fontFamily: 'sftr',),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            height: height*0.075,
                            width: height*0.075,
                            decoration: BoxDecoration(
                              color: Color(0xffE8E8E8),
                              borderRadius:BorderRadius.circular(50),
                            ),
                            child:Image.asset('lib/assets/icons/emoji3.png',scale: 3.5,)
                        ),
                        SizedBox(height: height*0.01,),
                        VariableText(text: "Nice Work",
                          fontsize: height*0.013,
                          fontcolor: Color(0x6c3C3C43),
                          fontFamily: 'sftr',),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            height: height*0.07,
                            width: height*0.07,
                            decoration: BoxDecoration(
                              color: Color(0xffF8F7F7),
                              borderRadius:BorderRadius.circular(50),
                            ),
                            child:Image.asset('lib/assets/icons/emoji4.png',scale: 3.5,)
                        ),
                        SizedBox(height: height*0.01,),
                        VariableText(text: "Awesome",
                          fontsize: height*0.013,
                          fontcolor: Color(0x6c3C3C43),
                          fontFamily: 'sftr',),
                      ],
                    ),*/

                ),

                SizedBox(height: height*0.03,),
                Container(
                  height: height*0.13,
                  width: height*0.95,
                  decoration: BoxDecoration(
                    color: Color(0xffF8F9FA),
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
                        disabledBorder: InputBorder.none, hintText: "Write yout comment",
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
                SizedBox(height: height*0.06,),
                Padding(
                  padding:  EdgeInsets.only(bottom: height*0.03),
                  child: CustomButton(
                      buttonHeight: height*0.07,
                      buttonWidth:width*0.60,
                      buttonBorderRadius:8,
                      buttonFontSize:height*0.025,
                      buttonColor:themeColor1,
                      buttonTextColor:themeColor2,
                      buttonText: "Confirm",
                      buttonFontFamily:'sfdm',
                      buttonOnTap:(){
                        Navigator.pop(context);
                      }
                  ),
                )





              ],
            ),
          ),
        ),
      );
    case Orientation.portrait:
      double height=MediaQuery.of(context).size.height;
      double width=MediaQuery.of(context).size.width;
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomMenuAppBar(size: height,title: "Rate",),
        ),
        backgroundColor: themeColor2,
        body: LayoutBuilder(builder: (context,constraints){
         return SingleChildScrollView(

              child:  ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child:   Padding(
            padding:  EdgeInsets.symmetric(horizontal: height*0.025),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: height*0.04,),
                Center(
                  child: Container(
                    child:
                    CircleAvatar(
                      radius: height*0.08,
                      backgroundColor: Color(0xffF8F7F7),
                      backgroundImage: AssetImage('lib/assets/icons/circiledoctoricon.png'),
                    ),
                  ),
                ),
                SizedBox(height: height*0.015,),
                VariableText(text: "Tom Barrett",
                  fontsize: height*0.028,
                  fontcolor: Color(0xff2B3E4F),
                  fontFamily: 'sftr',),

                SizedBox(height: height*0.01,),
                VariableText(text: "Senior Cordiologist And Surgeon",
                  fontsize: height*0.016,
                  fontcolor: Color(0x6c3C3C43),
                  fontFamily: 'sftr',),

                VariableText(text: "United State Medical College & Hospital",
                  fontsize: height*0.016,
                  fontcolor: Color(0x6c3C3C43),
                  fontFamily: 'sftr',),
                SizedBox(height: height*0.04,),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              unratedColor: Color(0xffF8F7F7),
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) =>ImageIcon(
                AssetImage("lib/assets/icons/staricon.png"),
                color: Color(0xffF47920),
              ),

              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
                SizedBox(height: height*0.03,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                    List.generate(emojiList.length, (index){

                      return      Column(
                        children: [
                          InkWell(
                            onTap:(){
                              _onselected(index);
                            },
                            child: Container(
                                height:selectEmoji==index?height*0.075: height*0.07,
                                width:selectEmoji==index?height*0.075: height*0.07,
                                decoration: BoxDecoration(
                                  color: selectEmoji==index? Color(0xffE8E8E8):Color(0xffF8F7F7),
                                  borderRadius:BorderRadius.circular(50),
                                ),
                                child:Image.asset( emojiList[index]['image'],scale: 3.5,)
                            ),
                          ),
                          SizedBox(height: height*0.01,),
                          VariableText(text: emojiList[index]['name'],
                            fontsize: height*0.013,
                            fontcolor: Color(0x6c3C3C43),
                            fontFamily: 'sftr',),
                        ],
                      );

                    }
                    ),


                ),
                SizedBox(height: height*0.03,),
                Container(
                  height: height*0.13,
                  width: width*0.90,
                  decoration: BoxDecoration(
                    color: Color(0xffF8F9FA),
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
                        disabledBorder: InputBorder.none, hintText: "Write yout comment",
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
                Spacer(),
                Padding(
                  padding:  EdgeInsets.only(bottom: height*0.03),

                  child: CustomButton(
                      buttonHeight: height*0.07,
                      buttonWidth:width*0.40,
                      buttonBorderRadius:8,
                      buttonFontSize:height*0.025,
                      buttonColor:themeColor1,
                      buttonTextColor:themeColor2,
                      buttonText: "Confirm",
                      buttonFontFamily:'sfdm',
                      buttonOnTap:(){
                        Navigator.pop(context);
                      }
                  ),
                )





              ],
            ),
          ),
                  )
              )

          );
        })

      );
  }
}
}


