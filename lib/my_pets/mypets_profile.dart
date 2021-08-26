import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/commons.dart';

class PetsProfile extends StatefulWidget {
  var petDetails;

  PetsProfile({this.petDetails});
  @override
  _PetsProfileState createState() => _PetsProfileState();
}

class _PetsProfileState extends State<PetsProfile> with TickerProviderStateMixin {
  TabController profileViewController;
  TabController tabViewController;

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _numController = new TextEditingController();


  int indicatorIndex=0;
  int genderIndex = 0;

  Map<String, dynamic> tabInfo = {"tabs": [
    {
      "name": "Main Information",
      "icon": "lib/assets/icons/myPets_info0.png"
    },
    {
      "name": "Registration Date",
      "icon": "lib/assets/icons/myPets_info1.png"
    },
    {
      "name": "Lorem Ipsum",
      "icon": "lib/assets/icons/myPets_info2.png"
    },
    {
      "name": "Lorem Ipsum",
      "icon": "lib/assets/icons/myPets_info3.png"
    },
    {
      "name": "Lorem Ipsum",
      "icon": "lib/assets/icons/myPets_info4.png"
    },
    {
      "name": "Lorem Ipsum",
      "icon": "lib/assets/icons/myPets_info5.png"
    }
  ]};

  List<String> gender = ['Male', 'Female'];

  int _selectedIndex = 0;

  _onSelected(int i){
    setState(() {
      genderIndex = i;
    });
  }

