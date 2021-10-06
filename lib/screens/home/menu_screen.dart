import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/common/commons.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/global_variables.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
import 'package:petzola/screens/menu/contactus_screen.dart';
import 'package:petzola/screens/menu/faq_screen.dart';
import 'package:petzola/screens/menu/favourite_screen.dart';
import 'package:petzola/screens/menu/invitefriend_screen.dart';
import 'package:petzola/screens/menu/language_screen.dart';
import 'package:petzola/screens/menu/notification_screen.dart';
import 'package:petzola/screens/menu/setting_screen.dart';
import 'package:petzola/screens/menu/termandcondition_screen.dart';
import 'package:petzola/screens/menu/wallet_screen.dart';
import 'package:petzola/screens/profile/profile_screen.dart';

class MenuScreen extends StatefulWidget {
  Function onTap;
  MenuScreen({this.onTap});


  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  @override
  Widget build(BuildContext context) {
    return menuScreen();
  }
Widget menuScreen() {
  double height=MediaQuery.of(context).size.height;
  double width=MediaQuery.of(context).size.width;
  switch (MediaQuery
      .of(context)
      .orientation) {
    case Orientation.landscape:
      return Scaffold(
        backgroundColor: themeColor2,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              currLang == 'ar' ?
              Positioned(
                top: height*0.04,
                right: height*0.05,
                child: Container(
                  margin: EdgeInsets.only(right: width*0.75),
                  child:Image.asset("lib/assets/icons/menuimagesheet.png",scale: 4.1,)

                  ,
                ),
              ) :
              Positioned(
                top: height*0.05,
                left: height*0.05,
                child: Container(
                  margin: EdgeInsets.only(left: width*0.75),
                  child:Image.asset("lib/assets/icons/menuimagesheet.png",scale: 5.2,)
                  ,
                ),
              ),
              Column(
                children: [
                  SizedBox(height: width*0.07,),
                  menuListTile(size: width,imagepath: "lib/assets/icons/mypets.png",text: "My Pets",ontap:()=>widget.onTap(),),
                  menuListTile(size: width,imagepath: "lib/assets/icons/menuwalleticon.png",text:"Wallet",ontap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>WalletScreen()));}, ),
                  menuListTile(size: width,imagepath: "lib/assets/icons/menuinvitefriendicon.png",text: "Invite Friend",ontap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>InviteFriendScreen()));}),
                  menuListTile(size: width,imagepath: "lib/assets/icons/menufavouriteicon.png",text: "Favourite",ontap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>FavouriteScreen()));}),
                  menuListTile(size: width,imagepath: "lib/assets/icons/menusettingicon.png",text:"Settings" ,ontap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>ProfileScreen()));}),
                  menuListTile(size: width,imagepath: "lib/assets/icons/menulanguageicon.png",text:"Language" ,ontap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>LanguageScreen()));}),
                  menuListTile(size: width,imagepath: "lib/assets/icons/menunotificationicon.png",text:"Notification" ,ontap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>NotificationScreen()));}),
                  menuListTile(size: width,imagepath: "lib/assets/icons/menucontactusicon.png",text:"Contact Us" ,ontap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>ContactusScreen()));}),
                  menuListTile(size: width,imagepath: "lib/assets/icons/menutermandcondtionicon.png",text:"Terms & Conditions" ,ontap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>TermsConditionsScreen()));}),
                  menuListTile(size: width,imagepath: "lib/assets/icons/menufaqicon.png",text:"FAQ" ,ontap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>FAQScreen()));}),
                  SizedBox(height: 70),
                ],
              ),

            ],
          ),
        ),
      );
    case Orientation.portrait:
      return Scaffold(
        backgroundColor: themeColor2,
        body: Stack(
          children: [
            currLang == 'ar' ?
            Positioned(
              top: height*0.04,
              right: height*0.20,
              child: Container(
                //margin: EdgeInsets.only(left: width*0.45),


                child:Image.asset("lib/assets/icons/menuimagesheet.png",scale: 4.1,)

                ,
              ),
            ) :
            Positioned(
              top: height*0.05,
              left: height*0.05,
              child: Container(
                margin: EdgeInsets.only(left: width*0.45),


                child:Image.asset("lib/assets/icons/menuimagesheet.png",scale: 5.2,)

                ,
              ),
            ),

            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: height*0.07,),
                  menuListTile(size: height,imagepath: "lib/assets/icons/mypets.png",text: "My Pets",ontap:()=>widget.onTap()),
                  menuListTile(size: height,imagepath: "lib/assets/icons/menuwalleticon.png",text:"Wallet",ontap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>WalletScreen()));}, ),
                  menuListTile(size: height,imagepath: "lib/assets/icons/menuinvitefriendicon.png",text: "Invite Friend",ontap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>InviteFriendScreen()));}),
                  menuListTile(size: height,imagepath: "lib/assets/icons/menufavouriteicon.png",text: "Favourite",ontap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>FavouriteScreen()));}),
                  menuListTile(size: height,imagepath: "lib/assets/icons/menusettingicon.png",text:"Settings" ,ontap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>ProfileScreen()));}),
                  menuListTile(size: height,imagepath: "lib/assets/icons/menulanguageicon.png",text:"Language" ,ontap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>LanguageScreen()));}),
                  menuListTile(size: height,imagepath: "lib/assets/icons/menunotificationicon.png",text:"Notification" ,ontap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>NotificationScreen()));}),
                  menuListTile(size: height,imagepath: "lib/assets/icons/menucontactusicon.png",text:"Contact Us" ,ontap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>ContactusScreen()));}),
                  menuListTile(size: height,imagepath: "lib/assets/icons/menutermandcondtionicon.png",text:"Terms & Conditions" ,ontap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>TermsConditionsScreen()));}),
                  menuListTile(size: height,imagepath: "lib/assets/icons/menufaqicon.png",text:"FAQ" ,ontap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>FAQScreen()));}),
                  SizedBox(height: 90),
                ],
              ),
            ),

          ],
        ),
      );
  }
}

}
class menuListTile extends StatelessWidget {
  final double size;
  final String text,imagepath;
  final Function ontap;

  menuListTile({this.size,this.text,this.imagepath,this.ontap});



  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: ontap,
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: size*0.025, vertical: size*0.01),
        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        leading:
        CircleAvatar(
          radius: 12.0,
          backgroundImage:
          AssetImage(imagepath),
          backgroundColor: Colors.transparent,
        ),
        title:  Container(
          child: VariableText(text: getTranslated(context, text.toString()),
            fontsize: size*0.018,
            fontcolor: Color(0xff2B3E4F),
            weight: FontWeight.normal,
            fontFamily: 'sftr',),
        ),

      ),
    );
  }
}

