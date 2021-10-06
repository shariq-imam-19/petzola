import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/style.dart';
class BookOfferReviewScreen extends StatefulWidget {


  @override
  _BookOfferReviewScreenState createState() => _BookOfferReviewScreenState();
}

class _BookOfferReviewScreenState extends State<BookOfferReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DelayedDisplay(
          slidingCurve: Curves.fastLinearToSlowEaseIn,
          delay: Duration(milliseconds: 200),
          child:ListView.builder(itemCount: 3,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),

            itemBuilder: (BuildContext context, int index){
              return  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          CircleAvatar(backgroundImage: AssetImage('lib/assets/icons/personicon.png'),),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  VariableText(text: "Walid Eisa", fontsize: 13, fontcolor: Color(0xff000000),
                                    fontFamily: 'sftsb',),
                                  SizedBox(height: 4,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('lib/assets/icons/appointment_rating.png', scale: 4.0,),
                                      SizedBox(width: 4,),
                                      Image.asset('lib/assets/icons/appointment_rating.png', scale: 4.0,),
                                      SizedBox(width: 4,),
                                      Image.asset('lib/assets/icons/appointment_rating.png', scale: 4.0,),
                                      SizedBox(width: 4,),
                                      Image.asset('lib/assets/icons/appointment_rating.png', scale: 4.0,),
                                      SizedBox(width: 4,),
                                      Image.asset('lib/assets/icons/appointment_rating.png', scale: 4.0,),
                                      Spacer(),
                                      VariableText(text: "01/05/2021", fontsize: 12, fontcolor: Color(0xff000000),
                                        fontFamily: 'sftr',),
                                    ],
                                  ),



                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  VariableText(text: "Pellentesque Tincidunt Tristique Neque, Eget Venenatis Enim Gravida Quis.", fontsize: 12, fontcolor: hinttextColor,
                    fontFamily: 'sftr',),
                  SizedBox(height: 10,),
                ],
              );
            },)
      ),
    );
  }
}