import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
import 'dart:math' as math;

import 'package:petzola/screens/offers/get_offer_payment_after_discount_screen.dart';
import 'package:petzola/screens/payment_method/add_credit_card.dart';
class PaymentCreditCardScreen extends StatefulWidget {

  @override
  _PaymentCreditCardScreenState createState() => _PaymentCreditCardScreenState();
}

class _PaymentCreditCardScreenState extends State<PaymentCreditCardScreen> {
  List<String> creditCard = ["lib/assets/images/card1.png" ,"lib/assets/images/card2.png","lib/assets/images/card1.png","lib/assets/images/card2.png" ];

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
          backgroundColor: themeColor2,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomAppBarHome(size: height,title: "Payment Credit Card",),
          ),
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: height*0.025),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: height*0.03,),
                  VariableText(text: getTranslated(context, "Credit Card"),
                    fontsize: height*0.028,
                    fontcolor: Color(0xff2B3E4F),

                    fontFamily: 'sfdr',),
                  SizedBox(height:height*0.03,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     // Expanded(child: const MySeparator(color: Colors.black26)),
                      Stack(
                        children: [
                          Container(
                            height: height * 0.06,
                            width: width * 0.25,
                            decoration: BoxDecoration(
                                color: Color(0xFFF8F9FA),
                                borderRadius: BorderRadius.circular(10)),
                            child: DashedRect(color: Color(0xffE8E8E8), strokeWidth: 1.5, gap: 8.0,),

                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: height * 0.035,
                              width: width * 0.22,
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>AddCreditCardScreen()));
                                },
                                child: Center(
                                  child: VariableText(
                                      text: getTranslated(context, 'Add New'),
                                      fontsize: 15,
                                      fontcolor: Color(0x703C3C43),
                                      fontFamily: 'sftr')),
                              ),

                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                  SizedBox(height:height*0.03,),
                  Container(
                    height:height*0.53,
                    child: ListView.builder(
                        itemCount:creditCard.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          return  Row(
                            children: [
                              InkWell(
                              onTap: (){
                                Navigator.of(context).pop();
                                },
                                child: Container(
                                  child:Image.asset(creditCard[index]),
                                ),
                              ),
                              SizedBox(width: 15,)
                            ],
                          );
                        }),
                  ),






                  SizedBox(height:height*0.05,),


                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          buttonHeight:height*0.06,
                          buttonBorderRadius:8,
                          buttonFontSize:height*0.025,
                          buttonColor:themeColor1,
                          buttonTextColor:themeColor2,
                          buttonText: "Payment now   426eg",
                          buttonFontFamily:'sfdm',
                          buttonOnTap:(){
                            showDialog(height,width);
                          },),
                      ),
                    ],
                  ),
                  SizedBox(height:height*0.02,),







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
    child: CustomAppBarHome(size: height,title: "Payment Credit Card",),
    ),
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: height*0.025),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(height: height*0.03,),
                VariableText(text: getTranslated(context, "Credit Card"),
                  fontsize: height*0.028,
                  fontcolor: Color(0xff2B3E4F),

                  fontFamily: 'sfdr',),
                SizedBox(height:height*0.03,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: height * 0.06,
                          width: width * 0.25,
                          decoration: BoxDecoration(
                              color: Color(0xFFF8F9FA),
                              borderRadius: BorderRadius.circular(10)),
                          child: DashedRect(color: Color(0xffE8E8E8), strokeWidth: 1.5, gap: 8.0,),

                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: height * 0.035,
                            width: width * 0.22,

                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>AddCreditCardScreen()));
                              },
                              child: Center(
                                  child: VariableText(
                                      text: getTranslated(context, 'Add New'),
                                      fontsize: 15,
                                      fontcolor: Color(0x703C3C43),
                                      fontFamily: 'sftr')),
                            ),

                          ),
                        ),

                      ],
                    ),
                  ],
                ),
                SizedBox(height:height*0.03,),
                Container(
                  height:height*0.53,
                  child: ListView.builder(
                      itemCount:creditCard.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return  Row(
                          children: [
                            InkWell(
                              onTap:(){
                                Navigator.of(context).pop();
                                },
                              child: Container(
                                child:Image.asset(creditCard[index]),
                              ),
                            ),
                            SizedBox(width: 15,)
                          ],
                        );
                      }),
                ),
              Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        buttonHeight:height*0.06,
                        buttonBorderRadius:8,
                        buttonFontSize:height*0.025,
                        buttonColor:themeColor1,
                        buttonTextColor:themeColor2,
                        buttonText: "Payment now   426eg",
                        buttonFontFamily:'sfdm',
                        buttonOnTap:(){
                          showDialog(height,width);
                        },),
                    ),
                  ],
                ),
                SizedBox(height:height*0.02,),
              ],
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
}

class DashedRect extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  final double gap;

  DashedRect(
      {this.color = Colors.black, this.strokeWidth = 1.0, this.gap = 5.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(strokeWidth / 2),
        child: CustomPaint(
          painter:
          DashRectPainter(color: color, strokeWidth: strokeWidth, gap: gap),
        ),
      ),
    );
  }
}

class DashRectPainter extends CustomPainter {
  double strokeWidth;
  Color color;
  double gap;

  DashRectPainter(
      {this.strokeWidth = 5.0, this.color = Colors.red, this.gap = 5.0});

  @override
  void paint(Canvas canvas, Size size) {
    Paint dashedPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double x = size.width;
    double y = size.height;

    Path _topPath = getDashedPath(
      a: math.Point(0, 0),
      b: math.Point(x, 0),
      gap: gap,
    );

    Path _rightPath = getDashedPath(
      a: math.Point(x, 0),
      b: math.Point(x, y),
      gap: gap,
    );

    Path _bottomPath = getDashedPath(
      a: math.Point(0, y),
      b: math.Point(x, y),
      gap: gap,
    );

    Path _leftPath = getDashedPath(
      a: math.Point(0, 0),
      b: math.Point(0.001, y),
      gap: gap,
    );

    canvas.drawPath(_topPath, dashedPaint);
    canvas.drawPath(_rightPath, dashedPaint);
    canvas.drawPath(_bottomPath, dashedPaint);
    canvas.drawPath(_leftPath, dashedPaint);
  }

  Path getDashedPath({
    @required math.Point<double> a,
    @required math.Point<double> b,
    @required gap,
  }) {
    Size size = Size(b.x - a.x, b.y - a.y);
    Path path = Path();
    path.moveTo(a.x, a.y);
    bool shouldDraw = true;
    math.Point currentPoint = math.Point(a.x, a.y);

    num radians = math.atan(size.height / size.width);

    num dx = math.cos(radians) * gap < 0
        ? math.cos(radians) * gap * -1
        : math.cos(radians) * gap;

    num dy = math.sin(radians) * gap < 0
        ? math.sin(radians) * gap * -1
        : math.sin(radians) * gap;

    while (currentPoint.x <= b.x && currentPoint.y <= b.y) {
      shouldDraw
          ? path.lineTo(currentPoint.x, currentPoint.y)
          : path.moveTo(currentPoint.x, currentPoint.y);
      shouldDraw = !shouldDraw;
      currentPoint = math.Point(
        currentPoint.x + dx,
        currentPoint.y + dy,
      );
    }
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}