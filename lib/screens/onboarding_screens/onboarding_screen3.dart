import 'package:flutter/material.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/screens/onboarding_screens/onboarding_screen4.dart';
class OnboardingScreen3 extends StatefulWidget {

  @override
  _OnboardingScreen3State createState() => _OnboardingScreen3State();
}

class _OnboardingScreen3State extends State<OnboardingScreen3>   {
  int genderSelected=0;
  bool landscapOrientation=true;
  List<String> gender=["Male","Female"];

  TextEditingController dateOfBirth=new TextEditingController();
  String showBreedType;

  List<Map<String, dynamic>> breedType = [
    {"name": "Terry Alvarado", },
    {"name": "Carmen Marshall", },
    {"name": "Steve Wells",    },
    {"name": "Dennis Lynch",   },
    {"name": "Richard Reyes" ,  },
    {"name": "Sara Mccoy",     },
    {"name": "Terry Alvarado", },
    {"name": "Carmen Marshall", },
    {"name": "Steve Wells",    },
    {"name": "Dennis Lynch",   },
    {"name": "Richard Reyes" ,  },
    {"name": "Sara Mccoy",     },

  ];


  _onselected(int i){
    setState(() {
      genderSelected=i;
    });
  }
  DateTime selectedDate = DateTime.now();
  var tempdate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        tempdate=selectedDate.toString().split(" ")[0];
        dateOfBirth.text=tempdate;
      });
  }


  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen3();
  }
  Widget OnboardingScreen3() {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        return Scaffold(
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
            child:  Padding(
              padding:  EdgeInsets.all(width*0.01),
              child: Column(
                children: [
                  SizedBox(height: width * 0.02,),
                  ChangeOrientationIcon(ontap: (){    Navigator.of(context).pop();},size: width,),
                  SizedBox(height: width*0.06,),
                  Center(
                    child:

                    VariableText(text: "You’re One Step Ahead Of",
                      fontsize: width*0.030,
                      fontcolor: Color(0xff2B3E4F),
                      weight: FontWeight.bold,
                      fontFamily: 'sfdb',),
                  ),
                  Center(
                    child:
                    VariableText(text: "Joining Petzola Community",
                      fontsize: width*0.030,
                      fontcolor: Color(0xff2B3E4F),
                      weight: FontWeight.bold,
                      fontFamily: 'sfdb',),
                  ),
                  SizedBox(height: width*0.05,),
                  Center(
                    child: Container(
                      child: CircleAvatar(
                        radius: width*0.08,
                        backgroundColor: Color(0xffEAF0F9),
                        backgroundImage: AssetImage('lib/assets/icons/dog.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: width*0.01,),
                  Center(
                    child:
                    VariableText(text: "Hello Senba;",
                      fontsize: width*0.020,
                      fontcolor: Color(0xff2B3E4F),

                      fontFamily: 'sfdr',),
                  ),
                  SizedBox(height: width*0.05,),
                  Row(
                     children:
                       List.generate(gender.length, (index){

                       return Row(
                         children: [
                           SizedBox(width: height*0.07,),
                           CustomButton(
                               buttonHeight: width*0.07,
                               buttonWidth:width*0.43,
                               buttonBorderRadius:4,
                               buttonFontSize:width*0.020,
                               buttonColor: genderSelected==index?themeColor1:Color(0xffF5F8FA),
                               buttonTextColor: genderSelected==index?themeColor2:Color(0xff2B3E4F),
                               buttonText: gender[index],
                               buttonFontFamily:'sftr',
                               buttonOnTap:(){
                                 _onselected(index);
                               }
                           ),
                         ],
                       );

                     }
                     ),
                   ),
                  SizedBox(height: width*0.02,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width*0.035),
                    child: Row(
                      children: [
                        RectangluartextFeildWithIcon(

                          heights: width*0.06,
                          widths:width*0.43,
                          cont: dateOfBirth,
                          fontsize:width*0.020,
                          enable: false,
                          hinttext: "Birthdate",
                          imageIconPath: "lib/assets/icons/calendericon.png",
                          keytype: TextInputType.text,
                          onTap: (){
                            _selectDate(context);
},
                        ),
                        SizedBox(width: height*0.05,),
                        RectangluartextFeildWithIcon(
                          heights: width*0.07,
                          widths: width*0.44,

                          fontsize: width*0.019,
                          enable: true,
                          hinttext: "Weight",
                          imageIconPath: "lib/assets/icons/kgicon.png",
                          keytype: TextInputType.number,
                          onTap: (){


                          },
                        ),



                      ],
                    ),
                  ),
                  SizedBox(height: width*0.02,),
                  RectangluartextFeildWithIcon(
                    heights: width*0.07,
                    widths: width*0.90,

                    fontsize: width*0.019,
                    enable: false,
                    hinttext: showBreedType==null?"Search Breed":showBreedType,
                    imageIconPath: "lib/assets/icons/dropdownicon.png",
                    keytype: TextInputType.text,
                    onTap: (){
                      selectBreedTypeL(width,height);

                    },
                  ),
                  SizedBox(height: width*0.07,),
                  CustomLoadingAnimation(height: width,width: height,animationPercent: 0.75,onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen4()));
                  },),
                  SizedBox(height: width*0.06,),
                 /* InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen4()));
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(bottom: width*0.04),

                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("lib/assets/icons/next-button3.png"),
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
        setState(() {
          landscapOrientation=false;
        });
        return Scaffold(
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child:
            Padding(
              padding:  EdgeInsets.all(height*0.01),
              child: Column(
                children: [
                  SizedBox(height: height * 0.02,),
                  ChangeOrientationIcon(ontap: (){    Navigator.of(context).pop();},size: height,),
                  SizedBox(height: height*0.06,),
                  Center(
                    child:

                    VariableText(text: "You’re One Step Ahead Of",
                      fontsize: height*0.030,
                      fontcolor: Color(0xff2B3E4F),
                      weight: FontWeight.bold,
                      fontFamily: 'sfdb',),
                  ),
                  Center(
                    child:
                    VariableText(text: "Joining Petzola Community",
                      fontsize: height*0.030,
                      fontcolor: Color(0xff2B3E4F),
                      weight: FontWeight.bold,
                      fontFamily: 'sfdb',),
                  ),
                  SizedBox(height: height*0.05,),
                  Center(
                    child: Container(
                      child: CircleAvatar(
                        radius: height*0.08,
                        backgroundColor: Color(0xffEAF0F9),
                        backgroundImage: AssetImage('lib/assets/icons/dog.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.01,),
                  Center(
                    child:
                    VariableText(text: "Hello Senba;",
                      fontsize: height*0.020,
                      fontcolor: Color(0xff2B3E4F),

                      fontFamily: 'sfdr',),
                  ),
                  SizedBox(height: height*0.05,),
                  Row(
                    children:
                    List.generate(gender.length, (index){

                      return Row(
                        children: [
                          SizedBox(width: width*0.04,),
                          CustomButton(
                              buttonHeight: height*0.07,
                              buttonWidth:width*0.42,
                              buttonBorderRadius:4,
                              buttonFontSize:height*0.020,
                              buttonColor: genderSelected==index?themeColor1:Color(0xffF5F8FA),
                              buttonTextColor: genderSelected==index?themeColor2:Color(0xff2B3E4F),
                              buttonText: gender[index],
                              buttonFontFamily:'sftr',
                              buttonOnTap:(){
                                _onselected(index);
                              }
                          ),





                        ],
                      );

                    }
                    ),
                  ),
                  SizedBox(height: height*0.01,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: height*0.015),
                    child: Row(
                      children: [
                        RectangluartextFeildWithIcon(

                          heights: height*0.06,
                          widths:width*0.42,

                          fontsize:height*0.020,
                          cont: dateOfBirth,
                          enable: false,
                          hinttext: "Birthdate",
                          imageIconPath: "lib/assets/icons/calendericon.png",
                          keytype: TextInputType.text,
                          onTap: (){
                            _selectDate(context);


                          },
                        ),
                        SizedBox(width: width*0.04,),
                        RectangluartextFeildWithIcon(
                          heights: height*0.07,
                          widths: width*0.43,

                          fontsize: height*0.019,
                          enable: true,
                          hinttext: "Weight",
                          imageIconPath: "lib/assets/icons/kgicon.png",
                          keytype: TextInputType.number,
                          onTap: (){


                          },
                        ),



                      ],
                    ),
                  ),
                  SizedBox(height: height*0.01,),
                  RectangluartextFeildWithIcon(
                    heights: height*0.07,
                    widths: width*0.90,

                    fontsize: height*0.019,
                    enable: false,
                    hinttext: showBreedType==null?"Search Breed":showBreedType,
                    imageIconPath: "lib/assets/icons/dropdownicon.png",
                    keytype: TextInputType.text,
                    onTap: (){
                      selectBreedType(height,width);

                    },
                  ),
                  SizedBox(height: height*0.07,),
                  CustomLoadingAnimation(height: height,width: width,animationPercent: 0.75,onTap: (){
                    showBreedType=null;
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen4()));


                  },)
                  /*InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>OnboardingScreen4()));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("lib/assets/icons/next-button3.png"),
                      backgroundColor: Colors.transparent,
                    ),
                  )*/








                ],
              ),
            ),
          ),
        );
    }
  }
  void selectBreedType(double height,double width){
    showModalBottomSheet(
        isScrollControlled: true,
        //transitionAnimationController: controller,
        backgroundColor: Colors.transparent,
        context: context, builder: (context) {
      return DraggableScrollableSheet(
          initialChildSize: 0.70, //set this as you want
          maxChildSize:0.70, //set this as you want
          minChildSize:0.70, //set this as you want

          builder: (context, scrollController) {
            return SearchBreed(height:height,width:width,landscapOrientation: landscapOrientation,
              onselected: (temp){
                Navigator.of(context).pop();
              setState(() {
                showBreedType=temp;
              });

            },);
            //whatever you're returning, does not have to be a Container
          }

      );
    });
  }
  void selectBreedTypeL(double height,double width){
    showModalBottomSheet(
        isScrollControlled: true,
        //transitionAnimationController: controller,
        backgroundColor: Colors.transparent,
        context: context, builder: (context) {
      return DraggableScrollableSheet(
          initialChildSize: 0.90, //set this as you want
          maxChildSize:0.90, //set this as you want
          minChildSize:0.70, //set this as you want

          builder: (context, scrollController) {
            return SearchBreed(height:height,width:width,landscapOrientation: landscapOrientation,
              onselected: (temp){
                Navigator.of(context).pop();
                setState(() {
                  showBreedType=temp;
                });

              },);
            //whatever you're returning, does not have to be a Container
          }

      );
    });
  }
}
class SearchBreed extends StatefulWidget {
  final double height,width;
  final bool landscapOrientation;
   Function onselected;
  SearchBreed({this.height,this.width,this.landscapOrientation,this.onselected});

