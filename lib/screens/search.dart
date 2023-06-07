import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  FavoriteController controller = Get.put(FavoriteController());
  final singerList=[
    'Divine and Ranveer Singh',
    'Pritam, Amit Mishra, Shilpa Rao',
    'MC Square',
    'Paradox',
    'Arijit Singh and Sachin-Jigar',
    'KK and Sunidhi Chauhan'
  ];
  final imageList =[
    'assets/images/GullyBoy.jpg',
    'assets/images/Bulleya.jpg',
    'assets/images/2Woofer.jpg',
    'assets/images/Rihaayi.jpg',
    'assets/images/ApnaBanLe.jpg',
    'assets/images/Sajde.jpg'
  ];
  Widget createAppbar(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.black54.withOpacity(0.2)
          ),
          child: Icon(Icons.keyboard_arrow_left,size: 25,color: Colors.white,),
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.black54.withOpacity(0.2)
          ),
          child: Icon(Icons.favorite_outline,size: 25,color: Colors.white,),
        )
      ],
    );
  }
  Widget ReusableContainer(String name , String info,String path){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: 175,
            height: 175,
            child: Image.asset(path,fit: BoxFit.cover,),
          ),
        ),
        SizedBox(height: 5.0,),
        Text(name,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.white),),
        SizedBox(height: 5.0,),
        Text(info,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.white),)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF4A148C).withOpacity(0.8),
                  Color(0xFF311B92).withOpacity(0.7)
                ]
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.0,),
                createAppbar(),
                SizedBox(height: 20.0,),
                Text('Recents favourites',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w500,color: Colors.white),),
                SizedBox(height: 20.0,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        ReusableContainer('Apna Time Aayega', 'The most popular music','assets/images/GullyBoy.jpg'),
                        SizedBox(height: 10.0,),
                        ReusableContainer('2 Woofer', 'Always never','assets/images/2Woofer.jpg'),
                        SizedBox(height: 10.0,),
                        ReusableContainer('Apna Bna Le', 'Always never','assets/images/ApnaBanLe.jpg'),
                      ],
                    ),
                    SizedBox(width: 20.0,),
                    Column(
                      children: [
                        ReusableContainer('Bulleya', 'Always never','assets/images/Bulleya.jpg'),
                        SizedBox(height: 10.0,),
                        ReusableContainer('Rihaayi', 'Always never','assets/images/Rihaayi.jpg'),
                        SizedBox(height: 10.0,),
                        ReusableContainer('Sajde', 'Always never','assets/images/Sajde.jpg'),
                      ],
                    )
                  ],
                ),
            ]
            ),
          ),
        ),
      ),
    ));
  }
}
