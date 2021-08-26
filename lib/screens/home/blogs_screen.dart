import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petzola/common/common_z.dart';
import 'package:petzola/common/commons.dart';
import 'package:petzola/common/style.dart';
import 'package:petzola/screens/blog/add_blog_screen.dart';

import 'package:petzola/screens/blog/view_profile_screen.dart';

class BlogsScreen extends StatefulWidget {
  @override
  _BlogsScreenState createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  bool landscapeOrientation=true;
  @override
  Widget build(BuildContext context) {
    return BlogScreen();

  }
  Widget BlogScreen(){
    switch(MediaQuery.of(context).orientation){
      case Orientation.landscape:
        double width=MediaQuery.of(context).size.height;
        double height=MediaQuery.of(context).size.width;
        return Scaffold(
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(parent: ScrollPhysics()),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:height*0.025),
              child: Column(
                children: [
                  SizedBox(height: height*0.05,),
                  RectangluartextFeildWithStartIcon(
                    heights: height*0.07,
                    widths:height*0.95,

                    fontsize:height*0.019,
                    hinttext: "Search",
                    imageIconPath: "lib/assets/icons/searchIcon.png",
                    keytype: TextInputType.text,
                  ),
                  SizedBox(height: height*0.05,),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context,i){
                        return  Column(
                          children: [
                            CustomBlogContainer(height: height,width: height,orientation: landscapeOrientation,onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>ViewProfileScreen()));
                            }),
                            SizedBox(height: height*0.03,),],
                        );
                      }),



                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            backgroundColor: themeColor1,
            child: Icon(Icons.add),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>AddBlogScreen()));
            },
          ),
        );
      case Orientation.portrait:
        setState(() {
          landscapeOrientation=false;
        });
        double height=MediaQuery.of(context).size.height;
        double width=MediaQuery.of(context).size.width;
        return Scaffold(
          backgroundColor: themeColor2,
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(parent: ScrollPhysics()),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:height*0.025),
              child: Column(
                children: [
                  SizedBox(height: height*0.05,),
                  RectangluartextFeildWithStartIcon(
                    heights: height*0.07,
                    widths:width*0.90,

                    fontsize:height*0.019,
                    hinttext: "Search",
                    imageIconPath: "lib/assets/icons/searchIcon.png",
                    keytype: TextInputType.text,
                  ),
                  SizedBox(height: height*0.05,),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context,i){
                        return  Column(
                          children: [
                            CustomBlogContainer(height: height,width: width,orientation: landscapeOrientation,
                              onTap:(){
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>ViewProfileScreen()));
                              },
                              onTapComment: (){
                                CommentBottomSheet(height,width,context);  },),
                            SizedBox(height: height*0.03,),],
                        );
                      }),



                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            backgroundColor: themeColor1,
            child: Icon(Icons.add),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>AddBlogScreen()));
            },
          ),
        );

    }


  }
}


