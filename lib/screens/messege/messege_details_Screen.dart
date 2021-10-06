import 'package:flutter/material.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/localization/language_constants.dart';
import 'package:petzola/models/chatDetailMessgeModel.dart';
import 'package:petzola/models/chatMessageModel.dart';
import 'package:petzola/screens/notification/notification_screen.dart';
class MainMessegeDetailsScreen extends StatefulWidget {


  @override
  _MainMessegeDetailsScreenState createState() => _MainMessegeDetailsScreenState();
}

class _MainMessegeDetailsScreenState extends State<MainMessegeDetailsScreen> {
  final _controller = TextEditingController();

  List<ChatMessage1> messages = [
    ChatMessage1(
        messageContent: "Receptionist Dr. Ready To Answer Your Inquiries", messageType: "receiver"),
    ChatMessage1(messageContent: "Welcome - Are You Okay", messageType: "sender"),
    ChatMessage1(
        messageContent: "Welcome - We Are Fine - Thanks How Can I Help You?",
        messageType: "receiver"),
    ChatMessage1(messageContent: "I Would Like To Book A Home Visit On Saturday At 5 Pm?", messageType: "sender"),
  ChatMessage1(
  messageContent: "Payment with credit card",
  messageType: "receiver"),
    ChatMessage1(messageContent: "😘 😘  😘 😘", messageType: "sender"),
    ChatMessage1(
        messageContent: "Change payment method",
        messageType: "receiver"),


  ];
  @override
  Widget build(BuildContext context) {
    return MainMessegeDetailsScreen();
  }
  Widget MainMessegeDetailsScreen(){
    switch(MediaQuery.of(context).orientation){
      case Orientation.landscape:
        double width=MediaQuery.of(context).size.height;
        double height=MediaQuery.of(context).size.width;
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomAppBarHome(size: height,title: "Kathryn Marshall", isArabic: false, showHome: false,),
          ),
          backgroundColor: themeColor2,
          body:   Stack(
            children: <Widget>[

              Padding(
                padding:  EdgeInsets.only(bottom: height*0.070,left: 16,right: 16),
                child: ListView.builder(
                  itemCount: messages.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  //physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return (messages[index].messageType == "receiver"
                        ?  Column(

                      children: [
                        InkWell(
                          onTap:(){
                            selectPaymentType(height,width);

                          },
                          child: Stack(
                            children: [


                              Container(
                                padding:
                                EdgeInsets.only(left: 30, right: 40, top: 0, bottom: 0),
                                child: Align(
                                  alignment: (Alignment.topLeft),
                                  child:
                                  Container(


                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0xffF0F5FC),
                                    ),
                                    padding: EdgeInsets.all(16),
                                    child:

                                    Text(
                                      messages[index].messageContent,
                                      style: TextStyle(fontSize: 13,fontFamily: 'sftr',color: textColor),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left:-2,
                                top:10,
                                child:    Container(
                                  height: 40,width: 40,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'lib/assets/icons/personicon.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    //  shape: BoxShape.circle,

                                    border: Border.all(color: themeColor2, width:2),
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height*0.01,),


                        Container(
                          padding:
                          EdgeInsets.only( left: width*0.09, top: 0, bottom: 0),
                          child: Align(
                            alignment: ( Alignment.topLeft),
                            child: Container(
                                child:VariableText(text: "10:05Am",fontsize: 11,fontFamily: 'sftr',fontcolor:hinttextColor)),
                          ),
                        ),
                        SizedBox(height: height*0.03,),


                      ],
                    )
                        :Column(

                      children: [
                        Container(
                          padding:
                          EdgeInsets.only(left: 40, right: 0, top: 0, bottom: 0),
                          child: Align(
                            alignment: (messages[index].messageType == "receiver"
                                ? Alignment.topLeft
                                : Alignment.topRight),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (messages[index].messageType == "receiver"
                                    ? Colors.grey.shade200
                                    : themeColor1),
                              ),
                              padding: EdgeInsets.all(16),
                              child:

                              Text(
                                messages[index].messageContent,
                                style: TextStyle(fontSize: 13,fontFamily: 'sftr',color: themeColor2),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height*0.01,),

                        Container(
                          padding:
                          EdgeInsets.only(left: 0, right: width*0.02, top: 0, bottom: 0),
                          child: Align(
                            alignment: (messages[index].messageType == "receiver"
                                ? Alignment.topLeft
                                : Alignment.topRight),
                            child: Container(
                                child:VariableText(text: "10:05Am",fontsize: 11,fontFamily: 'sftr',fontcolor: hinttextColor,)),
                          ),
                        ),
                        SizedBox(height: height*0.03,),


                        /*  )*/
                      ],
                    )

                    )
                    ;
                  },
                ),
              ),

              Align(
                alignment: Alignment.bottomLeft,
                child:
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                  child: Container(
                      height:height*0.08,
                      decoration:  BoxDecoration(
                        color: Color(0xffF0F5FC),
                        borderRadius: BorderRadius.all(
                            Radius.circular(height*0.02) //                 <--- border radius here
                        ),
                      ),
                      child:Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex:2,
                                child: Container(
                                    height: height*0.06,
                                    child: Image.asset("lib/assets/icons/cameraicon.png",scale:2.5))),
                            Expanded(
                              flex:12,
                              child: Container(
                                padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                                height:height*0.06,


                                child:
                                Padding(
                                  padding:  EdgeInsets.all(height*0.002),
                                  child: TextField(
                                    controller: _controller,
                                    style:  TextStyle(color: Color(0xff2B3E4F),
                                        fontSize:height*0.015,fontFamily: 'sftr'),

                                    decoration: InputDecoration(
                                        hintText: "Write A Comment",
                                        hintStyle: TextStyle(color: Color(0xfc3C3C43),
                                            fontSize:height*0.015,fontFamily: 'sftr'),

                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                            ),

                            Expanded(
                                flex:2,
                                child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      messages.add(ChatMessage1(
                                          messageContent: _controller.text,
                                          messageType: "sender"));
                                      _controller.clear();
                                    });},
                                  child: Container(
                                      height:height*0.06,
                                      child: Image.asset("lib/assets/icons/chatsend.png",scale:height*0.004,)),
                                )),
                          ],
                        ),
                      )
                  ),
                ),

              ),

            ],
          ),
        );
      case Orientation.portrait:
        double height=MediaQuery.of(context).size.height;
        double width=MediaQuery.of(context).size.width;
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomAppBarHome(size: height,title: "Kathryn Marshall", isArabic: false, showHome: false,),
          ),
          backgroundColor: themeColor2,
          body:   Stack(
            children: <Widget>[

              Padding(
                padding:  EdgeInsets.only(bottom: height*0.070,left: 16,right: 16),
                child: ListView.builder(
                  itemCount: messages.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  //physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return (messages[index].messageType == "receiver"
                        ?  Column(

                      children: [
                        InkWell(
                          onTap:(){
                            selectPaymentType(height,width);
                          },
                          child: Stack(
                            children: [


                              Container(
                                padding:
                                EdgeInsets.only(left: 30, right: 40, top: 0, bottom: 0),
                                child: Align(
                                  alignment: (Alignment.topLeft),
                                  child:
                                  Container(


                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0xffF0F5FC),
                                    ),
                                    padding: EdgeInsets.all(16),
                                    child:

                                    Text(
                                      messages[index].messageContent,
                                      style: TextStyle(fontSize: 13,fontFamily: 'sftr',color: textColor),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left:-2,
                                top:10,
                                child:    Container(
                                  height: 40,width: 40,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'lib/assets/icons/personicon.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    //  shape: BoxShape.circle,

                                    border: Border.all(color: themeColor2, width:2),
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height*0.01,),


                        Container(
                          padding:
                          EdgeInsets.only( left: width*0.09, top: 0, bottom: 0),
                          child: Align(
                            alignment: ( Alignment.topLeft),
                            child: Container(
                                child:VariableText(text: "10:05Am",fontsize: 11,fontFamily: 'sftr',fontcolor:hinttextColor)),
                          ),
                        ),
                        SizedBox(height: height*0.03,),


                      ],
                    )
                        :Column(

                      children: [
                          Container(
                         padding:
                         EdgeInsets.only(left: 40, right: 0, top: 0, bottom: 0),
                         child: Align(
                           alignment: (messages[index].messageType == "receiver"
                               ? Alignment.topLeft
                               : Alignment.topRight),
                           child: Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(20),
                               color: (messages[index].messageType == "receiver"
                                   ? Colors.grey.shade200
                                   : themeColor1),
                             ),
                             padding: EdgeInsets.all(16),
                             child:

                             Text(
                               messages[index].messageContent,
                               style: TextStyle(fontSize: 13,fontFamily: 'sftr',color: themeColor2),
                             ),
                           ),
                         ),
                          ),
                          SizedBox(height: height*0.01,),

                          Container(
                         padding:
                         EdgeInsets.only(left: 0, right: width*0.02, top: 0, bottom: 0),
                         child: Align(
                           alignment: (messages[index].messageType == "receiver"
                               ? Alignment.topLeft
                               : Alignment.topRight),
                           child: Container(
                               child:VariableText(text: "10:05Am",fontsize: 11,fontFamily: 'sftr',fontcolor: hinttextColor,)),
                         ),
                          ),
                          SizedBox(height: height*0.03,),


                          /*  )*/
                      ],
                    )

                    )
                    ;
                  },
                ),
              ),

              Align(
                alignment: Alignment.bottomLeft,
                child:
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                  child: Container(
                  height:height*0.07,
                      decoration:  BoxDecoration(
                  color: Color(0xffF0F5FC),
                  borderRadius: BorderRadius.all(
                  Radius.circular(height*0.02) //                 <--- border radius here
                  ),
                  ),
                  child:Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                  children: [
                  Expanded(
                  flex:2,
                  child: Container(
                  height: height*0.06,
                  child: Image.asset("lib/assets/icons/cameraicon.png",scale: 2.5))),
                  Expanded(
                  flex:12,
                  child: TextField(
                  controller: _controller,
                  style:  TextStyle(color: Color(0xff2B3E4F),
                  fontSize:height*0.015,fontFamily: 'sftr'),

                  decoration: InputDecoration(
                  hintText: getTranslated(context, "Write A Comment"),
                  hintStyle: TextStyle(color: Color(0xfc3C3C43),
                  fontSize:height*0.015,fontFamily: 'sftr'),

                  border: InputBorder.none),
                  ),
                  ),

                  Expanded(
                  flex:2,
                  child: InkWell(
                  onTap: (){
                  setState(() {
                  messages.add(ChatMessage1(
                  messageContent: _controller.text,
                  messageType: "sender"));
                  messages.add(ChatMessage1(
                      messageContent: "Ok ",
                      messageType: "receiver"));

                  _controller.clear();
                  });},
                  child: Container(
                  height:height*0.06,
                  child: Image.asset("lib/assets/icons/chatsend.png",scale:height*0.004,)),
                  )),
                  ],
                  ),
                  )
                  ),
                ),

                              ),

                            ],
                          ),
                        );

                    }

                  }


  void selectPaymentType(double height,double width){
    showModalBottomSheet(
        isScrollControlled: true,
        //transitionAnimationController: controller,
        backgroundColor: Colors.transparent,
        context: context, builder: (context) {

      return DraggableScrollableSheet(
          initialChildSize: 0.50, //set this as you want
          maxChildSize:0.50, //set this as you want
          minChildSize:0.50, //set this as you want
          expand: false,
          builder: (context, scrollController) {
            return selectPaymentTypeClass(height:height,width:width,onSelect: (temp){
                Navigator.of(context).pop();

              },);
            //whatever you're returning, does not have to be a Container
          }

      );
    });

  }

}

