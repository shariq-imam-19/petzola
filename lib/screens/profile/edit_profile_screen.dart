import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/models/cities_model.dart';
class EditProfileScreen extends StatefulWidget {

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool viewPassword=true;
  List<City> cities=[];
  bool landscapeOrientation=false;
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

    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        setState(() {
          landscapeOrientation=true;
        });
        double width=MediaQuery.of(context).size.height;
        double height=MediaQuery.of(context).size.width;
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: CustomMenuAppBar(size: height,title: "Edit Profile",),
            ),
            backgroundColor: themeColor2,
            body:
            LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                  physics: ClampingScrollPhysics(parent:ScrollPhysics()),
                  child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(height: height*0.03,),
                              Center(
                                  child:
                                  CircleAvatar(
                                    radius: height*0.1,
                                    backgroundColor: Color(0xffF0F5FC),
                                    backgroundImage: AssetImage('lib/assets/icons/personprofile.png'),
                                  )
                              ),
                              SizedBox(height: height*0.05,),
                              RectangluartextFeild(
                                heights: height*0.07,
                                widths: height*0.95,
                                hinttext: "Your Name",

                                fontsize: height*0.019,
                                keytype: TextInputType.text,
                              ),
                              SizedBox(height: height*0.02,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // SizedBox(width: height*0.015,),

                                  Container(
                                    height: height*0.07,
                                    width: height*0.17,
                                    decoration: BoxDecoration(
                                      color: Color(0xffF5F8FA),
                                      borderRadius: BorderRadius.circular(8),



                                    ),
                                    child:  DropdownButtonHideUnderline(
                                        child: DropdownButton<City>(
                                            value: sel_cities,
                                            icon: Visibility (visible:false, child: Icon(Icons.arrow_downward)),

                                            hint: Padding(
                                              padding:  EdgeInsets.only(left:height*0.07),
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
                                                  padding:  EdgeInsets.only(left:height*0.07),
                                                  child: Image.asset(item.toString(),scale: 4.5,) ,


                                                ),
                                              );
                                            }).toList()
                                        )),


                                  ),
                                  SizedBox(width: height*0.025,),



                                  Container(
                                    height: height*0.07,
                                    width: height*0.75,
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
                              RectangluartextFeild(
                                heights: height*0.07,
                                widths: height*0.95,
                                hinttext: "Your Email",

                                fontsize: height*0.019,
                                keytype: TextInputType.emailAddress,
                              ),
                              SizedBox(height: height*0.06,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('lib/assets/icons/lockoutline.png',scale: height*0.006,),
                                  SizedBox(width: height*0.01,),
                                  InkWell(
                                    onTap: (){
                                      changePassword(height,width);
                                    },
                                    child: VariableText(text: "Change Password",
                                      underlined: true,
                                      fontsize: height*0.017,
                                      fontcolor: themeColor1,

                                      fontFamily: 'sftr',),
                                  ),
                                ],
                              ),
                              SizedBox(height: height*0.06),
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
                                    buttonText: "Save change",
                                    buttonFontFamily:'sfdm',
                                    buttonOnTap:(){
                                      Navigator.pop(context);
                                    }
                                ),
                              ),
                              SizedBox(height: height*0.05),


                            ]
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
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: CustomMenuAppBar(size: height,title: "Edit Profile",),
            ),
            backgroundColor: themeColor2,
            body:
            LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                  physics: ClampingScrollPhysics(parent:ScrollPhysics()),
                  child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(height: height*0.03,),
                              Center(
                                child:
                                CircleAvatar(
                                  radius: height*0.1,
                                  backgroundColor: Color(0xffF0F5FC),
                                  backgroundImage: AssetImage('lib/assets/icons/personprofile.png'),
                                )
                              ),
                              SizedBox(height: height*0.05,),
                              RectangluartextFeild(
                                heights: height*0.07,
                                widths: width*0.90,
                                hinttext: "Your Name",

                                fontsize: height*0.019,
                                keytype: TextInputType.text,
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
                              RectangluartextFeild(
                                heights: height*0.07,
                                widths: width*0.90,
                                hinttext: "Your Email",

                                fontsize: height*0.019,
                                keytype: TextInputType.emailAddress,
                              ),
                              SizedBox(height: height*0.04,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('lib/assets/icons/lockoutline.png',scale: height*0.006,),
                                  SizedBox(width: height*0.01,),
                                  InkWell(
                                    onTap: (){
                                      changePassword(height,width);
                                    },
                                    child: VariableText(text: "Change Password",
                                      underlined: true,
                                      fontsize: height*0.017,
                                      fontcolor: themeColor1,

                                      fontFamily: 'sftr',),
                                  ),
                                ],
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
                                    buttonText: "Save change",
                                    buttonFontFamily:'sfdm',
                                    buttonOnTap:(){
                                      Navigator.pop(context);
                                    }
                                ),
                              ),


                            ]
                        ),
                      )
                  )
              );
            })
        );
    }
  }
  void changePassword(double height,double width){
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
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft:Radius.circular(height*0.05) ,
                      topRight: Radius.circular(height*0.05)
                  ),
                ),
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: height*0.03,),
                      VariableText(text: "Change Password",
                        fontsize: height*0.028,
                        fontcolor: Color(0xff2B3E4F),

                        fontFamily: 'sfdr',),
                      SizedBox(height: height*0.06,),
                      Center(
                        child: Container(
                          height:height*0.15,
                          width:height*0.15,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                             image:AssetImage('lib/assets/icons/lock.png'),
                              fit: BoxFit.fill,
                            ),
                          //  shape: BoxShape.circle,
                          ),


                        ),
                      ),

                      SizedBox(height: height*0.05,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: RectangluartextFeildWithIcon(

                                heights: height*0.07,
                                obscuringCharacter: "*",

                                texthidden: viewPassword?true:false,
                                onTap: (){

                                  setState(() {

                                    if(viewPassword==false){
                                      viewPassword=true;
                                    }
                                    else{
                                      viewPassword=false;
                                    }
                                  });
                                },
                                fontsize: height*0.019,

                                hinttext: "Old Password",
                                imageIconPath: "lib/assets/icons/eyeicon.png",
                                keytype: TextInputType.text,

                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: RectangluartextFeildWithIcon(

                                heights: height*0.07,
     
                                obscuringCharacter: "*",

                                texthidden: viewPassword?true:false,
                                onTap: (){

                                  setState(() {

                                    if(viewPassword==false){
                                      viewPassword=true;
                                    }
                                    else{
                                      viewPassword=false;
                                    }
                                  });
                                },
                                fontsize: height*0.019,

                                hinttext: "New Password",
                                imageIconPath: "lib/assets/icons/eyeicon.png",
                                keytype: TextInputType.text,

                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: RectangluartextFeildWithIcon(

                                heights: height*0.07,
                                 obscuringCharacter: "*",

                                texthidden: viewPassword?true:false,
                                onTap: (){

                                  setState(() {

                                    if(viewPassword==false){
                                      viewPassword=true;
                                    }
                                    else{
                                      viewPassword=false;
                                    }
                                  });
                                },
                                fontsize: height*0.019,

                                hinttext: "Repeat New Password",
                                imageIconPath: "lib/assets/icons/eyeicon.png",
                                keytype: TextInputType.text,

                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height*0.06,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                  buttonHeight: height*0.07,
                                   buttonBorderRadius:8,
                                  buttonFontSize:height*0.025,
                                  buttonColor:themeColor1,
                                  buttonTextColor:themeColor2,
                                  buttonText: "Save new password",
                                  buttonFontFamily:'sfdm',
                                  buttonOnTap:(){
                                    Navigator.of(context).pop();
                                  }
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height*0.06,),


                    ],
                  ),
                ),
              ),
            );
            //whatever you're returning, does not have to be a Container
          }

      );
    });
  }
}
