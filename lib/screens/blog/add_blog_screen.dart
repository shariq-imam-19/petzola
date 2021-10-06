import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
class AddBlogScreen extends StatefulWidget {

  @override
  _AddBlogScreenState createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  File _image;
  @override
  initState() {
    super.initState();

  }
  _imgFromGallery() async {
    File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _image=image;
    });
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AddBlogScreen();
  }
  Widget AddBlogScreen(){
    switch(MediaQuery.of(context).orientation){
      case Orientation.landscape:
        double width=MediaQuery.of(context).size.height;
        double height=MediaQuery.of(context).size.width;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomMenuAppBar(size: height,title: "Create Post"),
          ),
          backgroundColor: themeColor2,
          body:  SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: height*0.025),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: height*0.05,),
                  Row(
                    children: [  CircleAvatar(
                      backgroundImage: AssetImage('lib/assets/icons/personprofile.png'),
                      backgroundColor: Color(0xffF0F5FC),
                    ),
                      SizedBox(width: height*0.015,),
                      VariableText(text: "Walid Eisa",
                        fontFamily: 'sfpr',
                        fontsize: height*0.015,
                        fontcolor: Color(0xff2B3E4F),),],
                  ),
                  SizedBox(height: height*0.025,),
                  Container(
                    height: height*0.14,
                    width: height*0.95,
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

                        keyboardType: TextInputType.text,


                        decoration: InputDecoration(
                          fillColor: Color(0xffF5F8FA),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none, hintText: getTranslated(context, "What's New"),
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
                  SizedBox(height: height*0.02,),
                  _image != null?
                  Container(
                    height: height*0.20,
                    width: height*0.95,
                    decoration: BoxDecoration(
                        color: Color(0xffF5F8FA),
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(

                            image: FileImage(_image), // picked file
                            fit: BoxFit.fill)),
                  )
                      :Container(
                      height: height*0.20,
                      width: height*0.95,
                      decoration: BoxDecoration(
                        color: Color(0xffF5F8FA),
                        borderRadius: BorderRadius.circular(8),

                      ),
                      child:InkWell(
                        onTap: (){
                          _imgFromGallery();
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("lib/assets/icons/cameraicon.png",scale:height*0.003,),
                            SizedBox(height: height*0.0055,),
                            VariableText(text: getTranslated(context, "Add Media"),
                              fontsize:  height*0.015,
                              fontFamily: 'sftr',
                              fontcolor: Color(
                                0x6c3C3C43,
                              ),),],
                        ),
                      )



                  ),
                  SizedBox(height: height*0.05,),


                  Padding(
                    padding:  EdgeInsets.only(bottom:height*0.03),
                    child: CustomButton(
                        buttonHeight: height*0.07,
                        buttonWidth:height*0.95,
                        buttonBorderRadius:8,
                        buttonFontSize:height*0.025,
                        buttonColor:themeColor1,
                        buttonTextColor:themeColor2,
                        buttonText: getTranslated(context, "Publish"),
                        buttonFontFamily:'sfdm',
                        buttonOnTap:(){
                          Navigator.pop(context);
                        }
                    ),
                  ),
                  SizedBox(height: height*0.06,),


                ],

              ),
            ),

          ),
        );
      case Orientation.portrait:
        double height=MediaQuery.of(context).size.height;
        double width=MediaQuery.of(context).size.width;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomMenuAppBar(size: height,title: "Create Post"),
          ),
          backgroundColor: themeColor2,
          body: LayoutBuilder(
            builder: (context,constraints){
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.maxWidth,minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: height*0.025),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(height: height*0.05,),
                          Row(
                            children: [  CircleAvatar(
                              backgroundImage: AssetImage('lib/assets/icons/personprofile.png'),
                              backgroundColor: Color(0xffF0F5FC),
                            ),
                              SizedBox(width: height*0.015,),
                    VariableText(text: "Walid Eisa",
                      fontFamily: 'sfpr',
                      fontsize: height*0.015,
                      fontcolor: Color(0xff2B3E4F),),],
                          ),
                          SizedBox(height: height*0.025,),
                          Container(
                            height: height*0.14,
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

                                keyboardType: TextInputType.text,


                                decoration: InputDecoration(
                                  fillColor: Color(0xffF5F8FA),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none, hintText: getTranslated(context, "What's New"),
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
                          SizedBox(height: height*0.02,),
                          _image != null?
                          Container(
                            height: height*0.20,
                            width: width*0.90,
                            decoration: BoxDecoration(
                                color: Color(0xffF5F8FA),
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(

                                    image: FileImage(_image), // picked file
                                    fit: BoxFit.fill)),
                            )
                              :Container(
                            height: height*0.20,
                            width: width*0.90,
                            decoration: BoxDecoration(
                              color: Color(0xffF5F8FA),
                              borderRadius: BorderRadius.circular(8),

                            ),
                            child:InkWell(
                              onTap: (){
                                _imgFromGallery();
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("lib/assets/icons/cameraicon.png",scale:height*0.003,),
                                  SizedBox(height: height*0.0055,),
                                  VariableText(text: getTranslated(context, "Add Media"),
                                    fontsize:  height*0.015,
                                    fontFamily: 'sftr',
                                    fontcolor: Color(
                                      0x6c3C3C43,
                                    ),),],
                              ),
                            )



                          ),
                          Spacer(),
                          Padding(
                            padding:  EdgeInsets.only(bottom:height*0.03),
                            child: CustomButton(
                                buttonHeight: height*0.07,
                                buttonWidth:width*0.90,
                                buttonBorderRadius:8,
                                buttonFontSize:height*0.025,
                                buttonColor:themeColor1,
                                buttonTextColor:themeColor2,
                                buttonText: getTranslated(context, "Publish"),
                                buttonFontFamily:'sfdm',
                                buttonOnTap:(){
                                  Navigator.pop(context);
                                }
                            ),
                          ),


                        ],

                      ),
                    ),
                  ),
                ),

              );
            },
          ),
        );
    }


  }


}
