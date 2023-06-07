import 'package:flutter/material.dart';
import 'package:task/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

import '../model/music.dart';

class Home extends StatefulWidget {

  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FavoriteController controller = Get.put(FavoriteController());
  bool isPlaying = false;
  bool isPlaying1 = false;
  bool isPlaying2 = false;
  bool isPlaying3= false;
  bool isPlaying4 = false;
  bool isPlaying5 = false;
  final titleList = [
    'Apna Time Aayega',
    'Bulleya',
    '2 Woofer',
    'Rihaayi',
    'Apna Bna Le',
    'Sajde'
  ];
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
  final List<String> songList =[
    'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/0e/d5/52/0ed55222-e6ae-1e7f-24c1-284da449af4e/mzaf_169448091425248968.plus.aac.p.m4a',
    'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview113/v4/62/3b/52/623b52ef-1221-aaab-c479-b7bffc6e8846/mzaf_16622054093860201721.plus.aac.p.m4a'
    'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/06/2e/17/062e17dd-de9b-b0cd-7aef-033ae20dc73a/mzaf_4612387754573660492.plus.aac.p.m4a',
    'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview122/v4/dc/12/e7/dc12e7ca-c997-d49e-8bd6-6118f9842dc1/mzaf_8879942436472049221.plus.aac.p.m4a',
    'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview122/v4/09/51/0d/09510dea-6579-5cd0-b13b-696abc2c520b/mzaf_10718921821360997069.plus.aac.p.m4a',
    'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/c1/de/73/c1de73ee-793a-ab5a-df15-60bebfc24536/mzaf_9283844081644027607.plus.aac.p.m4a'
  ];
  AudioPlayer _audioPlayer = new AudioPlayer();
  Widget createAppBar(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20.0),
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.black54.withOpacity(0.2),
              ),
              child: Icon(Icons.menu,color: Colors.white,size: 25.0,),
            ),
            Container(
              width: 320,
              height: 50,
              child: Padding(
                padding: EdgeInsets.only(left: 20 ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    contentPadding: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                    filled: true,
                    fillColor: Colors.black54.withOpacity(0.2),
                    hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 0)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:  Colors.transparent, width: 0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget createStack(Music music){
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: 200,
              height: 200,
              child: Image.asset(music.image,fit: BoxFit.cover,),
            ),
          ),
          Positioned(
              top: 20,
              left: 150,
              child: Icon(Icons.more_horiz,color: Colors.white,size: 30.0,)),
          Positioned(
            top: 115,
            left: 7.0,
            child: Container(
              width: MediaQuery.of(context).size.width/2.2,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(.6),
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(music.title,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w800,color: Colors.white),),
                      ),
                      Row(
                        children: [
                          Icon(Icons.music_note,color: Colors.white,size: 20.0,),
                          Text('Music-Stimulation Theory',style: TextStyle(color: Colors.white,fontSize: 12.0,fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 20.0,),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: InkWell(
                      onTap: ()async{
                        music.isPlaying = !music.isPlaying;
                        if(music.isPlaying){
                          await _audioPlayer.play(UrlSource(music.song));
                        }
                        else{
                          await _audioPlayer.pause();
                        }
                        setState(() {

                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white
                        ),
                        child: music.isPlaying ? Icon(Icons.pause,color: Colors.black,) :Icon(Icons.play_arrow,color: Colors.black,)
                      ),
                    ),
                  )
                ],
              ),

            ),
          )
        ],
      ),
    );
  }
  Widget createContainer(String text){
    return Container(
      height: 30,
      child: Center(child: Text(text,style: TextStyle(fontSize: 18,color: Colors.white),)),
    );
  }



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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.0,),
            createAppBar(),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Trending right now',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w500,color: Colors.white),),
            ),
            SizedBox(height: 10.0,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      width: 200,
                      height: 200,
                      child: Image.asset('assets/images/GullyBoy.jpg',fit: BoxFit.cover,),
                    ),
                  ),
                  Positioned(
                      top: 20,
                      left: 150,
                      child: Icon(Icons.more_horiz,color: Colors.white,size: 30.0,)),
                  Positioned(
                    top: 115,
                    left: 7.0,
                    child: Container(
                      width: MediaQuery.of(context).size.width/2.2,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple.withOpacity(.6),
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('Apna Time Aayega',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w800,color: Colors.white),),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.music_note,color: Colors.white,size: 20.0,),
                                  Text('Music-Stimulation Theory',style: TextStyle(color: Colors.white,fontSize: 12.0,fontWeight: FontWeight.w400),),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 20.0,),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: InkWell(
                              onTap: ()async{
                                isPlaying = !isPlaying;
                                if(isPlaying){
                                  await _audioPlayer.play(UrlSource('https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/0e/d5/52/0ed55222-e6ae-1e7f-24c1-284da449af4e/mzaf_169448091425248968.plus.aac.p.m4a',
                                  ));
                                }
                                else{
                                  await _audioPlayer.pause();
                                }
                                setState(() {
                                  isPlaying1=false;
                                  isPlaying2=false;
                                  isPlaying3=false;
                                  isPlaying4=false;
                                  isPlaying5=false;
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white
                                  ),
                                  child:isPlaying ? Icon(Icons.pause,color: Colors.black,) :Icon(Icons.play_arrow,color: Colors.black,)
                              ),
                            ),
                          )
                        ],
                      ),

                    ),
                  )
                ],
              ),
            ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 200,
                            height: 200,
                            child: Image.asset('assets/images/Bulleya.jpg',fit: BoxFit.cover,),
                          ),
                        ),
                        Positioned(
                            top: 20,
                            left: 150,
                            child: Icon(Icons.more_horiz,color: Colors.white,size: 30.0,)),
                        Positioned(
                          top: 115,
                          left: 7.0,
                          child: Container(
                            width: MediaQuery.of(context).size.width/2.2,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple.withOpacity(.6),
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text('Bulleya',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w800,color: Colors.white),),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.music_note,color: Colors.white,size: 20.0,),
                                        Text('Music-Stimulation Theory',style: TextStyle(color: Colors.white,fontSize: 12.0,fontWeight: FontWeight.w400),),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20.0,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: InkWell(
                                    onTap: ()async{
                                      isPlaying1 = !isPlaying1;
                                      if(isPlaying1){
                                        await _audioPlayer.play(UrlSource('https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview113/v4/62/3b/52/623b52ef-1221-aaab-c479-b7bffc6e8846/mzaf_16622054093860201721.plus.aac.p.m4a'
                                        ));
                                      }
                                      else{
                                        await _audioPlayer.pause();
                                      }
                                      setState(() {
                                        isPlaying =false;
                                        isPlaying2=false;
                                        isPlaying3=false;
                                        isPlaying4=false;
                                        isPlaying5=false;
                                      });
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: Colors.white
                                        ),
                                        child:isPlaying1 ? Icon(Icons.pause,color: Colors.black,) :Icon(Icons.play_arrow,color: Colors.black,)
                                    ),
                                  ),
                                )
                              ],
                            ),

                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 200,
                            height: 200,
                            child: Image.asset('assets/images/2Woofer.jpg',fit: BoxFit.cover,),
                          ),
                        ),
                        Positioned(
                            top: 20,
                            left: 150,
                            child: Icon(Icons.more_horiz,color: Colors.white,size: 30.0,)),
                        Positioned(
                          top: 115,
                          left: 7.0,
                          child: Container(
                            width: MediaQuery.of(context).size.width/2.2,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple.withOpacity(.6),
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text('2 Woofer',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w800,color: Colors.white),),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.music_note,color: Colors.white,size: 20.0,),
                                        Text('Music-Stimulation Theory',style: TextStyle(color: Colors.white,fontSize: 12.0,fontWeight: FontWeight.w400),),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20.0,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: InkWell(
                                    onTap: ()async{
                                      isPlaying2 = !isPlaying2;
                                      if(isPlaying2){
                                        await _audioPlayer.play(UrlSource('https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/06/2e/17/062e17dd-de9b-b0cd-7aef-033ae20dc73a/mzaf_4612387754573660492.plus.aac.p.m4a',
                                        ));
                                      }
                                      else{
                                        await _audioPlayer.pause();
                                      }
                                      setState(() {
                                        isPlaying=false;
                                        isPlaying1=false;
                                        isPlaying3=false;
                                        isPlaying4=false;
                                        isPlaying5=false;
                                      });
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: Colors.white
                                        ),
                                        child:isPlaying2 ? Icon(Icons.pause,color: Colors.black,) :Icon(Icons.play_arrow,color: Colors.black,)
                                    ),
                                  ),
                                )
                              ],
                            ),

                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 200,
                            height: 200,
                            child: Image.asset('assets/images/Rihaayi.jpg',fit: BoxFit.cover,),
                          ),
                        ),
                        Positioned(
                            top: 20,
                            left: 150,
                            child: Icon(Icons.more_horiz,color: Colors.white,size: 30.0,)),
                        Positioned(
                          top: 115,
                          left: 7.0,
                          child: Container(
                            width: MediaQuery.of(context).size.width/2.2,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple.withOpacity(.6),
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text('Rihaayi',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w800,color: Colors.white),),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.music_note,color: Colors.white,size: 20.0,),
                                        Text('Music-Stimulation Theory',style: TextStyle(color: Colors.white,fontSize: 12.0,fontWeight: FontWeight.w400),),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20.0,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: InkWell(
                                    onTap: ()async{
                                      isPlaying3 = !isPlaying3;
                                      if(isPlaying3){
                                        await _audioPlayer.play(UrlSource('https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview122/v4/dc/12/e7/dc12e7ca-c997-d49e-8bd6-6118f9842dc1/mzaf_8879942436472049221.plus.aac.p.m4a',
                                        ));
                                      }
                                      else{
                                        await _audioPlayer.pause();
                                      }
                                      setState(() {
                                        isPlaying=false;
                                        isPlaying1=false;
                                        isPlaying2=false;
                                        isPlaying4=false;
                                        isPlaying5=false;
                                      });
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: Colors.white
                                        ),
                                        child:isPlaying3 ? Icon(Icons.pause,color: Colors.black,) :Icon(Icons.play_arrow,color: Colors.black,)
                                    ),
                                  ),
                                )
                              ],
                            ),

                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 200,
                            height: 200,
                            child: Image.asset('assets/images/ApnaBanLe.jpg',fit: BoxFit.cover,),
                          ),
                        ),
                        Positioned(
                            top: 20,
                            left: 150,
                            child: Icon(Icons.more_horiz,color: Colors.white,size: 30.0,)),
                        Positioned(
                          top: 115,
                          left: 7.0,
                          child: Container(
                            width: MediaQuery.of(context).size.width/2.2,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple.withOpacity(.6),
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text('Apna Bana Le',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w800,color: Colors.white),),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.music_note,color: Colors.white,size: 20.0,),
                                        Text('Music-Stimulation Theory',style: TextStyle(color: Colors.white,fontSize: 12.0,fontWeight: FontWeight.w400),),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20.0,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: InkWell(
                                    onTap: ()async{
                                      isPlaying4 = !isPlaying4;
                                      if(isPlaying4){
                                        await _audioPlayer.play(UrlSource('https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview122/v4/09/51/0d/09510dea-6579-5cd0-b13b-696abc2c520b/mzaf_10718921821360997069.plus.aac.p.m4a',
                                        ));
                                      }
                                      else{
                                        await _audioPlayer.pause();
                                      }
                                      setState(() {
                                        isPlaying=false;
                                        isPlaying1=false;
                                        isPlaying2=false;
                                        isPlaying3=false;
                                        isPlaying5=false;
                                      });
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: Colors.white
                                        ),
                                        child:isPlaying4 ? Icon(Icons.pause,color: Colors.black,) :Icon(Icons.play_arrow,color: Colors.black,)
                                    ),
                                  ),
                                )
                              ],
                            ),

                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 200,
                            height: 200,
                            child: Image.asset('assets/images/Sajde.jpg',fit: BoxFit.cover,),
                          ),
                        ),
                        Positioned(
                            top: 20,
                            left: 150,
                            child: Icon(Icons.more_horiz,color: Colors.white,size: 30.0,)),
                        Positioned(
                          top: 115,
                          left: 7.0,
                          child: Container(
                            width: MediaQuery.of(context).size.width/2.2,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple.withOpacity(.6),
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text('Sajde',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w800,color: Colors.white),),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.music_note,color: Colors.white,size: 20.0,),
                                        Text('Music-Stimulation Theory',style: TextStyle(color: Colors.white,fontSize: 12.0,fontWeight: FontWeight.w400),),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20.0,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: InkWell(
                                    onTap: ()async{
                                      isPlaying5 = !isPlaying5;
                                      if(isPlaying5){
                                        await _audioPlayer.play(UrlSource('https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/c1/de/73/c1de73ee-793a-ab5a-df15-60bebfc24536/mzaf_9283844081644027607.plus.aac.p.m4a'
                                        ));
                                      }
                                      else{
                                        await _audioPlayer.pause();
                                      }
                                      setState(() {
                                        isPlaying=false;
                                        isPlaying1=false;
                                        isPlaying2=false;
                                        isPlaying3=false;
                                        isPlaying4=false;
                                      });
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: Colors.white
                                        ),
                                        child:isPlaying5 ? Icon(Icons.pause,color: Colors.black,) :Icon(Icons.play_arrow,color: Colors.black,)
                                    ),
                                  ),
                                )
                              ],
                            ),

                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/3,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.deepPurple,
                            Colors.deepPurple.withOpacity(0.2)
                          ]
                        )
                      ),
                      child: Center(child: Text('Trending right now',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.white),)),
                    ),
                    SizedBox(width: 30.0,),
                    createContainer('Rock'),
                    SizedBox(width: 30.0,),
                    createContainer('Hip Hop'),
                    SizedBox(width: 30.0,),
                    createContainer('Electro'),
                    SizedBox(width: 30.0,),
                    createContainer('Top Hits'),
                    SizedBox(width: 30.0,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Expanded(
              child: ListView.builder(
                  itemCount: controller.titleList.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            width: 60,
                            height: 60,
                            child: Image.asset(imageList[index],fit: BoxFit.cover,),
                          ),
                        ),
                        title: Text(titleList[index],style: TextStyle(fontSize: 20.0,color: Colors.white),),
                        subtitle: Row(
                          children: [
                            Icon(Icons.account_circle,size: 16.0,color: Colors.white12,),
                            SizedBox(width: 2.0,),
                            Text(singerList[index],style: TextStyle(fontSize: 18.0,color: Colors.white12)),
                          ],
                        ),
                        trailing: Obx(() => InkWell(
                            onTap: (){
                              if(controller.temptitleList.contains(controller.titleList[index].toString())){
                                controller.removeFromFavorite(controller.titleList[index].toString());
                              }else{
                                controller.addToFavorite(controller.titleList[index].toString());
                              }
                            },
                            child:controller.temptitleList.contains(controller.titleList[index].toString())?
                            Icon(Icons.favorite,size: 25.0,color: Colors.red,):
                            Icon(Icons.favorite_border_outlined,size: 25.0,color: Colors.white,)
                        ),)
                      ),
                    );
                  }),
            ),
            SizedBox(height: 20.0,),
          ],
        ),
      ),
    ));
  }
}
