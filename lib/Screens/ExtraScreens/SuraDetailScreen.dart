
import 'dart:convert';

// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:quran/Apis/QuranApis.dart';
import 'package:quran/AppConstants/AppContants.dart';
import 'package:quran/AppUtils/AppUtils.dart';
import 'package:quran/Models/QuranModels/SurahDetailsApiResponse.dart';
import 'package:quran/Models/QuranModels/audioFilesApiResponse.dart';
import 'package:quran/Models/QuranModels/quranSurahApiResponse.dart';
import 'package:quran/Models/QuranModels/quranSurahApiResponse.dart' as surah;

// ignore: must_be_immutable
class SurahDetailScreen extends StatefulWidget {

  int surahNumber;
  SurahDetailScreen(this.surahNumber);

  @override
  _SurahDetailScreenState createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {

  var utils = AppUtils();
  var sliderValue = 10.0;
  late SurahDetailsApiResponse surahDetails;
  late  QuranSurahApiResponse quranSurah ;
  late AudioFilesApiResponse audioFiles;
  var isLoading = false;
  var playingAyah = 1;

  // AudioPlayer audioPlayer = AudioPlayer();
  bool isPlayingAudio =false;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getData();

  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    // audioPlayer.pause();
    // audioPlayer.dispose();
    super.dispose();
  }

  onComplete(){
    print("on complete called"+widget.surahNumber.toString()+":"+playingAyah.toString());

    // if( surahDetails != null && surahDetails.data.ayahs.length<playingAyah-1)
      {
        playingAyah++;
        var details = audioFiles.audioFiles.where((e)=>e.verseKey==widget.surahNumber.toString()+":"+playingAyah.toString()).first;
        play(details.url);
        print(playingAyah.toString());
      }
  }


  getData() async {
    await getAudio();
    await getDetails(widget.surahNumber);
    await getSuranList();
    setState(() {});
    // audioPlayer.onPlayerCompletion.listen((event) {
    //   onComplete();
    // }
    // );
  }


  play(url) async {
    print("https://verses.quran.com/"+url);

    // int result = await audioPlayer.play("https://verses.quran.com/"+url);

    // if (result == 1) {
    //   isPlayingAudio = true;
    // }
    // else{
    //   isPlayingAudio = false;
    // }
  }

  pause() async {

    // int result = await audioPlayer.pause();

    // if (result == 1) {
    //   isPlayingAudio = false;
    //   setState(() { });
    // }
    // else{
    //   isPlayingAudio = true;
    //   setState(() {});
    // }
  }