  onTabPressed(int i){
    setState(() {
      _selectedIndex = i;
      tabViewController.animateTo(i);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileViewController = TabController(length: 3, vsync: this);
    profileViewController.addListener(() {
      setState(() {
        indicatorIndex = profileViewController.index;
      });

    });

    tabViewController = TabController(length: tabInfo['tabs'].length, vsync: this);
    _nameController.text = widget.petDetails['name'];
    _numController.text = '+938 01030891060';

  }
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    switch (MediaQuery.of(context).orientation) {
      case Orientation.landscape:
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: renderAppbar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                renderProfilePictures(size.width, size.width),
                SizedBox(height: size.height * 0.10),
                rendertabs(size.width, size.width),
                SizedBox(height: size.height * 0.02),
                renderPageView(size.width, size.width),
              ],
            ),
          ),
        );

      case Orientation.portrait:
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: renderAppbar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                renderProfilePictures(size.height, size.width),
                SizedBox(height: size.height * 0.03),
                rendertabs(size.height, size.width),
                SizedBox(height: size.height * 0.02),
                renderPageView(size.height, size.width),
              ],
            ),
          ),
        );
    }
  }

  Widget renderAppbar(){
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      titleSpacing: 0,
      centerTitle: true,
      leadingWidth: 65,
      title: VariableText(text: widget.petDetails['name'], fontcolor: Color(0xFF2C3E50), fontsize: 17, fontFamily: 'sftsb',),
      leading: Container(
        margin: EdgeInsets.only(left: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFEAF0F9),
                borderRadius: BorderRadius.circular(60)
            ),
            child: IconButton(icon: Image.asset('lib/assets/icons/appbar_back.png', scale: 3.2,),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ),
      actions: [
        InkWell(
          onTap: (){},
          child: SizedBox(
            width: 26,
            child: Image.asset("lib/assets/icons/notification2x.png"),
          ),
        ),
        SizedBox(width: 12),
        InkWell(
          onTap: () {},
          child: SizedBox(
            width: 26,
            child: Image.asset("lib/assets/icons/chat2x.png"),
          ),
        ),
        SizedBox(width: 16,),
      ],
    );
  }

  Widget renderProfilePictures(var cHeight, var cWidth){
    return Container(
      height: cHeight * 0.30,
      width: cWidth,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          //color: Colors.red,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Stack(
        children: [
          TabBarView(
            controller: profileViewController,
              children: <Widget>[
                InkWell(
          onTap: () async {
            await showDialog(context: context, builder: (_) => ImageDialog(imagePath: widget.petDetails['image'], height: cHeight, width: cWidth,));
            },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(widget.petDetails['image']),
                          fit: BoxFit.cover
                      )
                    ),
                      //child: Image.asset(widget.petDetails['image'], fit: BoxFit.cover)
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await showDialog(context: context, builder: (_) => ImageDialog(imagePath: widget.petDetails['image'], height: cHeight, width: cWidth,));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: AssetImage(widget.petDetails['image']),
                            fit: BoxFit.cover
                        )
                    ),
                    //child: Image.asset(widget.petDetails['image'], fit: BoxFit.cover)
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await showDialog(context: context, builder: (_) => ImageDialog(imagePath: widget.petDetails['image'], height: cHeight, width: cWidth,));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: AssetImage(widget.petDetails['image']),
                            fit: BoxFit.cover
                        )
                    ),
                    //child: Image.asset(widget.petDetails['image'], fit: BoxFit.cover)
                  ),
                ),
              ]
          ),
          Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Image.asset('lib/assets/icons/myPets_addImage.png', scale: 3.4,),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index){
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: indicatorIndex == index ? Color(0xFF2C3E50) : Color(0x602C3E50),
                        borderRadius: BorderRadius.circular(50)
                      ),
                    ),
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );

  }

  Widget rendertabs(var cHeight, var cWidth){
    return Container(
      height: cHeight * 0.14,
      width: cWidth,
      //color: Colors.red,
      margin: EdgeInsets.only(left: 16),
      child: ListView.builder(
        itemCount: tabInfo['tabs'].length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, index){
            return InkWell(
              onTap: (){
                onTabPressed(index);
              },
              child: Container(
                padding: EdgeInsets.only(right: 12),
                margin: _selectedIndex == index ? EdgeInsets.only(bottom: 10) : EdgeInsets.only(bottom: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: cHeight * 0.09,
                      width: cHeight * 0.155,
                      decoration: BoxDecoration(
                          color: _selectedIndex == index ? Color(0xFF00AEEF) : Color(0xFFF0F5FC),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Image.asset(tabInfo['tabs'][index]['icon'], scale: 3.2,
                          color: _selectedIndex == index ? Colors.white : Color(0xFF646060)),
                    ),
                    _selectedIndex == index ?
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: VariableText(
                        text: tabInfo['tabs'][index]['name'],
                        fontsize: 12,
                        fontcolor: Color(0xFF2B3E4F),
                      ),
                    ): Container()
                  ],
                ),
              ),
            );
      })
    );
  }

  Widget renderPageView(var cHeight, var cWidth){
    return Container(
      height: cHeight * 0.35,
      //color: Colors.yellow,
      child: TabBarView(
          controller: tabViewController,
          physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        renderTab0(cHeight, cWidth),
        renderTab1(cHeight, cWidth),
        renderTab0(cHeight, cWidth),
        renderTab0(cHeight, cWidth),
        renderTab0(cHeight, cWidth),
        renderTab0(cHeight, cWidth)
      ]
      ),
    );
  }

 Widget renderTab0(var cHeight, var cWidth){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeild(
            cont: _nameController,
            heights: 60,
            enable: true,
            widths: cWidth,
            maxLines: 1,
            hinttext: widget.petDetails['name'],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeildWithIcon(
            heights: 60,
            widths: cWidth,
            enable: false,
            //cont: _selectVaccineController,
            imageIconPath: 'lib/assets/icons/dropdownicon.png',
            hinttext: widget.petDetails['type'],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: List.generate(gender.length, (index){
              return GestureDetector(
                onTap: () {
                  _onSelected(index);
                },
                child: Container(
                  height: cHeight * 0.05,
                  width: cHeight * 0.15,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: genderIndex == index
                          ? Color(0xFF00AEEF)
                          : Color(0xFFF8F7F7),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: VariableText(
                        text: gender[index],
                        fontsize: 15,
                        fontcolor: genderIndex == index
                            ? Colors.white
                            : Color(0xFF2C3E50)),
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
 }

  Widget renderTab1(var cHeight, var cWidth){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeild(
            cont: _nameController,
            heights: 60,
            enable: true,
            widths: cWidth,
            maxLines: 1,
            hinttext: widget.petDetails['name'],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: RectangluartextFeild(
            cont: _numController,
            heights: 60,
            enable: true,
            widths: cWidth,
            maxLines: 1,
            hinttext: '+938 01030891060',
          ),
        ),
        Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: cHeight*0.07,
              width: cHeight*0.09,
              margin: EdgeInsets.only(left: 16, top: 10),
              decoration: BoxDecoration(
                color: Color(0xffF5F8FA),
                borderRadius: BorderRadius.circular(8),
              ),
              child:  Padding(
                padding:  EdgeInsets.only(left:0),
                child: Image.asset("lib/assets/icons/egypt.png",scale: 4.5,),
              ),
            ),

            Expanded(
              child: Container(
                height: cHeight*0.07,
                margin: EdgeInsets.only(left: 10, top: 10, right: 16),
                decoration: BoxDecoration(
                  color: Color(0xffF5F8FA),
                  borderRadius: BorderRadius.circular(8),
                ),
                child:
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:16),
                  child: TextFormField(
                    style:TextStyle(
                      fontSize: cHeight*0.019,
                      fontFamily: 'sftr',
                      color:  Color(0xff3C3C43,),),
                    // onChanged: enableBtn ,
                    // controller: _numController2,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Color(0xffF5F8FA),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: cHeight*0.015),
                      hintText: '01030891060',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

}

class ImageDialog extends StatelessWidget {
  var imagePath;
  var height;
  var width;

  ImageDialog({this.imagePath, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: height * 0.55,
        //width: height * 0.35,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage(imagePath.toString()),
                fit: BoxFit.fitHeight
            )
        ),
      ),
    );
  }
}