class selectPaymentTypeClass extends StatefulWidget {
  final double height,width;
  Function onSelect;
  selectPaymentTypeClass({this.height,this.width,this.onSelect});


  @override
  _selectPaymentTypeClassState createState() => _selectPaymentTypeClassState();
}

class _selectPaymentTypeClassState extends State<selectPaymentTypeClass> {


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
          // physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: widget.height*0.025),
            child: Column(
              children: [
                SizedBox(height: widget.height*0.03,),
                VariableText(text: "Payment Methed",
                  fontsize: widget.height*0.028,
                  fontcolor: Color(0xff2B3E4F),

                  fontFamily: 'sfdr',),
                SizedBox(height: widget.height*0.06,),
                Container(
                  height: widget.height*0.28,
                  width: widget.height,
                  //color: themeColor3,
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
                                     // Navigator.push(context, MaterialPageRoute(builder: (_)=>AddCreditCardScreen()));
                                      Navigator.pop(context);
                                      selectCreditCard(widget.height,widget.width);
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
                                          SizedBox(width: widget.height*0.02,),
                                          VariableText(text: "Credit Card", fontsize: 13,fontFamily: 'sftr', fontcolor: Color(0xFF2B3E4F),),



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
                                        SizedBox(width: widget.height*0.02,),
                                        VariableText(text: "CASH", fontsize: 13,fontFamily: 'sftr', fontcolor: Color(0xFF2B3E4F),),



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
                                VariableText(text: "Balance", fontsize: 13,fontFamily: 'sftr', fontcolor: Color(0xFF2B3E4F),),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [


                                    VariableText(text: '2451', fontsize: widget.height*0.030,fontFamily: 'sfdb', fontcolor: Color(0xFFF47920),),
                                    SizedBox(width: widget.height*0.0050,),
                                    Column(
                                      children: [
                                        SizedBox(height: widget.height*0.02,),
                                        VariableText(text: 'Eg', fontsize: widget.height*0.013,fontFamily: 'sftr', fontcolor: Color(0xFF2C3E50),),

                                      ],
                                    ),],
                                ),
                                SizedBox(height: widget.height*0.03,),
                                Image.asset('lib/assets/icons/wallet.png',scale: 3.5,),
                                SizedBox(height: widget.height*0.01,),
                                VariableText(text: "Wallet", fontsize: 13,fontFamily: 'sftr', fontcolor: Color(0xFF2B3E4F),),




                              ],
                            ),
                          )),

                    ],
                  ),
                ),





                SizedBox(height:widget. height*0.02,),


                Row(
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
                          Navigator.pop(context);
                        },),
                    ),
                  ],
                ),
                SizedBox(height:widget. height*0.02,),







              ],
            ),
          ),
        ),
      );
  }

  void selectCreditCard(double height,double width){
    showModalBottomSheet(
        isScrollControlled: true,
        //transitionAnimationController: controller,
        backgroundColor: Colors.transparent,
        context: context, builder: (context) {

      return DraggableScrollableSheet(
          initialChildSize: 0.75, //set this as you want
          maxChildSize:0.75, //set this as you want
          minChildSize:0.75, //set this as you want
          expand: false,
          builder: (context, scrollController) {
            return selectCreditCardClass(height:height,width:width,);
            //whatever you're returning, does not have to be a Container
          }

      );
    });

  }

}

