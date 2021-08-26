import 'package:flutter/material.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/global_variables.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/screens/onboarding_screens/onboarding_screen3.dart';


class OnboardingScreen2 extends StatefulWidget {

  @override
  _OnboardingScreen2State createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2>  with TickerProviderStateMixin {
  AnimationController controller;
  bool landscapOrientation=true;
  int defaultindex=-1;
  String showpetType;

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
  @override
  initState() {
    super.initState();

    controller =
        BottomSheet.createAnimationController(this);
    controller.duration = Duration(seconds: 1);
    //print("selected pet type "+selectedPetType);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return OnboardingScreen2();
  }
  Widget OnboardingScreen2() {
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
            child: Padding(
              padding:  EdgeInsets.all(width*0.01),
              child: Column(
                children: [
                  ChangeOrientationIcon(ontap: (){    Navigator.of(context).pop();},size: width,),
                  SizedBox(height: width*0.08,),
                  Center(
                    child:
                    VariableText(text: "Time To Add Your Best Friend",
                      fontsize: width*0.030,
                      fontcolor: Color(0xff2B3E4F),
                      weight: FontWeight.bold,
                      fontFamily: 'sfdb',),
                  ),
                  Center(
                    child:
                    VariableText(text: "(Your Pet!)",
                      fontsize: width*0.030,
                      fontcolor: Color(0xff2B3E4F),
                      weight: FontWeight.bold,
                      fontFamily: 'sfdb',),
                  ),
                  SizedBox(height: width*0.05,),
                  Center(
                    child: Container(
                      child: CircleAvatar(
                        radius: width*0.12,
                        backgroundColor: Color(0xffEAF0F9),
                        backgroundImage: AssetImage('lib/assets/icons/dog.png'),
                      ),


                    ),
                  ),
                  SizedBox(height: width*0.07,),
                  RectangluartextFeild(
                    heights: width*0.07,
                    widths: width*0.90,

                    hinttext: "Pet's Name",
                    //cont: password,
                    textlength: 11,

                    fontsize: width*0.019,

                    // obscureText: true,

                    keytype: TextInputType.text,
                    //  onChanged: enableBtn(mobileno.text),

                  ),
                  SizedBox(height: width*0.02,),

                  RectangluartextFeildWithIcon(
                    heights: width*0.07,
                    widths: width*0.90,

                    fontsize: width*0.019,
                    enable: false,
                    hinttext: showpetType==null?"Select Pet Type":showpetType,
                    imageIconPath: "lib/assets/icons/dropdownicon.png",
                    keytype: TextInputType.text,
                    onTap: (){
                      selectPetType(width,height);

                    },
                  ),


                  SizedBox(height: width*0.07,),
                  CustomLoadingAnimation(height: width,width: height,animationPercent: 0.50,onTap: (){
                    showpetType=null;
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen3()));
                  },
                      ),
                  SizedBox(height: width*0.06,),

    /*         InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen3()));

                    },
                    child: Padding(padding:  EdgeInsets.only(bottom: width*0.04),

                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("lib/assets/icons/next-button2.png"),
                        backgroundColor: Colors.transparent,
                      ),
                    ),

                  ),*/









                ],
              ),
            ),
          ),
        );
      case Orientation.portrait:
        setState(() {
          if(landscapOrientation==true){
          landscapOrientation=false;}
          else{
            landscapOrientation=true;
          }


        });
        return Scaffold(
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Padding(
              padding:  EdgeInsets.all(height*0.01),
              child: Column(
                children: [
                  ChangeOrientationIcon(ontap: (){    Navigator.of(context).pop();},size: height,),
                  SizedBox(height: height*0.08,),
                  Center(
                    child:
                    VariableText(text: "Time To Add Your Best Friend",
                      fontsize: height*0.030,
                      fontcolor: Color(0xff2B3E4F),
                      weight: FontWeight.bold,
                      fontFamily: 'sfdb',),
                  ),
                  Center(
                    child:
                    VariableText(text: "(Your Pet!)",
                      fontsize: height*0.030,
                      fontcolor: Color(0xff2B3E4F),
                      weight: FontWeight.bold,
                      fontFamily: 'sfdb',),
                  ),
                  SizedBox(height: height*0.05,),
                  Center(
                    child: Container(
                      child: CircleAvatar(
                        radius: height*0.12,
                        backgroundColor: Color(0xffEAF0F9),
                        backgroundImage: AssetImage('lib/assets/icons/dog.png'),
                      ),


                    ),
                  ),
                  SizedBox(height: height*0.07,),
                  RectangluartextFeild(
                    heights: height*0.07,
                    widths: width*0.90,

                    hinttext: "Pet's Name",
                    //cont: password,
                    textlength: 11,

                    fontsize: height*0.019,

                    // obscureText: true,

                    keytype: TextInputType.text,
                    //  onChanged: enableBtn(mobileno.text),

                  ),
                  SizedBox(height: height*0.02,),

                  RectangluartextFeildWithIcon(
                    heights: height*0.07,
                    widths: width*0.90,

                    fontsize: height*0.019,
                    enable: false,
                    hinttext: showpetType==null?"Select Pet Type":showpetType,
                    imageIconPath: "lib/assets/icons/dropdownicon.png",
                    keytype: TextInputType.text,
                    onTap: (){

                      selectPetType(height,width);

                    },
                  ),


                  SizedBox(height: height*0.07,),
                  CustomLoadingAnimation(height: height,width: width,animationPercent: 0.50,onTap: (){
                    showpetType=null;

                    Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen3()));


                  },)
                ],
              ),
            ),
          ),
        );
    }
  }

  void selectPetType(double height,double width){
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
            return selectPetTypeClass(height:height,width:width,landscapOrientation:landscapOrientation
            ,onSelect: (temp){
              Navigator.of(context).pop();
              setState(() {
                showpetType=temp;
              });
              },);
            //whatever you're returning, does not have to be a Container
          }

      );
    });

  }
}

