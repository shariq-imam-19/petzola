import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/style.dart';
class ViewProfileScreen extends StatefulWidget {

  @override
  _ViewProfileScreenState createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  List<String> profileButton=['News','Photos','Videos'];
  int _selectedIndex=0;
  _onSelected(int i){
    setState(() {
      _selectedIndex=i;
    });

  }
  @override
  Widget build(BuildContext context) {
    return AddBlogScreen();
  }
  Widget AddBlogScreen(){
    switch(MediaQuery.of(context).orientation){
      case Orientation.landscape:
        double width=MediaQuery.of(context).size.width;
        double height=MediaQuery.of(context).size.width;
        return Scaffold(
          //resizeToAvoidBottomInset: false,
          appBar: renderAppbar(),
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(parent:ScrollPhysics()),

            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:height*0.025),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height*0.03,),
                  Container(
                    height: height*0.20,
                    width: width,

                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal:height*0.03),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              SizedBox(height: height*0.05,),
                              VariableText(text: "921k",
                                fontFamily: 'sfdr',
                                fontsize: height*0.022,
                                fontcolor: Color(0xff00AEEF),),
                              SizedBox(height: height*0.004,),
                              VariableText(text: "Following",
                                fontsize: height*0.016,
                                fontcolor: Color(0x6c3C3C43),
                                fontFamily: 'sftr',),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: height*0.05,),
                              Center(
                                child: Container(
                                  child: CircleAvatar(
                                    radius: height*0.05,
                                    backgroundColor: Color(0xffF0F5FC),
                                    backgroundImage: AssetImage('lib/assets/icons/personprofile.png'),
                                  ),
                                ),
                              ),
                              SizedBox(height: height*0.015,),
                              VariableText(text: "Christine Reyes",
                                fontsize: height*0.022,
                                fontFamily: 'sfdr',
                                fontcolor: Color(0xff2B3E4F),)

                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              SizedBox(height: height*0.05,),
                              VariableText(text: "34k",
                                fontFamily: 'sfdr',
                                fontsize: height*0.022,
                                fontcolor: Color(0xff00AEEF),),
                              SizedBox(height: height*0.004,),
                              VariableText(text: "Followers",
                                fontsize: height*0.016,
                                fontcolor: Color(0x6c3C3C43),
                                fontFamily: 'sftr',),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.01,),
                  Center(
                      child:
                      Container(
                        height: height*0.05,
                        width: width*0.25,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(height*0.01),
                            border: Border.all(color: Color(0xffE8E8E8))
                        ),
                        child:   Center(
                          child: VariableText(text: "Follow",
                              fontFamily: 'sfdm',
                              fontsize: height*0.017,
                              fontcolor: themeColor1),
                        ),
                      )
                  ),
                  SizedBox(height: height*0.04),
                  Container(
                    child: Row(
                      children: List.generate(profileButton.length, (index) =>
                          GestureDetector(
                            onTap: () {
                              _onSelected(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF8F7F7),
                                borderRadius:
                                BorderRadius.circular(15),
                                /* index == 0 ? BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)):
                          BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))*/
                              ),
                              child: Container(
                                height: height*0.06,
                                width: width*0.295,
                                decoration: BoxDecoration(
                                    color: _selectedIndex == index
                                        ? Color(0xFF00AEEF)
                                        : Color(0xFFF8F7F7),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: VariableText(
                                      text: profileButton[index],
                                      fontsize: 15,
                                      fontcolor: _selectedIndex == index
                                          ? Colors.white
                                          : Color(0xFF2C3E50)),
                                ),
                              ),
                            ),
                          ),),
                    ),
                  ),
                  SizedBox(height: height*0.04),
                  CustomBlogContainer(height: height,width: height,onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>ViewProfileScreen()));
                  }),
                  SizedBox(height: height*0.02),



                ],
              ),
            ),
          ),
        );
      case Orientation.portrait:
        double height=MediaQuery.of(context).size.height;
        double width=MediaQuery.of(context).size.width;
        return Scaffold(
          //resizeToAvoidBottomInset: false,
          appBar: renderAppbar(),
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(parent:ScrollPhysics()),

            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:height*0.025),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height*0.03,),
                  Container(
                    height: height*0.20,
                    width: width,

                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal:height*0.03),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              SizedBox(height: height*0.05,),
                              VariableText(text: "921k",
                                fontFamily: 'sfdr',
                                fontsize: height*0.022,
                                fontcolor: Color(0xff00AEEF),),
                              SizedBox(height: height*0.004,),
                              VariableText(text: "Following",
                                fontsize: height*0.016,
                                fontcolor: Color(0x6c3C3C43),
                                fontFamily: 'sftr',),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: height*0.05,),
                              Center(
                                child: Container(
                                  child: CircleAvatar(
                                    radius: height*0.05,
                                    backgroundColor: Color(0xffF0F5FC),
                                    backgroundImage: AssetImage('lib/assets/icons/personprofile.png'),
                                  ),
                                ),
                              ),
                              SizedBox(height: height*0.015,),
                              VariableText(text: "Christine Reyes",
                                fontsize: height*0.022,
                                fontFamily: 'sfdr',
                                fontcolor: Color(0xff2B3E4F),)

                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              SizedBox(height: height*0.05,),
                              VariableText(text: "34k",
                                fontFamily: 'sfdr',
                                fontsize: height*0.022,
                                fontcolor: Color(0xff00AEEF),),
                              SizedBox(height: height*0.004,),
                              VariableText(text: "Followers",
                                fontsize: height*0.016,
                                fontcolor: Color(0x6c3C3C43),
                                fontFamily: 'sftr',),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.01,),
                  Center(
                    child:
                    Container(
                      height: height*0.05,
                      width: width*0.25,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(height*0.01),
                          border: Border.all(color: Color(0xffE8E8E8))
                      ),
                      child:   Center(
                        child: VariableText(text: "Follow",
                            fontFamily: 'sfdm',
                            fontsize: height*0.017,
                            fontcolor: themeColor1),
                      ),
                    )
                  ),
                  SizedBox(height: height*0.04),
                  Container(
                    child: Row(
                      children: List.generate(profileButton.length, (index) =>
                          GestureDetector(
                            onTap: () {
                              _onSelected(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF8F7F7),
                                borderRadius:
                                BorderRadius.circular(15),
                                /* index == 0 ? BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)):
                          BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))*/
                              ),
                              child: Container(
                                height: height*0.06,
                                width: width*0.295,
                                decoration: BoxDecoration(
                                    color: _selectedIndex == index
                                        ? Color(0xFF00AEEF)
                                        : Color(0xFFF8F7F7),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: VariableText(
                                      text: profileButton[index],
                                      fontsize: 15,
                                      fontcolor: _selectedIndex == index
                                          ? Colors.white
                                          : Color(0xFF2C3E50)),
                                ),
                              ),
                            ),
                          ),),
                    ),
                  ),
                  SizedBox(height: height*0.04),
                  Container(

                    width: width,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0x6c2B3E4F),width: 0.3),
                      borderRadius: BorderRadius.circular(height*0.015),


                    ),
                    child: Column(
                      children: [
                        Container(
                          height: height*0.10,
                          width: width,
                          decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(height*0.015),topRight: Radius.circular(height*0.015)),
                          ),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal:height*0.025),
                            child: Row(

                              children: [
                                Image.asset("lib/assets/icons/dots.png",scale:height*0.005,),
                                SizedBox(width: height*0.015,),
                                Container(
                                  child: Row(
                                    children: [  CircleAvatar(
                                      backgroundImage: AssetImage('lib/assets/icons/personicon.png'),
                                    ),
                                      SizedBox(width: height*0.015,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          VariableText(text: "   Walid Eisa",
                                            fontFamily: 'sfpr',
                                            fontsize: height*0.015,
                                            fontcolor: Color(0xff2B3E4F),),
                                          VariableText(text: "23 Jan 2021",
                                            fontFamily: 'sfrr',
                                            fontsize: height*0.013,
                                            fontcolor: Color(0x6c3C3C43),),

                                        ],
                                      ),],
                                  ),
                                ),
                                SizedBox(width: height*0.10,),
                                Container(
                                  height: height*0.04,
                                  width: width*0.16,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(height*0.01),
                                      border: Border.all(color: themeColor1)
                                  ),
                                  child:   Center(
                                    child: VariableText(text: "Follow",
                                        fontFamily: 'sfrr',
                                        fontsize: height*0.013,
                                        fontcolor: themeColor1),
                                  ),
                                )





                              ],
                            ),
                          ),



                        ),
                        Container(
                          height: height*0.25,
                          width: width,
                          color: Color(0x28F47920),
                          child: Image.asset("lib/assets/icons/glaasesdog.png",scale:height*0.005,),


                        ),
                        Container(
                          height: height*0.08,
                          width: width,

                          child:  Padding(
                            padding:  EdgeInsets.all(height*0.02),
                            child: VariableText(text: "Bonjour Les Yummy Potes ! Je Vous Souhaite Un Bon Dimanche 😘😘",
                              fontFamily: 'sftsb',
                              fontsize: height*0.015,
                              fontcolor: Color(0xff2B3E4F),),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal:height*0.02),
                          child: Container(
                            width: width,
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
                                      SizedBox(width: height*0.015,),
                                      VariableText(text: "64 Like ",
                                        fontFamily: 'sftr',
                                        fontsize: height*0.015,
                                        fontcolor: Color(0xff2B3E4F),),
                                      SizedBox(width: height*0.04,),
                                      Image.asset("lib/assets/icons/comment.png",scale: 2.5,),
                                      SizedBox(width: height*0.015,),
                                      VariableText(text: "32 Comments",
                                        fontFamily: 'sftr',
                                        fontsize: height*0.015,
                                        fontcolor: Color(0xff2B3E4F),),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  color: Color(0xffE8E8E8),),
                                SizedBox(height: height*0.015,),
                              ],
                            ),
                          ),
                        ),

                        Container(
                          height: height*0.10,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(height*0.015),bottomRight: Radius.circular(height*0.015)),

                          ),
                          child:
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: height*0.01,),

                              CircleAvatar(
                                backgroundImage:
                                AssetImage("lib/assets/icons/personicon.png"),
                                backgroundColor: Colors.red,),
                              SizedBox(width: height*0.01,),

                              Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                                    height: height*0.06,
                                    width: width*0.72,
                                    decoration:  BoxDecoration(
                                      color: Color(0xffF0F5FC),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(height*0.02) //                 <--- border radius here
                                      ),
                                    ),
                                    child:
                                    Padding(
                                      padding:  EdgeInsets.all(height*0.002),
                                      child: TextField(
                                        style:  TextStyle(color: Color(0xff2B3E4F),
                                            fontSize: height*0.015,fontFamily: 'sftr'),

                                        decoration: InputDecoration(
                                            hintText: "Write A Comment",
                                            hintStyle: TextStyle(color: Color(0xfc3C3C43),
                                                fontSize: height*0.015,fontFamily: 'sftr'),

                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(top: height*0.016,left: height*0.298),
                                    child: Image.asset("lib/assets/icons/cameraicon.png",scale: height*0.005,),
                                  )

                                ],
                              ),
                            ],
                          ),

                        )
                      ],

                    ),
                  ),
                  SizedBox(height: height*0.02),



                ],
              ),
            ),
          ),
        );
    }


  }
  Widget renderAppbar(){
    return
      AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        titleSpacing: 16,
        automaticallyImplyLeading: false,
        title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFF8F7F7),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Image.asset('lib/assets/images/user_profile.png', scale: 3.1,),
                ),
                SizedBox(width: 10),

                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      VariableText(text: 'Welcome Back', fontcolor: Color(0xFF3C3C43), fontsize: 11, fontFamily: 'sftsb'),
                      VariableText(text: 'Laurel Watkins', fontcolor: Color(0xFF2C3E50), fontsize: 17, fontFamily: 'sftsb'),
                    ]
                )
              ],
            ),
            /*Row(
            children: [
              GestureDetector(
                onTap: (){},
                child: Container(
                  child: ImageIcon(
                    AssetImage('lib/assets/icons/notification2x.png'),
                    color: Colors.black,
                    size: 26,
                  ),
                ),
              ),
              SizedBox(width: 12),
              GestureDetector(
                onTap: (){
                  print("asd");
                },
                child: Container(
                  child: ImageIcon(
                    AssetImage('lib/assets/icons/chat2x.png'),
                    color: Colors.black,
                    size: 26,
                  ),
                ),
              )
            ],
          )*/
          ],
        ),
        actions: [
          InkWell(
            onTap: (){},
            child: SizedBox(
              width: 26,
              child: Image.asset("lib/assets/icons/notification2x.png", color: appBarIconColor),
            ),
          ),
          SizedBox(width: 12),
          InkWell(
            onTap: () {},
            child: SizedBox(
              width: 26,
              child: Image.asset("lib/assets/icons/chat2x.png", color: appBarIconColor),
            ),
          ),
          SizedBox(width: 16,),
        ],
      );
  }

}
