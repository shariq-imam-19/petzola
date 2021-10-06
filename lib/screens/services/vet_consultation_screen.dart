import 'package:flutter/material.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
import 'package:petzola/screens/messege/messege_details_Screen.dart';
import 'package:petzola/screens/services/PetConsultationServiceScreen.dart';
import 'package:petzola/screens/services/pet_service_book_offer_screen.dart';
class VetConsultationServiceScreen extends StatefulWidget {

  @override
  _VetConsultationServiceScreenState createState() => _VetConsultationServiceScreenState();
}

class _VetConsultationServiceScreenState extends State<VetConsultationServiceScreen> {


  @override
  Widget build(BuildContext context) {
    return GroomingServiceScreen();
  }
  Widget GroomingServiceScreen() {

    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        double width=MediaQuery.of(context).size.height;
        double height=MediaQuery.of(context).size.width;
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomAppBarHome(size: height,title: "D&C Clinic",),
          ),

          backgroundColor: themeColor2,
          body:
          SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:height*0.025),
              child: Column(
                children: [
                  SizedBox(height: height*0.02,),
                  Row(
                    children: [
                      Expanded(
                        child: RectangluartextFeildWithStartIcon(
                          heights: height*0.07,
                          fontsize:height*0.019,
                          hinttext: getTranslated(context, "Find your clinic"),

                          imageIconPath: "lib/assets/icons/searchIcon.png",
                          keytype: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
                  Container(

                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: (){
                              showSpeciality(context,height,width);
                            },
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: themeColor2,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Color(0XFFE8E8E8))
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  VariableText(text: getTranslated(context, "Speciality"),
                                    fontsize: 11,
                                    fontcolor: Color(0xff2B3E4F),
                                    fontFamily: 'sfdr',),
                                  Image.asset('lib/assets/icons/dropdownicon.png',scale: 5.5,),


                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: height*0.01,),
                        Expanded(
                          flex: 3,
                          child: InkWell(
                            onTap: (){
                              showServiceLocation(context,height,width);
                            },
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: themeColor2,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Color(0XFFE8E8E8))
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  VariableText(text: getTranslated(context, "Service Location"),
                                    fontsize: 11,
                                    fontcolor: Color(0xff2B3E4F),
                                    fontFamily: 'sfdr',),
                                  Image.asset('lib/assets/icons/dropdownicon.png',scale: 5.5,),


                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: height*0.01,),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: (){},
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: themeColor2,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Color(0XFFE8E8E8))
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset('lib/assets/icons/myVaccination_sort.png',scale: 3.5,),



                                ],
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),

                  SizedBox(height: height*0.02,),
                  ListView.builder(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount:3,
                      itemBuilder: (BuildContext context, index){
                        return  Column(
                          children: [
                            VetServiceContainer(
                                cWidth:width,
                                cHeight: height,
                              ontapbooknow: (){
                                selectPetType(context,height,width);
                              },
                            ),
                            SizedBox(height: height*0.02,),
                          ],
                        );
                      })



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
            child: CustomAppBarHome(size: height,title: "D&C Clinic",),
          ),

          backgroundColor: themeColor2,
          body:
          SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:height*0.025),
              child: Column(
                children: [
                  SizedBox(height: height*0.02,),
                  Row(
                    children: [
                      Expanded(
                        child: RectangluartextFeildWithStartIcon(
                          heights: height*0.06,
                          fontsize:height*0.019,
                          hinttext: getTranslated(context, "Search"),
                          imageIconPath: "lib/assets/icons/searchIcon.png",
                          keytype: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.02,),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: (){
                          showSpeciality(context,height,width);
                        },
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: themeColor2,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0XFFE8E8E8))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              VariableText(text: getTranslated(context, "Speciality"),
                                fontsize: 11,
                                fontcolor: Color(0xff2B3E4F),
                                fontFamily: 'sfdr',),
                              Image.asset('lib/assets/icons/dropdownicon.png',scale: 5.5,),


                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: height*0.01,),
                    Expanded(
                      flex: 3,
                      child: InkWell(
                        onTap: (){
                          showServiceLocation(context,height,width);
                        },
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: themeColor2,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0XFFE8E8E8))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              VariableText(text: getTranslated(context, "Service Location"),
                                fontsize: 11,
                                fontcolor: Color(0xff2B3E4F),
                                fontFamily: 'sfdr',),
                              Image.asset('lib/assets/icons/dropdownicon.png',scale: 5.5,),


                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: height*0.01,),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: themeColor2,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0XFFE8E8E8))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset('lib/assets/icons/myVaccination_sort.png',scale: 3.5,),



                            ],
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),

                  SizedBox(height: height*0.02,),
                  ListView.builder(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount:3,
                      itemBuilder: (BuildContext context, index){
                        return  Column(
                          children: [
                            VetServiceContainer(
                                cWidth:width,
                                cHeight: height,
                              ontapbooknow: (){
                                selectPetType(context,height,width);
                              },


                            ),
                            SizedBox(height: height*0.02,),
                          ],
                        );
                      })



                ],
              ),
            ),
          ),
        );
    }
  }

  showSpeciality(BuildContext context, double height,double width){
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (BuildContext context) {
          return SpecialitySheet(cHeight: height, cWidth: width, onNext: (){Navigator.of(context).pop();});
        });
  }
  showServiceLocation(BuildContext context, double height,double width){
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (BuildContext context) {
          return ServiceLocationSheet(cHeight: height, cWidth: width, onNext: (){Navigator.of(context).pop();});
        });
  }
  selectPetType(BuildContext context, double height,double width){
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (BuildContext context) {
          return PetTypeSheet(height: height, width: width, onNext: (){
            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (_)=>/*PetConsultationServiceScreen()*/PetServiceBookOfferScreen()));

         }
          );
        });
  }


}



