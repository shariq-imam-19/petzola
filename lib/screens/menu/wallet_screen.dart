import 'package:flutter/material.dart';

import 'package:petzola/common/commons.dart';
import 'package:petzola/common/common_z.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:petzola/common/global_variables.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
import 'package:vector_math/vector_math.dart' as v_math;
class WalletScreen extends StatefulWidget {

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return WalletScreen();
  }
  Widget WalletScreen() {

    switch (MediaQuery
        .of(context)
        .orientation) {
      case Orientation.landscape:
        double width=MediaQuery.of(context).size.height;
        double height=MediaQuery.of(context).size.width;
         return Scaffold(
           resizeToAvoidBottomInset: false,
           appBar: PreferredSize(
             preferredSize: Size.fromHeight(kToolbarHeight),
             child: CustomMenuAppBar(size: height,title: "Wallet",),
           ),
           backgroundColor: themeColor2,
           body: Padding(
             padding:  EdgeInsets.symmetric(horizontal:height*0.025),
             child: SingleChildScrollView(

               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [

                   SizedBox(height: height*0.03,),
                   Container(
                     height: height*0.25,
                     width: height*0.95,
                     child:
                         currLang =='ar' ?
                     Row(
                       children: [
                         Expanded(
                           child: CustomCurveContainer(text1:"766.00" ,text2:"Eg" ,text3:"Balance" ,
                               iconpath:   'lib/assets/icons/wallet.png',
                               height: height,
                               width: height ,
                               showEg: true,
                               sidecircle1:true,
                               orientation: true,
                               sidecircle2:false),
                         ),
                         SizedBox(width: height*0.02,),

                         Expanded(
                           child: CustomCurveContainer(text1:"32157" ,text2:"" ,text3:"Point" ,
                               iconpath:   'lib/assets/icons/coin.png',
                               height: height,
                               width: height ,
                               orientation: true,
                               showEg: true,
                               sidecircle1:false,
                               sidecircle2:true),
                         ),

                       ],
                     ) :
                         Row(
                           children: [
                             CustomCurveContainer(text1:"766.00" ,text2:"Eg" ,text3:"Balance" ,
                                 iconpath:   'lib/assets/icons/wallet.png',
                                 height: height,
                                 width: height ,
                                 showEg: true,
                                 sidecircle1:false,
                                 orientation: true,
                                 sidecircle2:true),
                             SizedBox(width: height*0.05,),

                             CustomCurveContainer(text1:"32157" ,text2:"" ,text3:"Point" ,
                                 iconpath:   'lib/assets/icons/coin.png',
                                 height: height,
                                 width: height ,
                                 orientation: true,
                                 showEg: true,
                                 sidecircle1:true,
                                 sidecircle2:false),

                           ],
                         ),
                   ),
                   SizedBox(height: height*0.03,),

                   CustomButton(
                       buttonHeight: height*0.07,
                       buttonWidth:height*0.95,
                       buttonBorderRadius:8,
                       buttonFontSize:height*0.025,
                       buttonColor:themeColor1,
                       buttonTextColor:themeColor2,
                       buttonText: getTranslated(context, "Redeeming Points"),
                       buttonFontFamily:'sfdm',
                       buttonOnTap:(){
                         Navigator.pop(context);
                       }
                   ),
                   SizedBox(height: height*0.03,),
                   VariableText(text: getTranslated(context, "Transaction"),
                     fontsize: height*0.022,
                     fontcolor: Color(0xff2B3E4F),

                     fontFamily: 'sfdr',),
                   SizedBox(height: height*0.02,),
                   Center(
                     child: Container(
                         height: height*0.30,
                         width: width*0.70,

                         child: Column(
                           children: [
                             SizedBox(height: height*0.1,),
                             Image.asset('lib/assets/icons/walletoutline.png',scale: 5.5,),
                             SizedBox(height: height*0.025,),
                             Center(
                               child: VariableText(text: getTranslated(context, "You Don’t Have Any Transactions Yet") ,
                                 fontsize: height*0.016,
                                 fontcolor: Color(0xfc3C3C43),
                                 fontFamily: 'sftr',),
                             ),
                           ],
                         )


                     ),
                   ),







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
            child: CustomMenuAppBar(size: height,title: "Wallet",),
          ),
          backgroundColor: themeColor2,
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal:height*0.025),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: height*0.03,),
                Container(
                  height: height*0.25,
                  width: width,
                  child:
                  currLang == 'ar' ?
                  Row(
                    children: [
                      Expanded(
                        child: CustomCurveContainer(text1:"766.00" ,text2:"Eg" ,text3:"Balance" ,
                        iconpath:   'lib/assets/icons/wallet.png',
                        height: height,
                        width: width ,
                        showEg: true,
                            orientation: false,
                            sidecircle1:true,
                            sidecircle2:false),
                      ),
                      SizedBox(width: height*0.02,),
                      Expanded(
                        child: CustomCurveContainer(text1:"32157" ,text2:"" ,text3:"Point" ,
                          iconpath:   'lib/assets/icons/coin.png',
                          height: height,
                          width: width ,
                          showEg: false,
                            orientation: false,
                            sidecircle1:false,
                            sidecircle2:true),
                      ),

                    ],
                  ) :
                  Row(
                    children: [
                      Expanded(
                        child: CustomCurveContainer(text1:"766.00" ,text2:"Eg" ,text3:"Balance" ,
                            iconpath:   'lib/assets/icons/wallet.png',
                            height: height,
                            width: width ,
                            showEg: true,
                            orientation: false,
                            sidecircle1:false,
                            sidecircle2:true),
                      ),
                      SizedBox(width: height*0.02,),
                      Expanded(
                        child: CustomCurveContainer(text1:"32157" ,text2:"" ,text3:"Point" ,
                            iconpath:   'lib/assets/icons/coin.png',
                            height: height,
                            width: width ,
                            showEg: false,
                            orientation: false,
                            sidecircle1:true,
                            sidecircle2:false),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: height*0.03,),


                CustomButton(
                    buttonHeight: height*0.07,
                    buttonWidth:width*0.90,
                    buttonBorderRadius:8,
                    buttonFontSize:height*0.022,
                    buttonColor:themeColor1,
                    buttonTextColor:themeColor2,
                    buttonText: getTranslated(context, "Redeeming Points"),
                    buttonFontFamily:'sfdm',
                    buttonOnTap:(){
                      Navigator.pop(context);
                    }
                ),
                SizedBox(height: height*0.03,),
                VariableText(text: getTranslated(context, "Transaction"),
                  fontsize: height*0.022,
                  fontcolor: Color(0xff2B3E4F),

                  fontFamily: 'sfdr',),
                SizedBox(height: height*0.02,),
                Center(
                  child: Container(
                      height: height*0.30,
                      width: width*0.70,

                      child: Column(
                        children: [
                          SizedBox(height: height*0.1,),
                          Image.asset('lib/assets/icons/walletoutline.png',scale: 5.5,),
                          SizedBox(height: height*0.025,),
                          Center(
                            child: VariableText(text: getTranslated(context, "You Don’t Have Any Transactions Yet"),
                              fontsize: height*0.016,
                              fontcolor: Color(0xfc3C3C43),

                              fontFamily: 'sftr',),
                          ),
                        ],
                      )


                  ),
                ),







              ],
            ),
          ),
        );

    }
  }
}
class CustomCurveContainer extends StatelessWidget {
  final bool showEg,sidecircle1,sidecircle2,orientation;
  final double height,width;
  final String text1,text2,text3,iconpath;
  CustomCurveContainer({
    this.orientation=false,
    this.height,
    this.width,
    this.showEg,
    this.text1,
    this.text2,
    this.text3,
    this.iconpath,
    this.sidecircle1,
    this.sidecircle2

});


