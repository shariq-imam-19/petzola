import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
import 'dart:math' as math;

import 'package:petzola/screens/payment_method/add_credit_card.dart';
import 'package:petzola/screens/services/payment_credit_card_screen.dart';
import 'package:petzola/screens/services/pet_service_payment_screen.dart';
class PetServicePaymentAfterDiscountScreen extends StatefulWidget {

  @override
  _PetServicePaymentAfterDiscountScreenState createState() => _PetServicePaymentAfterDiscountScreenState();
}

class _PetServicePaymentAfterDiscountScreenState extends State<PetServicePaymentAfterDiscountScreen> {
  bool isSwitched=true;
  @override
  Widget build(BuildContext context) {
    return GetOfferPaymentScreen();
  }
  Widget GetOfferPaymentScreen() {
    double height=MediaQuery.of(context).size.width;
    double width=MediaQuery.of(context).size.height;
    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomAppBarHome(size: height,title: "Booking Information",),
          ),
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: height*0.025),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Stack(
                    children: [
                      Container(
                        height: height*0.30,
                        width: height,
                        // color: themeColor1,
                        child:
                        Column(
                          children: [
                            ClipPath(
                                clipper: DolDurmaClipper(holeRadius: 40.0, bottom: 0),

                                child:Container(
                                  height:height*0.13,
                                  width: height*0.95,
                                  decoration: BoxDecoration(
                                      color: Color(0xffF8F9FA),
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child:
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Spacer(),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          VariableText(text: getTranslated(context, "Receipt"),
                                            fontsize: 20,
                                            fontcolor: Color(0xff2B3E4F),
                                            fontFamily: 'sfdr',),
                                        ],
                                      ),
                                      Spacer(),
                                      //SizedBox(height: height*0.09),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 32),
                                        child: const MySeparator(color: Colors.black26),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                            SizedBox(height: 10,),
                            Stack(
                              children: [
                                Transform.rotate(
                                  angle: -math.pi /-70,
                                  child: Transform.rotate(
                                    angle: -math.pi /1,
                                    child: ClipPath(
                                        clipper: DolDurmaClipper(holeRadius: 40.0, bottom: 0),

                                        child:Container(
                                          height:height*0.13,
                                          width: height*0.95,
                                          decoration: BoxDecoration(
                                              color: Color(0xffF8F9FA),
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Padding(
                                            padding:  EdgeInsets.only(left: 25,right: 25,bottom: 3),
                                            child: Column(
                                              children: [Spacer(),
                                                Row(
                                                  children: [
                                                    Transform.rotate(
                                                      angle: -math.pi /1,
                                                      child:
                                                      Column(
                                                        children: [
                                                          Row(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [


                                                              VariableText(text: '194.5', fontsize: height*0.030,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                                                              SizedBox(width: height*0.0050,),
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  SizedBox(height: height*0.02,),
                                                                  VariableText(text: 'Eg', fontsize: height*0.013,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                                                ],
                                                              ),],
                                                          ),
                                                        ],
                                                      ),
                                                    ),   Spacer(),
                                                    Transform.rotate(
                                                      angle: -math.pi /1,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [



                                                              Stack(
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: VariableText(text: '389', fontsize: height*0.030,fontFamily: 'sfdb', fontcolor: Color(0x602B3E4F),
                                                                    ),
                                                                  ),
                                                                  Transform.rotate(
                                                                    angle: -math.pi /3,
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.only(left: 30.0,top: 20),
                                                                      child: Container(height: 40,
                                                                        width:1,color: Color(0xff2B3E4F),),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),


                                                              SizedBox(width: height*0.0050,),
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  SizedBox(height: height*0.02,),
                                                                  VariableText(text: 'Eg', fontsize: height*0.013,fontFamily: 'sftr', fontcolor: hinttextColor,),

                                                                ],
                                                              ),],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Transform.rotate(
                                                      angle: -math.pi /1,
                                                      child: VariableText(text: "Total",
                                                        fontsize: 15,
                                                        fontcolor: Color(0xff2B3E4F),
                                                        fontFamily: 'sftsb',),
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                const MySeparator(color: Colors.black26),
                                              ],
                                            ),
                                          ),
                                        )
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding:  EdgeInsets.only(top: height*0.09),
                                  child: Align(alignment: Alignment.topCenter,
                                    child: InkWell(
                                      onTap:(){
                                     //   PaymentDetails( height, height);
                                      },
                                      child: Container(
                                        height: height*0.06,
                                        width:height*0.12,
                                        decoration: BoxDecoration(
                                            color: Color(0xff2C3E50),
                                            borderRadius: BorderRadius.circular(30)
                                        ),
                                        child: Center(
                                          child: VariableText(text: "Details",
                                            fontsize: 11,
                                            fontcolor: themeColor2,
                                            fontFamily: 'sftsb',),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: height*0.11),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset('lib/assets/icons/p1.png',scale: 3.5,color: Color(0XFF2C3E50),),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: height*0.11),
                        child: Row(
                          children: [
                            Spacer(),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Image.asset('lib/assets/icons/p2.png',scale: 4.5,color: Color(0XFF2C3E50),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.01,),
                  ListTile(
                    dense:true,
                    contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                    leading:
                    VariableText(text: getTranslated(context, "PROMO CODE?"),
                      fontsize: 20,
                      fontcolor: Color(0xff2B3E4F),
                      fontFamily: 'sfdr',),
                    trailing:Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      },
                      activeTrackColor: Color(0xff34C759),
                      activeColor:  themeColor2,
                    ),
                  ),
                  SizedBox(height: height*0.01,),
                  isSwitched == true ?
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Expanded(
                          child: Container(
                            height: height * 0.08,
                            decoration: BoxDecoration(
                                color: Color(0xffF5F8FA),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10), topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)
                                )
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: height*0.025),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: RectangluartextFeild(
                                      hinttext: 'Petzola70',
                                      heights: height * 0.14,
                                      fontsize: height * 0.025,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Container(
                                    height: height * 0.04,
                                    width: width * 0.24,
                                    decoration: BoxDecoration(
                                        color: themeColor1,
                                        borderRadius:
                                        BorderRadius
                                            .circular(10)),
                                    child: Center(
                                      child: VariableText(
                                        text: getTranslated(context, 'Apply'),
                                        fontsize: 13,
                                        fontFamily: 'sftr',
                                        fontcolor: Colors.white,
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ): Container(),

                  SizedBox(height: height*0.03,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: height * 0.08,
                            decoration: BoxDecoration(
                                color: Color(0xffF5F8FA),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10), topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)
                                )
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: height*0.025),
                              child: Row(
                                children: [
                                  Image.asset('lib/assets/icons/visa.png',scale: 4,color: Color(0xFF2C3E50),),
                                  Spacer(),
                                  VariableText(
                                    text: "****",
                                    fontsize: 13,
                                    fontFamily: 'sftr',
                                    fontcolor: Color(0xFF2C3E50),
                                  ),
                                  SizedBox(width: height*0.02,),
                                  VariableText(
                                    text: "****",
                                    fontsize: 13,
                                    fontFamily: 'sftr',
                                    fontcolor: Color(0xFF2C3E50),
                                  ),
                                  SizedBox(width: height*0.02,),
                                  VariableText(
                                    text: "****",
                                    fontsize: 13,
                                    fontFamily: 'sftr',
                                    fontcolor: Color(0xFF2C3E50),
                                  ),
                                  SizedBox(width: height*0.02,),
                                  VariableText(
                                    text: "4981",
                                    fontsize: 13,
                                    fontFamily: 'sftr',
                                    fontcolor: Color(0xFF2C3E50),
                                  ),



                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: height*0.03,),
                  VariableText(text: getTranslated(context, "Payment Method"),
                    fontsize: 20,
                    fontcolor: Color(0xff2B3E4F),
                    fontFamily: 'sfdr',),
                  SizedBox(height: height*0.01,),
                  Container(
                    height: height*0.23,
                    width: height,
                    // color: themeColor3,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (_)=>PaymentCreditCardScreen()));
                                       // Navigator.push(context, MaterialPageRoute(builder: (_)=>AddCreditCardScreen()));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xffF5F8FA),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child:  Row(   crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset('lib/assets/icons/creditcardicon.png',scale: 3.5,),
                                            SizedBox(width: height*0.02,),
                                            VariableText(text: getTranslated(context, "Credit Card"), fontsize: 13,fontFamily: 'sftr', fontcolor: Color(0xFF2B3E4F),),



                                          ],
                                        ),

                                      ),
                                    )),
                                SizedBox(height: 8,),
                                Expanded(
                                    flex: 1,
                                    child:  Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xffF5F8FA),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child:
                                      Row(   crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('lib/assets/icons/cashicon.png',scale: 3.5,),
                                          SizedBox(width: height*0.02,),
                                          VariableText(text: getTranslated(context, "CASH"), fontsize: 13,fontFamily: 'sftr', fontcolor: Color(0xFF2B3E4F),),



                                        ],
                                      ),

                                    ))
                              ],
                            )),
                        SizedBox(width: 8,),
                        Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffF5F8FA),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child:  Column(   crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  VariableText(text: getTranslated(context, "Balance"), fontsize: 13,fontFamily: 'sftr', fontcolor: Color(0xFF2B3E4F),),

                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [


                                      VariableText(text: '2451', fontsize: height*0.030,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                                      SizedBox(width: height*0.0050,),
                                      Column(
                                        children: [
                                          SizedBox(height: height*0.02,),
                                          VariableText(text: 'Eg', fontsize: height*0.013,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                        ],
                                      ),],
                                  ),
                                  SizedBox(height: height*0.03,),
                                  Image.asset('lib/assets/icons/wallet.png',scale: 3.5,),
                                  SizedBox(height: height*0.01,),
                                  VariableText(text: getTranslated(context, "Wallet"), fontsize: 13,fontFamily: 'sftr', fontcolor: Color(0xFF2B3E4F),),




                                ],
                              ),
                            )),

                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(height: height * 0.15,
              color: themeColor2,
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical:12,horizontal: 16),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    VariableText(text: "I got a 50% discount",
                      fontsize: 16,
                      fontcolor: textColor,
                      fontFamily: 'sftr',),

                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                              buttonHeight: height*0.07,

                              buttonBorderRadius:8,
                              buttonFontSize:height*0.025,
                              buttonColor:themeColor1,
                              buttonTextColor:themeColor2,
                              buttonText: "Submit",
                              buttonFontFamily:'sfdm',
                              buttonOnTap:(){
                                showDialog(height,width);
                                //Navigator.push(context, MaterialPageRoute(builder: (_)=>PetSerivcerPaymentScreen()));
                              }
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
            child: CustomAppBarHome(size: height,title: "Booking Information",),
          ),
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: height*0.025),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Stack(
                    children: [
                      Container(
                        height: height*0.30,
                        width: width,
                        // color: themeColor1,
                        child:
                        Column(
                          children: [
                            ClipPath(
                                clipper: DolDurmaClipper(holeRadius: 40.0, bottom: 0),

                                child:Container(
                                  height:height*0.13,
                                  width: width*0.95,
                                  decoration: BoxDecoration(
                                      color: Color(0xffF8F9FA),
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child:
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Spacer(),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          VariableText(text: getTranslated(context, "Receipt"),
                                            fontsize: 20,
                                            fontcolor: Color(0xff2B3E4F),
                                            fontFamily: 'sfdr',),
                                        ],
                                      ),
                                      Spacer(),
                                      //SizedBox(height: height*0.09),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 32),
                                        child: const MySeparator(color: Colors.black26),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                            SizedBox(height: 10,),
                            Stack(
                              children: [
                                Transform.rotate(
                                  angle: -math.pi /-70,
                                  child: Transform.rotate(
                                    angle: -math.pi /1,
                                    child: ClipPath(
                                        clipper: DolDurmaClipper(holeRadius: 40.0, bottom: 0),

                                        child:Container(
                                          height:height*0.13,
                                          width: width*0.95,
                                          decoration: BoxDecoration(
                                              color: Color(0xffF8F9FA),
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Padding(
                                            padding:  EdgeInsets.only(left: 25,right: 25,bottom: 3),
                                            child: Column(
                                              children: [Spacer(),
                                                Row(
                                                  children: [
                                                    Transform.rotate(
                                                      angle: -math.pi /1,
                                                      child:
                                                      Column(
                                                        children: [
                                                          Row(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [


                                                              VariableText(text: '194.5', fontsize: height*0.030,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                                                              SizedBox(width: height*0.0050,),
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  SizedBox(height: height*0.02,),
                                                                  VariableText(text: 'Eg', fontsize: height*0.013,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                                                ],
                                                              ),],
                                                          ),
                                                        ],
                                                      ),
                                                    ),   Spacer(),
                                                    Transform.rotate(
                                                      angle: -math.pi /1,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [



                                                              Stack(
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: VariableText(text: '389', fontsize: height*0.030,fontFamily: 'sfdb', fontcolor: Color(0x602B3E4F),
                                                                    ),
                                                                  ),
                                                                  Transform.rotate(
                                                                    angle: -math.pi /3,
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.only(left: 30.0,top: 20),
                                                                      child: Container(height: 40,
                                                                        width:1,color: Color(0xff2B3E4F),),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),


                                                              //SizedBox(width: height*0.0050,),
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  //SizedBox(height: height*0.01,),
                                                                  VariableText(text: 'Eg', fontsize: height*0.013,fontFamily: 'sftr', fontcolor: hinttextColor,),

                                                                ],
                                                              ),],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    Spacer(),
                                                    Spacer(),
                                                    Transform.rotate(
                                                      angle: -math.pi /1,
                                                      child: VariableText(text: "Total",
                                                        fontsize: 15,
                                                        fontcolor: Color(0xff2B3E4F),
                                                        fontFamily: 'sftsb',),
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                const MySeparator(color: Colors.black26),
                                              ],
                                            ),
                                          ),
                                        )
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding:  EdgeInsets.only(top: height*0.09),
                                  child: Align(alignment: Alignment.topCenter,
                                    child: InkWell(
                                      onTap:(){
                                        //PaymentDetails( height, width);
                                      },
                                      child: Container(
                                        height: height*0.06,
                                        width:height*0.12,
                                        decoration: BoxDecoration(
                                            color: Color(0xff2C3E50),
                                            borderRadius: BorderRadius.circular(30)
                                        ),
                                        child: Center(
                                          child: VariableText(text: "Details",
                                            fontsize: 11,
                                            fontcolor: themeColor2,
                                            fontFamily: 'sftsb',),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: height*0.11),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset('lib/assets/icons/p1.png',scale: 3.5,color: Color(0XFF2C3E50),),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: height*0.11),
                        child: Row(
                          children: [
                            Spacer(),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Image.asset('lib/assets/icons/p2.png',scale: 4.5,color: Color(0XFF2C3E50),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height*0.01,),
                  ListTile(
                    dense:true,
                    contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                    leading:
                    VariableText(text: getTranslated(context, "PROMO CODE?"),
                      fontsize: 20,
                      fontcolor: Color(0xff2B3E4F),
                      fontFamily: 'sfdr',),
                    trailing:Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      },
                      activeTrackColor: Color(0xff34C759),
                      activeColor:  themeColor2,
                    ),
                  ),
                  SizedBox(height: height*0.01,),
                  isSwitched == true ?
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Expanded(
                          child: Container(
                            height: height * 0.08,
                            decoration: BoxDecoration(
                                color: Color(0xffF5F8FA),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10), topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)
                                )
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: height*0.025),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: RectangluartextFeild(
                                      hinttext: 'Petzola70',
                                      heights: height * 0.14,
                                      fontsize: height * 0.025,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Container(
                                    height:
                                    height * 0.04,
                                    width: width * 0.24,
                                    decoration: BoxDecoration(
                                        color: themeColor1,
                                        borderRadius:
                                        BorderRadius
                                            .circular(10)),
                                    child: Center(
                                      child: VariableText(
                                        text: getTranslated(context, 'Apply'),
                                        fontsize: 13,
                                        fontFamily: 'sftr',
                                        fontcolor: Colors.white,
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ): Container(),

                  SizedBox(height: height*0.03,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: height * 0.08,
                            decoration: BoxDecoration(
                                color: Color(0xffF5F8FA),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10), topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)
                                )
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: height*0.025),
                              child: Row(
                                children: [
                                  Image.asset('lib/assets/icons/visa.png',scale: 4,color: Color(0xFF2C3E50),),
                                  Spacer(),
                                  VariableText(
                                    text: "****",
                                    fontsize: 13,
                                    fontFamily: 'sftr',
                                    fontcolor: Color(0xFF2C3E50),
                                  ),
                                  SizedBox(width: height*0.02,),
                                  VariableText(
                                    text: "****",
                                    fontsize: 13,
                                    fontFamily: 'sftr',
                                    fontcolor: Color(0xFF2C3E50),
                                  ),
                                  SizedBox(width: height*0.02,),
                                  VariableText(
                                    text: "****",
                                    fontsize: 13,
                                    fontFamily: 'sftr',
                                    fontcolor: Color(0xFF2C3E50),
                                  ),
                                  SizedBox(width: height*0.02,),
                                  VariableText(
                                    text: "4981",
                                    fontsize: 13,
                                    fontFamily: 'sftr',
                                    fontcolor: Color(0xFF2C3E50),
                                  ),



                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  SizedBox(height: height*0.03,),
                  VariableText(text: getTranslated(context, "Payment Method"),
                    fontsize: 20,
                    fontcolor: Color(0xff2B3E4F),
                    fontFamily: 'sfdr',),
                  SizedBox(height: height*0.01,),
                  Container(
                    height: height*0.23,
                    width: width,
                    // color: themeColor3,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap:(){
                                        Navigator.push(context, MaterialPageRoute(builder: (_)=>PaymentCreditCardScreen()));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xffF5F8FA),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child:  Row(   crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset('lib/assets/icons/creditcardicon.png',scale: 3.5,),
                                            SizedBox(width: height*0.02,),
                                            VariableText(text: getTranslated(context, "Credit Card"), fontsize: 13,fontFamily: 'sftr', fontcolor: Color(0xFF2B3E4F),),



                                          ],
                                        ),

                                      ),
                                    )),
                                SizedBox(height: 8,),
                                Expanded(
                                    flex: 1,
                                    child:  Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xffF5F8FA),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child:
                                      Row(   crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('lib/assets/icons/cashicon.png',scale: 3.5,),
                                          SizedBox(width: height*0.02,),
                                          VariableText(text: getTranslated(context, "CASH"), fontsize: 13,fontFamily: 'sftr', fontcolor: Color(0xFF2B3E4F),),



                                        ],
                                      ),

                                    ))
                              ],
                            )),
                        SizedBox(width: 8,),
                        Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffF5F8FA),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child:  Column(   crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  VariableText(text: getTranslated(context, "Balance"), fontsize: 13,fontFamily: 'sftr', fontcolor: Color(0xFF2B3E4F),),

                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [


                                      VariableText(text: '2451', fontsize: height*0.030,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                                      SizedBox(width: height*0.0050,),
                                      Column(
                                        children: [
                                          SizedBox(height: height*0.02,),
                                          VariableText(text: 'Eg', fontsize: height*0.013,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                        ],
                                      ),],
                                  ),
                                  SizedBox(height: height*0.03,),
                                  Image.asset('lib/assets/icons/wallet.png',scale: 3.5,),
                                  SizedBox(height: height*0.01,),
                                  VariableText(text: getTranslated(context, "Wallet"), fontsize: 13,fontFamily: 'sftr', fontcolor: Color(0xFF2B3E4F),),




                                ],
                              ),
                            )),

                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(height: height * 0.15,
              color: themeColor2,
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical:12,horizontal: 16),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    VariableText(text: "I got a 50% discount",
                      fontsize: 16,
                      fontcolor: textColor,
                      fontFamily: 'sftr',),

                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                              buttonHeight: height*0.07,

                              buttonBorderRadius:8,
                              buttonFontSize:height*0.025,
                              buttonColor:themeColor1,
                              buttonTextColor:themeColor2,
                              buttonText: "Submit",
                              buttonFontFamily:'sfdm',
                              buttonOnTap:(){
                                showDialog(height,width);
                                //Navigator.push(context, MaterialPageRoute(builder: (_)=>PetSerivcerPaymentScreen()));
                              }
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
    }
  }
  void showDialog(double height,double width) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return ShowPaymentDialouge(height: height,width: width,);
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  void PaymentDetails(double height,double width){
    showModalBottomSheet(
        isScrollControlled: true,
        //transitionAnimationController: controller,
        backgroundColor: Colors.transparent,
        context: context, builder: (context) {

      return DraggableScrollableSheet(
          initialChildSize: 0.68, //set this as you want
          maxChildSize:0.68, //set this as you want
          minChildSize:0.68, //set this as you want
          expand: false,
          builder: (context, scrollController) {
            return PaymentDetailsClass(height:height,width:width
              ,onSelect: (temp){
                Navigator.of(context).pop();

              },);
            //whatever you're returning, does not have to be a Container
          }

      );
    });

  }
}
class PaymentDetailsClass extends StatefulWidget {
  final double height,width;

  Function onSelect;
  PaymentDetailsClass({this.height,this.width,this.onSelect});


  @override
  _PaymentDetailsClassState createState() => _PaymentDetailsClassState();
}

class _PaymentDetailsClassState extends State<PaymentDetailsClass> {

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
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: widget.height*0.025),
            child: Column(
              children: [
                SizedBox(height: widget.height*0.03,),
                VariableText(text: "Receipt",
                  fontsize: widget.height*0.028,
                  fontcolor: Color(0xff2B3E4F),
                  fontFamily: 'sfdr',),
                SizedBox(height: widget.height*0.03,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: widget.height*0.025),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VariableText(text: "Name",
                            fontsize: 11,
                            fontcolor:hinttextColor,
                            fontFamily: 'sftr',),
                          VariableText(text: "Ronnie Mccoy",
                            fontsize:13,
                            fontcolor: Color(0xff2B3E4F),
                            fontFamily: 'sftr',),


                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VariableText(text: "Pet Name",
                            fontsize: 11,
                            fontcolor:hinttextColor,
                            fontFamily: 'sftr',),
                          VariableText(text: "Senba",
                            fontsize:13,
                            fontcolor: Color(0xff2B3E4F),
                            fontFamily: 'sftr',),


                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: widget.height*0.04,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    VariableText(text: "Vet Name",
                      fontsize: 11,
                      fontcolor:hinttextColor,
                      fontFamily: 'sftr',),
                    VariableText(text: "Johnny Brewer",
                      fontsize:13,
                      fontcolor: Color(0xff2B3E4F),
                      fontFamily: 'sftr',),


                  ],
                ),
                Row(
                  children: [
                    Image.asset('lib/assets/icons/p1.png',scale: 3.5,color: Color(0XFF2C3E50),),
                    Expanded(child: const MySeparator(color: Colors.black26)),
                    Image.asset('lib/assets/icons/p2.png',scale: 3.5,color: Color(0XFF2C3E50),),
                  ],
                ),
                SizedBox(height: widget.height*0.02,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: widget.height*0.025),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          VariableText(text: "Day-Care",
                            fontsize: 13,
                            fontcolor:textColor,
                            fontFamily: 'sftr',),
                          Spacer(),
                          VariableText(text: '329', fontsize:15,fontFamily: 'sftr', fontcolor: textColor),
                          SizedBox(width: widget.height*0.0050,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: widget.height*0.01,),
                              VariableText(text: 'Eg', fontsize: 11,fontFamily: 'sftr', fontcolor:hinttextColor,),

                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: widget.height*0.02,),
                      Row(
                        children: [
                          VariableText(text: "Fees",
                            fontsize: 13,
                            fontcolor:textColor,
                            fontFamily: 'sftr',),
                          Spacer(),
                          VariableText(text: '60', fontsize:15,fontFamily: 'sftr', fontcolor: textColor),
                          SizedBox(width: widget.height*0.0050,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: widget.height*0.01,),
                              VariableText(text: 'Eg', fontsize: 11,fontFamily: 'sftr', fontcolor:hinttextColor,),

                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: widget.height*0.02,),
                      Row(
                        children: [
                          VariableText(text: "Vat",
                            fontsize: 13,
                            fontcolor:textColor,
                            fontFamily: 'sftr',),
                          Spacer(),
                          VariableText(text: '329', fontsize:15,fontFamily: 'sftr', fontcolor: textColor),
                          SizedBox(width: widget.height*0.0050,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: widget.height*0.01,),
                              VariableText(text: 'Eg', fontsize: 11,fontFamily: 'sftr', fontcolor:hinttextColor,),

                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: widget.height*0.02,),
                      Row(
                        children: [
                          VariableText(text: "Discount /Promotions",
                            fontsize: 13,
                            fontcolor:textColor,
                            fontFamily: 'sftr',),
                          Spacer(),
                          VariableText(text: '329', fontsize:15,fontFamily: 'sftr', fontcolor: textColor),
                          SizedBox(width: widget.height*0.0050,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: widget.height*0.01,),
                              VariableText(text: 'Eg', fontsize: 11,fontFamily: 'sftr', fontcolor:hinttextColor,),

                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: widget.height*0.04,),
                      const MySeparator(color: Colors.black26),

                    ],
                  ),
                ),
                SizedBox(height: widget.height*0.02,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: widget.height*0.025),
                  child: Row(
                    children: [
                      VariableText(text: "Total",
                        fontsize: 15,
                        fontcolor:textColor,
                        fontFamily: 'sftsb',),
                      Spacer(),
                      VariableText(text: '389', fontsize: 22,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                      SizedBox(width: widget.height*0.0050,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: widget.height*0.02,),
                          VariableText(text: 'Eg', fontsize: 11,fontFamily: 'sftr', fontcolor:hinttextColor,),

                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: widget.height*0.01,),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: widget.height*0.06,
                    width: widget.width*0.30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: themeColor2,
                        border: Border.all(color: hinttextColor)
                    ),
                    child: Center(
                      child:    VariableText(text: "Close",
                        fontsize: 18,
                        fontcolor:textColor,
                        fontFamily: 'sfdm',),
                    ),
                  ),
                ),
                SizedBox(height: widget.height*0.05,),

              ],
            ),
          ),
        ),
      );
  }

}


class DolDurmaClipper extends CustomClipper<Path> {
  final double holeRadius;
  final double bottom;

  DolDurmaClipper({ this.holeRadius,  this.bottom});

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0.0, size.height+5 - bottom - holeRadius)
      ..arcToPoint(
        Offset(0, size.height - bottom+30),
        clockwise: true,
        radius: Radius.circular(1),
      )
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height - bottom+30)
      ..arcToPoint(
        Offset(size.width, size.height+5 - bottom - holeRadius),
        clockwise: true,
        radius: Radius.circular(1),
      );

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(DolDurmaClipper oldClipper) => true;
}
class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

  const MySeparator({this.height = 2, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}