import 'dart:io';
import 'package:flutter/material.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/screens/home/home_page.dart';
import 'package:image_picker/image_picker.dart';
class OnboardingScreen4 extends StatefulWidget {

  @override
  _OnboardingScreen4State createState() => _OnboardingScreen4State();
}

class _OnboardingScreen4State extends State<OnboardingScreen4>   {

  File _image;
  @override
  initState() {
    super.initState();

  }
  _imgFromGallery() async {


     File image = await  ImagePicker.pickImage(
         source: ImageSource.gallery, imageQuality: 50
     );

    setState(() {
      _image=image;
      print("djdjdj"+_image.toString());
    });
}

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen4();
  }
  Widget OnboardingScreen4() {
    bool _checkbox = false;
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        return Scaffold(
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
            child:
            Padding(
              padding:  EdgeInsets.all(width*0.01),
              child: Column(
                children: [
                  ChangeOrientationIcon(ontap: (){    Navigator.of(context).pop();},size: width,),
                  SizedBox(height: width*0.08,),
                  Center(
                    child:

                    VariableText(text: "Profile Is Ready!",
                      fontsize: width*0.030,
                      fontcolor: Color(0xff2B3E4F),
                      weight: FontWeight.bold,
                      fontFamily: 'sfdb',),
                  ),
                  Center(
                    child:
                    VariableText(text: "Add Their Profile Pic Now (Or Later)",
                      fontsize: width*0.015,
                      fontcolor: Color(0x3c3C3C43),
                      fontFamily: 'sftr',),
                  ),
                  SizedBox(height: width*0.05,),
                  SizedBox(
                    height: width*0.20,
                    width: height*0.40,
                    child: _image != null?

                    Container(

                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: FileImage(_image), // picked file
                              fit: BoxFit.fill)),
                    )
                        :
                    Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                          radius: width*0.12,
                          backgroundColor: Color(0xffEAF0F9),
                          backgroundImage: AssetImage('lib/assets/icons/profilepic.png'),
                        ),
                        Positioned(


                            bottom: 0,
                            right: -25,
                            child:
                            RawMaterialButton(
                              onPressed: () {
                                print("zdfjkdjkd");
                                _imgFromGallery();
                              },
                              elevation: 1.0,

                              fillColor: Color(0xffEAF0F9),
                              // 'lib/assets/icons/cameraicon.png'
                              child:Container(
                                child: Image.asset('lib/assets/icons/cameraicon.png',
                                  width: height*0.050,
                                  height: width*0.020,
                                  fit: BoxFit.fill,  ),
                              ),
                              shape: CircleBorder(
                                  side: BorderSide(color: Colors.white)

                              ),
                            )),
                      ],
                    ),
                  ),
               /*     Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                          radius: width*0.12,
                          backgroundColor: Color(0xffEAF0F9),
                          backgroundImage: AssetImage('lib/assets/icons/profilepic.png'),
                        ),
                        Positioned(


                            bottom: 0,
                            right: -25,
                            child:
                            RawMaterialButton(
                              onPressed: () {},
                              elevation: 1.0,

                              fillColor: Color(0xffEAF0F9),
                              // 'lib/assets/icons/cameraicon.png'
                              child:Container(
                                child: Image.asset('lib/assets/icons/cameraicon.png',
                                  width: height*0.050,
                                  height: width*0.020,
                                  fit: BoxFit.fill,  ),
                              ),
                              shape: CircleBorder(
                                  side: BorderSide(color: Colors.white)

                              ),
                            )),
                      ],
                    ),*/


                  SizedBox(height: width*0.03,),
                  Center(
                    child:
                    VariableText(text: "Hello Senba;",
                      fontsize: width*0.020,
                      fontcolor: Color(0xff2B3E4F),

                      fontFamily: 'sfdr',),
                  ),
                  SizedBox(height: width*0.01,),
                  Center(
                    child:
                    VariableText(text: "Carmen Marshall",
                      fontsize: width*0.015,
                      fontcolor: Color(0x3c3C3C43),
                      fontFamily: 'sftr',),
                  ),
                  SizedBox(height: width*0.20,),
                  CustomLoadingAnimation(height: width,width: height,animationPercent: 0.99,onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
                  },),
                  SizedBox(height: width*0.06,),




             /*     Padding(
                    padding:  EdgeInsets.only(bottom: width*0.04),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("lib/assets/icons/next-button4.png"),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  )*/








                ],
              ),
            ),
          ),
        );
      case Orientation.portrait:
        return Scaffold(
          backgroundColor: themeColor2,
          body:
          Padding(
            padding:  EdgeInsets.all(height*0.01),
            child: Column(
              children: [
                ChangeOrientationIcon(ontap: (){    Navigator.of(context).pop();},size: height,),
                SizedBox(height: height*0.08,),
                Center(
                  child:

                  VariableText(text: "Profile Is Ready!",
                    fontsize: height*0.030,
                    fontcolor: Color(0xff2B3E4F),
                    weight: FontWeight.bold,
                    fontFamily: 'sfdb',),
                ),
                Center(
                  child:
                  VariableText(text: "Add Their Profile Pic Now (Or Later)",
                    fontsize: height*0.015,
                    fontcolor: Color(0x3c3C3C43),
                    fontFamily: 'sftr',),
                ),
                SizedBox(height: height*0.05,),
          SizedBox(
            height: height*0.20,
            width: width*0.40,
            child:
            _image != null?

            Container(

              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: FileImage(_image), // picked file
                      fit: BoxFit.fill)),
            )
            :
            Stack(
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: [
                CircleAvatar(
                  radius: height*0.12,
                  backgroundColor: Color(0xffEAF0F9),
                  backgroundImage: AssetImage('lib/assets/icons/profilepic.png'),
                ),
                Positioned(


                    bottom: 0,
                    right: -25,
                    child:
                    RawMaterialButton(
                      onPressed: () {
                        print("zdfjkdjkd");
                        _imgFromGallery();
                      },
                      elevation: 1.0,

                      fillColor: Color(0xffEAF0F9),
                      // 'lib/assets/icons/cameraicon.png'
                      child:Container(
                        child: Image.asset('lib/assets/icons/cameraicon.png',
                          width: width*0.050,
                          height: height*0.020,
                          fit: BoxFit.fill,  ),
                      ),
                      shape: CircleBorder(
                          side: BorderSide(color: Colors.white)

                      ),
                    )),
              ],
            ),
          ),

                SizedBox(height: height*0.03,),
                Center(
                  child:
                  VariableText(text: "Hello Senba;",
                    fontsize: height*0.020,
                    fontcolor: Color(0xff2B3E4F),

                    fontFamily: 'sfdr',),
                ),
                Center(
                  child:
                  VariableText(text: "Carmen Marshall",
                    fontsize: height*0.015,
                    fontcolor: Color(0x3c3C3C43),
                    fontFamily: 'sftr',),
                ),



               Spacer(),
    Padding(
      padding:  EdgeInsets.only(bottom: height*0.04),
      child: CustomLoadingAnimation(height: height,width: width,animationPercent: 0.99,onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));}),
    )


    /*    Padding(
                  padding:  EdgeInsets.only(bottom: height*0.04),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("lib/assets/icons/next-button4.png"),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                )*/








              ],
            ),
          ),
        );
    }
  }

}
