import 'package:get/get.dart';

class FavoriteController extends GetxController{
  RxList<String> titleList=[
    'Apna Time Aayega',
    'Bulleya',
    '2 Woofer',
    'Rihaayi',
    'Apna Bna Le',
    'Sajde'
  ].obs;
  RxList temptitleList=[].obs;

  addToFavorite(String value){
    temptitleList.add(value);
  }
  removeFromFavorite(String value){
    temptitleList.remove(value);
  }
}