class selectCreditCardClass extends StatefulWidget {
  final double height,width;

  selectCreditCardClass({this.height,this.width});


  @override
  _selectCreditCardClassState createState() => _selectCreditCardClassState();
}

class _selectCreditCardClassState extends State<selectCreditCardClass> {
  List<String> creditCard = ["lib/assets/images/card1.png" ,"lib/assets/images/card2.png","lib/assets/images/card1.png","lib/assets/images/card2.png" ];


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
          // physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: widget.height*0.025),
            child: Column(

              children: [
                SizedBox(height: widget.height*0.03,),
                VariableText(text: "Credit Card",
                  fontsize: widget.height*0.028,
                  fontcolor: Color(0xff2B3E4F),

                  fontFamily: 'sfdr',),
                SizedBox(height: widget.height*0.03,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: widget.height * 0.06,
                      width: widget.width * 0.25,
                      decoration: BoxDecoration(
                          color: Color(0xFFF8F9FA),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: VariableText(
                              text: 'Add New',
                              fontsize: 15,
                              fontcolor: Color(0x703C3C43),
                              fontFamily: 'sftr')),
                    ),
                  ],
                ),
                SizedBox(height: widget.height*0.03,),
                Container(
                  height: widget.height*0.43,

                  child: ListView.builder(
                      itemCount:creditCard.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return  Row(
                          children: [
                            Container(

                              child:Image.asset(creditCard[index]),
                            ),
                            SizedBox(width: 15,)
                          ],
                        );
                      }),
                ),






                SizedBox(height:widget. height*0.04,),


                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        buttonHeight:widget. height*0.06,
                        buttonBorderRadius:8,
                        buttonFontSize:widget.height*0.025,
                        buttonColor:themeColor1,
                        buttonTextColor:themeColor2,
                        buttonText: "Payment now   426eg",
                        buttonFontFamily:'sfdm',
                        buttonOnTap:(){
                          Navigator.pop(context);
                        },),
                    ),
                  ],
                ),
                SizedBox(height:widget. height*0.02,),







              ],
            ),
          ),
        ),
      );
  }



}