class selectPetTypeClass extends StatefulWidget {
 final double height,width;
 final bool landscapOrientation;
Function onSelect;
 selectPetTypeClass({this.height,this.width,this.landscapOrientation,this.onSelect});


  @override
  _selectPetTypeClassState createState() => _selectPetTypeClassState();
}

class _selectPetTypeClassState extends State<selectPetTypeClass> {

int defaultindex=-1;
String selectedPetType;

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
@override
initState() {
  super.initState();
 }
@override
void dispose() {
  super.dispose();



}

  @override
  Widget build(BuildContext context) {
   return
     Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft:Radius.circular(widget.height*0.05) ,
            topRight: Radius.circular(widget.height*0.05)
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: widget.height*0.03,),
            VariableText(text: "Select A Type",
              fontsize: widget.height*0.028,
              fontcolor: Color(0xff2B3E4F),

              fontFamily: 'sfdr',),
            SizedBox(height: widget.height*0.03,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
            child:            Row(
              children: [
                Expanded(
                  child: RectangluartextFeildWithStartIcon(
                    heights: widget.height*0.07,
                    // widths:widget. height*0.95,

                    fontsize:widget. height*0.019,
                    hinttext: "Search",
                    imageIconPath: "lib/assets/icons/searchIcon.png",
                    keytype: TextInputType.text,
                  ),
                ),
              ],
            ),)



            ,
            SizedBox(height:widget. height*0.02,),

            ListView.builder(
                physics: NeverScrollableScrollPhysics(), ///
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: pets.length,
                itemBuilder: (BuildContext context,int index){
                  return    InkWell(

                    onTap: (){
                      setState(() {
                        defaultindex=index;
                        selectedPetType=pets[defaultindex]['name'];
                      });
                      print("selected type"+selectedPetType);

                    },
                    child: Container(

                      color: defaultindex==index?themeColor1:themeColor2,
                      child: ListTile(

                        leading:
                        CircleAvatar(
                          radius:widget.height*0.02,
                          backgroundImage:
                          AssetImage(pets[index]['image']),
                          //  AssetImage("lib/assets/icons/changeorientation.png"),
                          backgroundColor: Color(0xffEAF0F9),
                        ),
                        title:  VariableText(
                          text:
                          pets[index]['name'],
                          fontsize: widget.height*0.017,
                          fontcolor:defaultindex==index?themeColor2:Color(0xff2B3E4F),
                          weight: FontWeight.normal,
                          fontFamily: 'sftr',),

                      ),
                    ),
                  );

                }),





            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                        buttonHeight:widget. height*0.06,
                       // buttonWidth:widget.height,
                        buttonBorderRadius:8,
                        buttonFontSize:widget.height*0.025,
                        buttonColor:themeColor1,
                        buttonTextColor:themeColor2,
                        buttonText: "Select",
                        buttonFontFamily:'sfdm',
                        buttonOnTap:()=>widget.onSelect(
                            selectedPetType
                        ),),
                  ),
                ],
              ),
            ),
             


            SizedBox(height: widget.width*0.07,),

          ],
        ),
      ),
    );
  }

}