  @override
  _SearchBreedState createState() => _SearchBreedState();
}

class _SearchBreedState extends State<SearchBreed> {
  List<Map<String, dynamic>> breedType = [
    {"name": "Terry Alvarado",},
    {"name": "Carmen Marshall",},
    {"name": "Steve Wells",},
    {"name": "Dennis Lynch",},
    {"name": "Richard Reyes",},
    {"name": "Sara Mccoy",},
    {"name": "Terry Alvarado",},
    {"name": "Carmen Marshall",},
    {"name": "Steve Wells",},
    {"name": "Dennis Lynch",},
    {"name": "Richard Reyes",},
    {"name": "Sara Mccoy",},

  ];
  int defaultindex=-1;
  String selectedBreedType;
  final TextEditingController _controller = new TextEditingController();
  List<dynamic> _list;
  bool _isSearching;
  List<dynamic>  searchresult = new List();
  bool startsearching;
  @override
  void initState() {
    super.initState();
    startsearching=false;
    _isSearching = false;
    values();
  }
  void values() {
    _list = List();
    _list.add(["Terry Alvarado"]);
    _list.add(["Carmen Marshall"]);
    _list.add(["Steve Wells",   ]);
    _list.add(["Dennis Lynch",   ]);
    _list.add(["Richard Reyes" ,  ]);
    _list.add(["Sara Mccoy",     ]);


  }
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
      child: Column(
        children: [
          SizedBox(height: widget.height*0.03,),
          VariableText(text: "Select Breed",
            fontsize: widget.height*0.028,
            fontcolor: Color(0xff2B3E4F),

            fontFamily: 'sfdr',),
          SizedBox(height: widget.height*0.03,),
          Padding(padding:  const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
      children: [
        Expanded(
          child: RectangluartextFeildWithStartIcon(
            heights: widget.height*0.07,
            fontsize: widget.height*0.019,
            hinttext: "Search",
            imageIconPath: "lib/assets/icons/searchIcon.png",
            keytype: TextInputType.text,
            onChanged: searchOperation,
          ),
        ),
      ],
      ),),
          SizedBox(height: widget.height*0.02,),
          Expanded(
            child: Container(
              //color: Colors.red,
              child:      searchresult.length != 0 || _controller.text.isNotEmpty
                  ? new ListView.builder(
                shrinkWrap: true,
                itemCount: searchresult.length,
                itemBuilder: (BuildContext context, int index) {

                  return new   InkWell(

                    onTap: (){
                      setState(() {
                        defaultindex=index;
                        selectedBreedType=searchresult[defaultindex][0];
                      });
                      print("selected type"+selectedBreedType);

                    },
                    child:  Container(
                      color: defaultindex==index?themeColor1:themeColor2,
                      child: ListTile(

                        title:  Padding(
                          padding:  EdgeInsets.only(left:widget.height*0.02),
                          child: VariableText(
                            text:
                            searchresult[index][0],
                            fontsize: widget.height*0.017,
                            fontcolor:defaultindex==index?themeColor2:Color(0xff2B3E4F),
                            weight: FontWeight.normal,
                            fontFamily: 'sftr',),
                        ),

                      ),
                    ),
                  );
                },
              )
                  :
                ListView.builder(
               // controller: scrollController,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: breedType.length,
                itemBuilder: (BuildContext context,int index){
                  return    InkWell(
                  onTap: (){

                  setState(() {
                  defaultindex=index;
                  selectedBreedType=breedType[defaultindex]['name'];
                  });},
                  //print("selected type"+selectedPetType);

                  child: Container(
                    color: defaultindex==index?themeColor1:themeColor2,
                    child: ListTile(

                        title:  Padding(
                          padding:  EdgeInsets.only(left:widget. height*0.02),
                          child: VariableText(
                            text:
                            breedType[index]['name'],
                            fontsize: widget.height*0.017,
                            fontcolor:defaultindex==index?themeColor2:Color(0xff2B3E4F),
                            weight: FontWeight.normal,
                            fontFamily: 'sftr',),
                        ),

                      ),
                    ),
                  );

                }),
            ),
          ),






      

          Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                      buttonHeight:widget. height*0.06,
                     
                      buttonBorderRadius:8,
                      buttonFontSize:widget.height*0.025,
                      buttonColor:themeColor1,
                      buttonTextColor:themeColor2,
                      buttonText: "Select",
                      buttonFontFamily:'sfdm',
                      buttonOnTap:(){
                        widget.onselected(
                            selectedBreedType
                        );

                      }
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: widget.width*0.02,),

        ],
      ),
    );
  }
  void searchOperation(String searchText) {


    searchresult.clear();
    if (_isSearching != null) {
      for (int i = 0; i < _list.length; i++) {
        String data = _list[i][0];
        print("data "+data);
        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          searchresult.addAll([_list[i]]);

          setState(() {
          });
        }
      }
    }
  }
}

