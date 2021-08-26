class City{

   String image;
   String code;
   City({this.image,this.code,});

  City.fromJson(Map<String, dynamic> json){
    try{

        image = json['image'];
        code = json['code'];



    }catch(e){
      print(e.toString());
    }
  }

  @override
  String toString() {
    return image;
  }

}