import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/models/cities_model.dart';
class ContactusScreen extends StatefulWidget {

  @override
  _ContactusScreenState createState() => _ContactusScreenState();
}

class _ContactusScreenState extends State<ContactusScreen> {
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
    return ContactusScreen();
  }
  Widget ContactusScreen() {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomMenuAppBar(size: width,title: "Contact Us",),
          ),
          backgroundColor: themeColor2,
          body: SingleChildScrollView(

            child: Padding(
              padding:  EdgeInsets.all(width*0.02),
              child: Column(
                children: [

                  SizedBox(height: width*0.05,),
                  Center(
                    child: Container(
                      height: width*0.20,
                      width: height*0.70,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/icons/contactus.png'
                              ),
                              fit: BoxFit.fill
                          )
                      ),


                    ),
                  ),
                  SizedBox(height: width*0.08,),
                  RectangluartextFeild(
                    heights: width*0.07,
                    widths: width*0.95,
                    hinttext: "Your Email",

                    fontsize: width*0.019,
                    keytype: TextInputType.emailAddress,
                  ),
                  SizedBox(height: width*0.02,),
                  Row(
                    children: [
                      Container(
                        height: width*0.07,
                        width: width*0.18,
                        decoration: BoxDecoration(
                          color: Color(0xffF5F8FA),
                          borderRadius: BorderRadius.circular(8),



                        ),
                        child:  DropdownButtonHideUnderline(
                            child: DropdownButton<City>(
                                value: sel_cities,
                                icon: Visibility (visible:false, child: Icon(Icons.arrow_downward)),

                                hint: Padding(
                                  padding:  EdgeInsets.only(left:width*0.07),
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
                                      padding:  EdgeInsets.only(left:width*0.07),
                                      child: Image.asset(item.toString(),scale: 4.5,) ,


                                    ),
                                  );
                                }).toList()
                            )),


                      ),

                      SizedBox(width: width*0.03,),



                      Container(
                        height: width*0.07,
                        width: width*0.75,
                        decoration: BoxDecoration(
                          color: Color(0xffF5F8FA),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child:
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal:width*0.025),
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            style:        TextStyle(
                              fontSize: width*0.019,
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
                              contentPadding: EdgeInsets.only(top: width*0.001, bottom: 0, left: width*0.1),
                              hintStyle:
                              TextStyle(
                                  fontSize: width*0.019,
                                  fontFamily: 'sftr',

                                  color: Color(
                                    0x6c3C3C43,
                                  )),
                              prefixIcon:
                              Padding(
                                padding:  EdgeInsets.only(left: width*0.01,right: width*0.01),
                                child: Text(

                                  '+$selectedCityCode',
                                  style:
                                  TextStyle(
                                      fontSize: width*0.019,
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










                    ],
                  ),
                  SizedBox(height: width*0.02,),
                  Container(
                    height: width*0.16,
                    width: width*0.95,
                    decoration: BoxDecoration(
                      color: Color(0xffF5F8FA),
                      borderRadius: BorderRadius.circular(8),

                    ),
                    child:  Padding(
                      padding: const EdgeInsets.only(right: 8.0,top: 8,bottom: 8,left: 20),
                      child: TextFormField(
                        /*          inputFormatters: [
                        LengthLimitingTextInputFormatter(25),
                      ],*/
                        style: TextStyle(
                          fontSize:  width*0.018,
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
                          disabledBorder: InputBorder.none, hintText: "Write your message",
                          hintStyle: TextStyle(
                              fontSize:  width*0.018,
                              fontFamily: 'sftr',

                              color: Color(
                                0x6c3C3C43,
                              )),
                        ),
                      ),
                    ) ,


                  ),



                  SizedBox(height: width*0.20,),

                  Padding(
                    padding:  EdgeInsets.only(bottom: width*0.03),
                    child: CustomButton(
                        buttonHeight: width*0.07,
                        buttonWidth:width*0.95,
                        buttonBorderRadius:8,
                        buttonFontSize:width*0.025,
                        buttonColor:themeColor1,
                        buttonTextColor:themeColor2,
                        buttonText: "Send message",
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

        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomMenuAppBar(size: height,title: "Contact Us",),
          ),
          backgroundColor: themeColor2,
          body:
          LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
                physics: ScrollPhysics(),
                child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(height: height*0.05,),
                            Center(
                              child: Container(
                                height: height*0.20,
                                width: width*0.70,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'lib/assets/icons/contactus.png'
                                        ),
                                        fit: BoxFit.fill
                                    )
                                ),




                              ),
                            ),
                            SizedBox(height: height*0.08,),
                            RectangluartextFeild(
                              heights: height*0.07,
                              widths: width*0.90,
                              hinttext: "Your Email",

                              fontsize: height*0.019,
                              keytype: TextInputType.emailAddress,
                            ),
                            SizedBox(height: height*0.02,),
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



                                Container(
                                  height: height*0.07,
                                  width: width*0.70,
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
                              ],
                            ),
                            SizedBox(height: height*0.02,),
                            Container(
                              height: height*0.16,
                              width: width*0.90,
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
                                    disabledBorder: InputBorder.none, hintText: "Write your message",
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
                              child:
                              CustomButton(
                                  buttonHeight: height*0.07,
                                  buttonWidth:width*0.90,
                                  buttonBorderRadius:8,
                                  buttonFontSize:height*0.025,
                                  buttonColor:themeColor1,
                                  buttonTextColor:themeColor2,
                                  buttonText: "Send message",
                                  buttonFontFamily:'sfdm',
                                  buttonOnTap:(){
                                    Navigator.pop(context);
                                  }
                              ),
                            )
                          ]
                      ),
                    )
                )
            );
          })
        );
    }
  }
}