  @override
  Widget build(BuildContext context) {
    return  ClipPath(
      clipper: DolDurmaClipper( holeRadius: height * 0.055,bottom: height*0.070,sidecircle1: sidecircle1,sidecircle2: sidecircle2),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            color: Color(0xffF0F5FC),

          ),
           //width: orientation?width*0.45:width*0.41,
          height:  height*0.20,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(   crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VariableText(text: text1, fontsize: height*0.028,fontFamily: 'sfdsb', fontcolor: Color(0xFF2B3E4F),),
                  SizedBox(width: height*0.005,),
                  showEg?Column(
                    children: [
                      SizedBox(height: height*0.02,),
                      VariableText(text: text2, fontsize: height*0.017,fontFamily: 'sftr', fontcolor: Color(0x9c3C3C43),),

                    ],
                  ):Container()

                ],
              ),
              SizedBox(height: height*0.03,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(iconpath,scale: 3.5,),

                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10),
                      child: VariableText(text: getTranslated(context, text3.toString()), fontsize: height*0.020,fontFamily: 'sftr', fontcolor: Color(0xFF2B3E4F),),
                    ),



                  ],
                ),
              ),



            ],
          )
      ),
    );
  }
}

class DolDurmaClipper extends CustomClipper<Path> {
  final double holeRadius;
  final double bottom;
  final bool sidecircle1;
  final bool sidecircle2;

  DolDurmaClipper({ this.holeRadius,  this.bottom,this.sidecircle1,this.sidecircle2});

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0.0, size.height - bottom - holeRadius)
      ..arcToPoint(
        Offset(0, size.height - bottom),
        clockwise: sidecircle1,
        radius: Radius.circular(1),
      )
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height - bottom)
      ..arcToPoint(
        Offset(size.width, size.height - bottom - holeRadius),
        clockwise: sidecircle2,
        radius: Radius.circular(1),
      );

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(DolDurmaClipper oldClipper) => true;
}
