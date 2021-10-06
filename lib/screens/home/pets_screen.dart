import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:petzola/common/commons.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';

import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
import 'package:petzola/screens/onboarding_screens/onboarding_screen2.dart';

class PetsScreen extends StatefulWidget {
  @override
  _PetsScreenState createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {

  Map<String, dynamic> myPets = {'pets': [
    {
      "name": "Tommy",
      "image": "lib/assets/images/myPets_2.png",
      "type": "Dog",
      "characteristic": "Curly-Coated Retriever",
      "gender": "Female",
      "age": "4 Years",
      "color": "Brown",
      "weight": "6Kg"
    },
    {
      "name": "Senba",
      "image": "lib/assets/images/myPets_1.png",
      "type": "Dog",
      "characteristic": "Curly-Coated Retriever",
      "gender": "Male",
      "age": "7 Years",
      "color": "Black",
      "weight": "8Kg"
    },
    {
      "name": "Jack",
      "image": "lib/assets/images/myPets_3.png",
      "type": "Dog",
      "characteristic": "Curly-Coated Retriever",
      "gender": "Male",
      "age": "9 Years",
      "color": "Dark Grey",
      "weight": "10Kg"
    }
  ]};

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    switch (MediaQuery.of(context).orientation) {
      case Orientation.landscape:
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.05),
              Container(
                height: size.height * 0.35,
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: Color(0xFFF0F5FC),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    VariableText(text: getTranslated(context, 'Your Pets Need Your Care And Attention To Keep'),
                        fontsize: size.width * 0.016, textAlign: TextAlign.center,
                        fontcolor: Color(0xFF2B3E4F)),
                    SizedBox(height: 5),
                    VariableText(text: getTranslated(context, 'Them Healthy, Happy, And Safe.'),
                        fontsize: size.width * 0.016, textAlign: TextAlign.center,
                        fontcolor: Color(0xFF2B3E4F)),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: VariableText(text: 'My Pets', fontsize: 17, fontcolor: Color(0xFF2B3E4F),),
                  ),
                ],
              ),
              InkWell(
                onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen2()));
                },
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 10),
                      child: DottedBorder(
                        color: Color(0xFFE8E8E8),
                        strokeWidth: 0.5,
                        dashPattern: [10,5,10,5,10,5],
                        borderType: BorderType.RRect,
                        radius: Radius.circular(10),
                        child: Container(
                          height: size.width * 0.05,
                          width: size.width * 0.15,
                          decoration: BoxDecoration(
                            color: Color(0xFFF8F9FA), //Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: VariableText(text: getTranslated(context, 'Add New'), fontsize: 15, fontcolor: Color(0x603C3C43)),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 12),
                  alignment: Alignment.topLeft,
                  height: size.width*0.80,
                  width: size.width,
                  child: MyPetsSlider(myPets: myPets['pets'], cHeight: size.height, cWidth: size.width,)),
              SizedBox(height: 0,),
            ],
          ),
        );
      case Orientation.portrait:
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.03),
              Container(
                height: size.height * 0.15,
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: Color(0xFFF0F5FC),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    VariableText(text: getTranslated(context, 'Your Pets Need Your Care And Attention To Keep'),
                        fontsize: size.height * 0.016, textAlign: TextAlign.center,
                        fontcolor: Color(0xFF2B3E4F)),
                    SizedBox(height: 5),
                    VariableText(text: getTranslated(context, 'Them Healthy, Happy, And Safe.'),
                        fontsize: size.height * 0.016, textAlign: TextAlign.center,
                        fontcolor: Color(0xFF2B3E4F)),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: VariableText(text: getTranslated(context, 'My Pets'), fontsize: 17, fontcolor: Color(0xFF2B3E4F),),
                  ),
                ],
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen2()));
                  },
                    child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 10),
                      child: DottedBorder(
                        color: Color(0xFFE8E8E8),
                        strokeWidth: 0.5,
                        dashPattern: [10,5,10,5,10,5],
                        borderType: BorderType.RRect,
                        radius: Radius.circular(10),
                        child: Container(
                          height: size.height * 0.05,
                          width: size.width * 0.30,
                          decoration: BoxDecoration(
                              color: Color(0xFFF8F9FA), //Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: VariableText(
                                text: getTranslated(context, 'Add New'),
                                fontsize: 15, fontcolor: Color(0x603C3C43)),),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 12),
                  //color: Colors.red,
                  //alignment: Alignment.topLeft,
                  height: size.height * 0.68,
                  width: size.width,
                  child: MyPetsSlider(myPets: myPets['pets'], cHeight: size.height, cWidth: size.width,)
              ),
              SizedBox(height: 85,),
            ],
          ),
        );
    }
  }
}