  resume() async{
    // int result = await audioPlayer.resume();
    // if (result == 1) {
    //   isPlayingAudio = true;
    //   setState(() {});
    // }
    // else{
    //   isPlayingAudio = false;
    //   setState(() {});
    // }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // ignore: unnecessary_null_comparison
        child:  quranSurah==null?Container(child: Center(child: CupertinoActivityIndicator(),),)
            : Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: greenColor.withOpacity(.1),
              child:  Column(
                children: [
                  SizedBox(height: 50,),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      height: double.infinity,
                      decoration: BoxDecoration(color: whiteColor,borderRadius: BorderRadius.circular(10),boxShadow: utils.boxShadow()),
                      child:ListView(
                        children: [
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Surah "+widget.surahNumber.toString()+"".toUpperCase(),style: utils.subTitleTextStyle(greenColor),),
                            ],
                          ),
                          SizedBox(height: 20,),
                          for(var item in quranSurah.data)
                            InkWell(
                              onTap:() async {
                                if(widget.surahNumber==item.number)
                                  {
                                    return;
                                  }
                                widget.surahNumber = item.number;

                                getDetails(widget.surahNumber);

                              },
                              child: listItem(widget.surahNumber==item.number?true:false,item),
                            ),
                          SizedBox(height: 120,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                ],
              ),
            ),
            Positioned(
              left: 30,
              bottom: 40,
              child: utils.musicPlayer(
                isPlaying: isPlayingAudio,
                onPlayPause:(){
                  if(isPlayingAudio)
                    {
                      pause();

                    }else
                      {
                        resume();
                      }
                },
                // filePath: audioFiles.audioFiles.where((element) => element.verseKey)
                  surahName: quranSurah.data.where((element) => element.number==widget.surahNumber).first.englishName,
                sliderValue: sliderValue,
                  onChange: (val){
                    sliderValue = val;
                    setState(() {});},
                    onNext:  (){
                    setState(() {
                      if(widget.surahNumber <= 1)
                      {
                        Future.delayed(Duration(seconds: 1));
                      }

                      widget.surahNumber++;
                      getDetails(widget.surahNumber);

                    });},
                    onPrevious: (){
                    if(widget.surahNumber <=1)
                    {
                      return;
                    }
                    widget.surahNumber--;
                     getDetails(widget.surahNumber);

                  },

              )),
            isLoading?Positioned(
              top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: greenColor.withOpacity(.2),
                  child: CupertinoActivityIndicator(),
                )
            ):Positioned(top:0,right:0,child: Container(height: 1,),)
          ],
        ),
      ),
    );
  }



  listItem(isActive,surah.Data surah)
  {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Wrap(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                    decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomLeft: Radius.circular(25))
                    ),
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.play_circle_fill,color: whiteColor,),
                        SizedBox(width: 15,),
                        Text(surah.englishName,style: utils.labelTextStyle(whiteColor),),
                        SizedBox(width: 15,),
                        Icon(isActive?CupertinoIcons.chevron_up:CupertinoIcons.chevron_down,color: whiteColor,size: 20,),
                        SizedBox(width: 5,)
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 10,),
          !isActive||isLoading ? Container()
              :Visibility(
            visible: isActive,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child:Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                alignment: WrapAlignment.end,
                direction: Axis.horizontal,
                children: [
                  for(var i=0 ; i<surahDetails.data.ayahs.length*2;i++)
                    i%2!=0?Text(surahDetails.data.ayahs[i==0?0:(i~/2).toInt()].text,style: utils.quranTextStyle(blackColor,isArabic:true),textDirection: TextDirection.rtl, textAlign: TextAlign.start,)
                        :i==0?Container():Container(
                      padding: EdgeInsets.all(4),
                      margin: EdgeInsets.only(left: 4),
                      decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: greenColor,width: 1.5)),
                      child: Text((
                          surahDetails.data.ayahs[i==0?0:(i~/2).toInt()].numberInSurah-1).toString().length<2
                          ?" "+(surahDetails.data.ayahs[i==0?0:(i~/2).toInt()].numberInSurah-1).toString()+" "
                          :(surahDetails.data.ayahs[i==0?0:(i~/2).toInt()].numberInSurah-1).toString(),
                        style: utils.smallTextStyle(greenColor),),
                    ),
                 ],
              )
            ),
          ),

          SizedBox(height: 10,),
        ],
      ),
    );
  }

  getSuranList()
  async {
    var apis = QuranApis();
    Response response = await apis.getAllSurahList();
    if(response.statusCode == 200)
    {
      quranSurah = QuranSurahApiResponse.fromJson(jsonDecode(response.body));

    }
    else
    {
      // utils.showToast("Some error to get surah list", context);
    }
  }

  getDetails(number)
  async {

    isLoading=true;
    setState(() {});

    var apis = QuranApis();

    Response response = await apis.getSurahDetails(number);

    if(response.statusCode == 200)
    {
      print("myDeata"+response.body);
      surahDetails = SurahDetailsApiResponse.fromJson(jsonDecode(response.body));

      // ignore: unnecessary_null_comparison
      if(audioFiles!=null && surahDetails.data.ayahs.length>0){
        var item  = audioFiles.audioFiles.where((e) => e.verseKey==number.toString()+":1").first;
        playingAyah=1;
        play(item.url);
      }
      isLoading=false;
      // play(surahDetails.data.ayahs.first.)
      setState(() {});
    }
    else
    {
      // utils.showToast("Some error to get surah list", context);
    }
  }

  getAudio() async {

    var apis = QuranApis();
    Response response = await apis.getSingleRecitationAudio(activeReciter);
    if(response.statusCode == 200)
    {
       audioFiles = AudioFilesApiResponse.fromJson(jsonDecode(response.body));
    }
    else
    {
      // utils.showToast("Some error to get audio", context);
    }
  }

}
