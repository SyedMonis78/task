import '../model/music.dart';

class MusicOperations{
  MusicOperations._(){}
   List<Music> getMusic(){
    return <Music>[
      Music(
          'Gully Boy',
          'assets/images/GullyBoy.jpg',
          'Divine and Ranveer Singh',
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/0e/d5/52/0ed55222-e6ae-1e7f-24c1-284da449af4e/mzaf_169448091425248968.plus.aac.p.m4a',
      ),
      Music(
        'Bulleya',
        'assets/images/Bulleya.jpg',
        'Pritam, Amit Mishra, Shilpa Rao',
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview113/v4/62/3b/52/623b52ef-1221-aaab-c479-b7bffc6e8846/mzaf_16622054093860201721.plus.aac.p.m4a'
      ),
      Music(
          '2 Woofer',
          'assets/images/2Woofer.jpg',
          'MC Square',
        'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/06/2e/17/062e17dd-de9b-b0cd-7aef-033ae20dc73a/mzaf_4612387754573660492.plus.aac.p.m4a',
      ),
      Music(
        'Rihaayi',
        'assets/images/Rihaayi.jpg',
        'Paradox',
        'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview122/v4/dc/12/e7/dc12e7ca-c997-d49e-8bd6-6118f9842dc1/mzaf_8879942436472049221.plus.aac.p.m4a',
      ),
      Music(
        'Apna Bna Le',
        'assets/images/ApnaBanLe.jpg',
        'Arijit Singh and Sachin-Jigar',
        'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview122/v4/09/51/0d/09510dea-6579-5cd0-b13b-696abc2c520b/mzaf_10718921821360997069.plus.aac.p.m4a',
      ),
      Music(
        'Sajde',
        'assets/images/Sajde.jpg',
        'KK and Sunidhi Chauhan',
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/c1/de/73/c1de73ee-793a-ab5a-df15-60bebfc24536/mzaf_9283844081644027607.plus.aac.p.m4a'
      ),
    ];
  }
}
